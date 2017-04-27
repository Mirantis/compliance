FROM golang:1.7.3
ADD . /go/src/github.com/docker/compliance/nlptooling/nlputil
WORKDIR /go/src/github.com/docker/compliance/nlptooling/nlputil
RUN go install
ENTRYPOINT ["/go/bin/nlputil"]