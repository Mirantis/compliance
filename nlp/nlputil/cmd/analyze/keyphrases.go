package analyze

import (
	"fmt"

	"sort"

	log "github.com/Sirupsen/logrus"
	"github.com/docker/compliance/nlptooling/nlputil/parser"
	"github.com/docker/compliance/nlptooling/nlputil/textanalytics"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

var keyPhrasesCmd = &cobra.Command{
	Use:   "keyphrases",
	Short: "Run key phrase analysis",
	Long:  `Used for key phrase detection`,
	RunE:  runKeyPhrases,
}

func runKeyPhrases(cmd *cobra.Command, args []string) error {

	log.Info("Parsing NIST 800-53 controls")
	standard, err := parser.ParseNISTStandard()
	if err != nil {
		return fmt.Errorf("Error parsing control file: %v", err)
	}

	log.Info("Parsing components")
	components, err := parser.ParseComponents("opencontrols/components")
	if err != nil {
		return fmt.Errorf("Error parsing components: %+v", err)
	}

	client = textanalytics.New(viper.GetString("apikey"))

	log.Info("Analyzing key phrases from NIST 800-53 standard")
	standardKeyPhrases, err := client.DetectStandardKeyPhrases(standard)
	if err != nil {
		return fmt.Errorf("Error analyzing standard key phrases: %v", err)
	}

	log.Info("Detecting key phrases in component narratives")
	componentKeyPhrases, err := client.DetectComponentKeyPhrases(components)
	if err != nil {
		return fmt.Errorf("Error analyzing key phrases: %v", err)
	}

	log.Info("Validating component and standard key phrase match")
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

	return nil
}
