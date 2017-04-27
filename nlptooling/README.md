# Natural Language Processing Utilities for Docker Enterprise Edition Security and Compliance

> All tooling in this project is currently experimental and subject to change.

This repository contains various tools that utilize natural language processing services provided by [Microsoft Cognitive Services](https://www.microsoft.com/cognitive-services) to enhance the Docker Enterprise Edition security and compliance story.  The tooling currently only integrates with the NIST-800-53 OpenControl-formatted content in the root of this repo.

## nlputil

nlputil is a command-line utility written in Go that executes various analytics operations against the NIST-800-53 compliance documentation for Docker EE. We use this tool to validate that the Docker Enterprise Edition component narratives adhere to the NIST 800-53 security control specifications.

The application is contained within the [`nlputil/`](https://github.com/docker/compliance/tree/master/nlptooling/nlputil) folder and packaged using the included Dockerfile. In order to run the tool, you must provide your own Cognitive Services Text Analytics API key. This can be done via an environment variable or command-line flag passed to the container. We run this tool as part of the CircleCI test phase.

### Key Phrase Extraction

Thorough documentation of the relevant security controls for each of the Docker EE components is a critical aspect of our compliance efforts. It's imperative that not only is each control satisfied, but that the contents of the actual narratives match that which is defined by NIST 800-53.

The tool can parse each component control's narratives and submit them to the [Text Analytics API](https://www.microsoft.com/cognitive-services/en-us/text-analytics-api) for detection of key phrases (e.g. "access control", "authentication", etc). The key phrases are then checked against the key phrases that represent each of the [NIST 800-53 definitions](https://nvd.nist.gov/800-53/) to ensure that the content indeed matches. The match process is currently quite basic. A successful match occurs when a component's narrative includes one or more of the key phrases that are also in the list of key phrases representative of the NIST definition itself. You can think of this as a form of automated proofreading.

nlputil is built with [Go 1.7+](https://golang.org/). Dependencies are vendored with [govendor](https://github.com/kardianos/govendor), and the application is packaged with Docker.

The tool uses the [Microsoft Cognitive Services Text Analytics API](https://www.microsoft.com/cognitive-services/en-us/text-analytics-api) to analyze the component narratives. [go-swagger](https://goswagger.io/) is used to generate the API client based on the Swagger definition [here](https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/export?DocumentFormat=Swagger&ApiName=Azure%20Machine%20Learning%20-%20Text%20Analytics).

```sh
swagger generate client \
  -f https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/export?DocumentFormat=Swagger&ApiName=Azure%20Machine%20Learning%20-%20Text%20Analytics \
  -t textanalytics/ \
  -A TextAnalytics

go get -u -f textanalytics/...
```

### Usage

```sh
# Build image
docker build -t docker/compliance-nlputil:latest .

# Run command with specified arguments (assuming the TEXT_ANALYTICS_API_KEY variable is set in your shell)
docker run -e TEXT_ANALYTICS_API_KEY docker/compliance-nlputil:latest 

Usage:
  nlputil [command]

Available Commands:
  analyze     Run text analysis

Use "nlputil [command] --help" for more information about a command.
```

## Compliance Bot

The compliance bot is a question and answer chat bot built on the [Microsoft Bot Framework](https://dev.botframework.com/) and the [Language Understanding Intelligent Service](https://www.microsoft.com/cognitive-services/en-us/language-understanding-intelligent-service-luis). The source is housed in the [`bot/`](https://github.com/docker/compliance/tree/master/nlptooling/bot) directory and the [`luis/`](https://github.com/docker/compliance/tree/master/nlptooling/luis) folder contains the LUIS app JSON file used to train the language model.

The compliance bot is built with [Node.js v6.9.4 LTS](https://nodejs.org/en/) using the Microsoft Bot Framework [Node.js SDK](https://github.com/Microsoft/BotBuilder) and packaged for both Docker and [Azure Functions](https://azure.microsoft.com/en-us/services/functions/). 

### Usage

The bot can be started with a simple `npm start` command or built and run with the included Dockerfile.