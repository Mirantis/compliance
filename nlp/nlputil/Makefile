.PHONY: vendor

default: build

vendor:
	govendor add +external
	govendor install

test: vendor
	go vet `go list ./... | grep -v /vendor/`
	go test -v -race `go list ./... | grep -v /vendor/`

build: test
	docker build -t docker/compliance-nlputil:latest .

