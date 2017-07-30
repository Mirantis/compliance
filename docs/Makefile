.PHONY: vendor

default: run

vendor:
	cd generator; \
	dep ensure

test:
	cd generator; \
	go vet `go list ./... | grep -v /vendor/`; \
	go test -v -race `go list ./... | grep -v /vendor/`

build:
	cp -r ../opencontrol/components generator/
	docker build -t docker/compliance-doc-generator:latest generator/

run: build
	docker run -it --rm -v "$$PWD/compliance/reference/800-53":/800-53 docker/compliance-doc-generator:latest
	rm -rf generator/components
