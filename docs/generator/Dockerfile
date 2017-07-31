FROM golang:latest AS builder
WORKDIR /go/src/github.com/docker/compliance/docs/generator
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o generator .

FROM scratch
COPY --from=builder /go/src/github.com/docker/compliance/docs/generator .
ENTRYPOINT ["/generator"]
