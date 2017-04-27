package textanalytics

// Adapted from Codewalk: Share Memory By Communicating (https://golang.org/doc/codewalk/sharemem/)

import (
	"log"
	"time"

	"github.com/docker/compliance/nlptooling/nlputil/textanalytics/client/operations"
	"github.com/docker/compliance/nlptooling/nlputil/textanalytics/models"
)

var (
	pollInterval = 30 * time.Second
	errTimeout   = 10 * time.Second
)

// State holds the state of a topic detection operation
type State struct {
	operationID string
	status      string
}

// Resource contains information about an API operation
type Resource struct {
	OperationID               string
	OperationProcessingResult models.OperationProcessingResult
	ErrCount                  int
}

// Sleep induces a waiting period (with added error buffer) before moving the resource to a different state
func (r *Resource) Sleep(done chan<- *Resource) {
	time.Sleep(pollInterval + errTimeout*time.Duration(r.ErrCount))
	done <- r
}

// PollTopicDetectionStatus polls the API for the status of a topic detection operation
func (ta *TextAnalyzer) PollTopicDetectionStatus() string {
	operationStatusParams := operations.NewOperationStatusParams()
	operationStatusParams.SetOcpApimSubscriptionKey(&ta.TextAnalyticsAPIKey)
	operationStatusParams.SetOperationID(ta.OperationResource.OperationID)

	ok, err := ta.Operations.OperationStatus(operationStatusParams)
	if err != nil {
		ta.OperationResource.ErrCount++
		return err.Error()
	}
	ta.OperationResource.ErrCount = 0
	ta.OperationResource.OperationProcessingResult = ok.Payload.OperationProcessingResult
	return ok.Payload.Status
}

// TopicDetectionPoller initiates operation polling jobs
func (ta *TextAnalyzer) TopicDetectionPoller(in <-chan *Resource, out chan<- *Resource, status chan<- State) {
	for r := range in {
		s := ta.PollTopicDetectionStatus()
		if s == "Succeeded" {
			close(out)
			return
		}
		status <- State{ta.OperationResource.OperationID, s}
		out <- r
	}
}

// TopicDetectionStateMonitor updates the state of a topic detection operation based on a given update interval
func TopicDetectionStateMonitor(updateInterval time.Duration) chan<- State {
	updates := make(chan State)
	operationStatus := make(map[string]string)
	ticker := time.NewTicker(updateInterval)
	go func() {
		for {
			select {
			case <-ticker.C:
				logState(operationStatus)
			case s := <-updates:
				operationStatus[s.operationID] = s.status
			}
		}
	}()
	return updates
}

func logState(s map[string]string) {
	for k, v := range s {
		log.Printf("OperationID[%s]: %s\n", k, v)
	}
}
