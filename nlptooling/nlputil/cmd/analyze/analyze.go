package analyze

import (
	"github.com/docker/compliance/nlptooling/nlputil/textanalytics"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

var (
	AnalyzeCmd = &cobra.Command{
		Use:   "analyze",
		Short: "Run text analysis",
		Long:  `Used for various text analysis operations`,
	}

	client *textanalytics.TextAnalyzer
)

func init() {
	var textAnalyticsAPIKey string
	AnalyzeCmd.PersistentFlags().StringVar(&textAnalyticsAPIKey, "api-key", "", "Cognitive Services Text Analytics API Key")
	viper.BindEnv("apikey", "TEXT_ANALYTICS_API_KEY")
	viper.BindPFlag("apikey", AnalyzeCmd.PersistentFlags().Lookup("api-key"))

	AnalyzeCmd.AddCommand(topicsCmd, keyPhrasesCmd)
}
