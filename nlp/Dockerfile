FROM golang:1.7.3
ADD . /go/src/github.com/docker/compliance/nlp
WORKDIR /go/src/github.com/docker/compliance/nlp
RUN go install
CMD ["/go/bin/nlp"]