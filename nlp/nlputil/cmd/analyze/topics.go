package analyze

import (
	"fmt"
	"net/url"
	"path"
	"time"

	log "github.com/Sirupsen/logrus"
	"github.com/docker/compliance/nlptooling/nlputil/parser"
	"github.com/docker/compliance/nlptooling/nlputil/textanalytics"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

var (
	statusInterval = 10 * time.Second

	topicsCmd = &cobra.Command{
		Use:   "topics",
		Short: "Run topic detection",
		RunE:  runTopics,
	}
)

func runTopics(cmd *cobra.Command, args []string) error {
	log.Info("Parsing components")
	components, err := parser.ParseComponents("opencontrols/components")
	if err != nil {
		return fmt.Errorf("Error parsing components: %+v", err)
	}

	client = textanalytics.New(viper.GetString("apikey"))

	log.Info("Sending component narratives for topic analysis")
	operationLocation, err := client.DetectComponentTopics(components)
	if err != nil {
		return fmt.Errorf("Error analyzing component narratives: %v", err)
	}

	log.Info("Checking status of topic detection operation")
	operationLocationURL, err := url.Parse(operationLocation)
	if err != nil {
		return fmt.Errorf("Error parsing operation status URL: %v", err)
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

	log.Info("Topic detection complete")

	return nil
}
