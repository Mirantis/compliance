FROM golang:1.7.3
ADD . /go/src/github.com/docker/compliance-opencontrol/nlp
WORKDIR /go/src/github.com/docker/compliance-opencontrol/nlp
RUN go install
CMD ["/go/bin/nlp"]