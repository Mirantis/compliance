package textanalytics

import (
	"strings"

	"math"

	textAnalyticsClient "github.com/docker/compliance/nlp/textanalytics/client"
	"github.com/docker/compliance/nlp/textanalytics/client/operations"
	"github.com/docker/compliance/nlp/textanalytics/models"
	"github.com/docker/compliance/nlp/types"
	uuid "github.com/satori/go.uuid"
)

// TextAnalyzer is used to make all API calls and embeds the generated API client type
type TextAnalyzer struct {
	*textAnalyticsClient.TextAnalytics
	TextAnalyticsAPIKey string
	OperationResource   *Resource
	ControlKeyMapping   []map[string]string
}

// Validation is used to hold the result of a key phrase validation for a
// specific component
type Validation struct {
	ComponentName string
	MatchResult   map[string]MatchResult
}

// MatchResult holds the results of a actual vs expected key phrase matches
type MatchResult struct {
	Matches  int
	Expected int
	Score    int
}

// New generates a new TextAnalyzer with the Default text analytics client type
func New(textAnalyticsAPIKey string) *TextAnalyzer {
	return &TextAnalyzer{
		TextAnalytics:       textAnalyticsClient.Default,
		TextAnalyticsAPIKey: textAnalyticsAPIKey,
	}
}

// DetectComponentTopics submits all component narratives to the topic detection API
func (ta *TextAnalyzer) DetectComponentTopics(components []types.Component) (string, error) {
	detectTopicsParams := operations.NewDetectTopicsParams()
	detectTopicsParams.SetOcpApimSubscriptionKey(&ta.TextAnalyticsAPIKey)

	topicDetectionInput := models.TopicDetectionInputV2{}

	// Include each component's control narrative as part of the topic detection request
	for _, component := range components {
		for _, satisfy := range component.Satisfies {
			for _, narrative := range satisfy.Narrative {
				topicDetectionInput.Documents = append(topicDetectionInput.Documents, &models.InputV2{
					ID:   strings.Replace(uuid.NewV4().String(), "-", "", -1),
					Text: strings.Replace(narrative.Text, "\n", " ", -1),
				})
			}
		}
	}

	topicDetectionInput.StopWords = []string{}
	topicDetectionInput.TopicsToExclude = []string{}

	detectTopicsParams.SetTopicDetectionInputV2(&topicDetectionInput)
	ok, err := ta.Operations.DetectTopics(detectTopicsParams)
	if err != nil {
		return "", err
	}

	return ok.OperationLocation, nil
}

// DetectComponentKeyPhrases submits all component narratives to the key phrases analysis API
func (ta *TextAnalyzer) DetectComponentKeyPhrases(components []types.Component) ([]*models.KeyPhraseBatchResultItemV2, error) {
	keyPhrasesParams := operations.NewKeyPhrasesParams()
	keyPhrasesParams.SetOcpApimSubscriptionKey(&ta.TextAnalyticsAPIKey)

	batchInput := models.MultiLanguageBatchInputV2{}

	// Include each component's control narrative as part of the key phrases detection request
	for _, component := range components {
		for _, satisfy := range component.Satisfies {
			for _, narrative := range satisfy.Narrative {
				batchInput.Documents = append(batchInput.Documents, &models.MultiLanguageInputV2{
					ID:       narrative.ID,
					Language: "en",
					Text:     strings.Replace(narrative.Text, "\n", " ", -1),
				})
			}
		}
	}

	keyPhrasesParams.SetMultiLanguageBatchInputV2(&batchInput)

	ok, err := ta.Operations.KeyPhrases(keyPhrasesParams)
	if err != nil {
		return nil, err
	}

	return ok.Payload.Documents, nil
}

// DetectStandardKeyPhrases submits the NIST 800-53 standard to the key phrases analysis API
func (ta *TextAnalyzer) DetectStandardKeyPhrases(standard types.NIST80053Standard) ([]*models.KeyPhraseBatchResultItemV2, error) {
	keyPhrasesParams := operations.NewKeyPhrasesParams()
	keyPhrasesParams.SetOcpApimSubscriptionKey(&ta.TextAnalyticsAPIKey)

	batchInput := models.MultiLanguageBatchInputV2{}

	for _, v := range standard {
		batchInput.Documents = append(batchInput.Documents, &models.MultiLanguageInputV2{
			ID:       v.ID,
			Language: "en",
			Text:     v.Description,
		})
	}

	keyPhrasesParams.SetMultiLanguageBatchInputV2(&batchInput)

	ok, err := ta.Operations.KeyPhrases(keyPhrasesParams)
	if err != nil {
		return nil, err
	}

	return ok.Payload.Documents, nil
}

// ValidateKeyPhrases iterates through the analyzed component key phrases
// and NIST 800-53 key phrases, checks for matching strings and returns
// a map of the match results
//
// ** This function needs to be cleaned up since the structure of
// the loop is confusing
func ValidateKeyPhrases(components []types.Component, standard types.NIST80053Standard, componentKeyPhraseResults []*models.KeyPhraseBatchResultItemV2, standardKeyPhraseResults []*models.KeyPhraseBatchResultItemV2) []Validation {

	validations := []Validation{}

	for _, component := range components {
		validation := Validation{}
		validation.MatchResult = map[string]MatchResult{}
		validation.ComponentName = component.Name
		for _, satisfy := range component.Satisfies {
		Narrative:
			for _, narrative := range satisfy.Narrative {
				for _, componentKeyPhraseResult := range componentKeyPhraseResults {
					if narrative.ID == componentKeyPhraseResult.ID {
						for _, standardKeyPhraseResult := range standardKeyPhraseResults {
							if standard[satisfy.ControlKey].ID == standardKeyPhraseResult.ID {
								var matchCount int
								for _, phrase := range componentKeyPhraseResult.KeyPhrases {
									if searchKeyPhrases(phrase, standardKeyPhraseResult.KeyPhrases) {
										matchCount++
									}
								}
								score := float64(matchCount) / float64(len(standardKeyPhraseResult.KeyPhrases)) * 10
								roundedScore := round(score)
								validation.MatchResult[satisfy.ControlKey] = MatchResult{
									Matches:  matchCount,
									Expected: len(standardKeyPhraseResult.KeyPhrases),
									Score:    roundedScore,
								}
								continue Narrative
							}
						}
					}
				}
			}
		}
		validations = append(validations, validation)
	}

	return validations
}

func searchKeyPhrases(a string, keyPhrases []string) bool {
	for _, phrase := range keyPhrases {
		if strings.ToLower(phrase) == strings.ToLower(a) {
			return true
		}
	}

	return false
}

func round(num float64) int {
	return int(num + math.Copysign(0.5, num))
}
