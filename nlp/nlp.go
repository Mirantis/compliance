package main

import (
	"fmt"
	"log"
	"os"
	"time"

	"sort"

	"github.com/docker/compliance/nlp/parser"
	"github.com/docker/compliance/nlp/textanalytics"
)

var (
	textAnalyticsAPIKey string
	client              *textanalytics.TextAnalyzer
	statusInterval      = 10 * time.Second
)

func main() {
	log.Println("Parsing NIST 800-53 controls")
	standard, err := parser.ParseNISTStandard()
	if err != nil {
		log.Fatalf("Error parsing control file: %v", err)
	}

	log.Println("Parsing components")
	components, err := parser.ParseComponents("DTR", "DockerEE", "UCP", "DSS", "eNZi")
	if err != nil {
		log.Fatalf("Error parsing components: %+v", err)
	}

	client = textanalytics.New(textAnalyticsAPIKey)

	log.Println("Analyzing key phrases from NIST 800-53 standard")
	standardKeyPhrases, err := client.DetectStandardKeyPhrases(standard)
	if err != nil {
		log.Fatalf("Error analyzing standard key phrases: %v", err)
	}

	log.Println("Detecting key phrases in component narratives")
	componentKeyPhrases, err := client.DetectComponentKeyPhrases(components)
	if err != nil {
		log.Fatalf("Error analyzing key phrases: %v", err)
	}

	log.Println("Validating component and standard key phrase match")
	validations := textanalytics.ValidateKeyPhrases(components, standard, componentKeyPhrases, standardKeyPhrases)

	for _, validation := range validations {
		fmt.Println("\n-----------------------------------------------------")
		fmt.Printf("Component: %s\n", validation.ComponentName)
		fmt.Println("-----------------------------------------------------")

		// Simple sort
		var keys []string
		for k := range validation.MatchResult {
			keys = append(keys, k)
			sort.Strings(keys)
		}

		for _, k := range keys {
			fmt.Printf("Control Key: %s\tMatch Count: %d\tTotal Key Phrases: %d\tMatch Score: %d\n", k, validation.MatchResult[k].Matches, validation.MatchResult[k].Expected, validation.MatchResult[k].Score)
		}
	}

	/* Topic detection placeholder

	log.Println("Sending component narratives for topic analysis")
	operationLocation, err := client.DetectComponentTopics(components)
	if err != nil {
		log.Fatalf("Error analyzing component narratives: %v", err)
	}

	log.Println("Checking status of topic detection operation")
	operationLocationURL, err := url.Parse(operationLocation)
	if err != nil {
		log.Fatalf("Error parsing operation status URL: %v", err)
	}

	pending, complete := make(chan *textanalytics.Resource), make(chan *textanalytics.Resource)
	status := textanalytics.TopicDetectionStateMonitor(statusInterval)

	go client.TopicDetectionPoller(pending, complete, status)
	client.OperationResource = &textanalytics.Resource{
		OperationID: path.Base(operationLocationURL.Path),
	}
	go func() {
		pending <- client.OperationResource
	}()

	for r := range complete {
		go r.Sleep(pending)
	}

	close(pending)

	log.Println("Topic detection complete")

	*/
}

func init() {
	textAnalyticsAPIKey = os.Getenv("TEXT_ANALYTICS_API_KEY")
	if textAnalyticsAPIKey == "" {
		log.Fatalln("Missing Text Analytics API key")
	}
}
