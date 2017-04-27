default: run

clean:
	rm -rf DTR/ CSEngine/ UCP/
	docker rmi -f docker/compliance-nlp

vendor:
	govendor add +external

test: vendor
	go vet `go list ./... | grep -v /vendor/`
	go test -v -race `go list ./... | grep -v /vendor/`

build: test
	cp -r ../DTR . && cp -r ../DockerEE . && cp -r ../DSS . && cp -r ../eNZi . && cp -r ../UCP .
	docker build -t docker/compliance-nlp .
	rm -rf DTR/ DockerEE/ UCP/ DSS/ eNZi/ UCP/

run: build
	docker run --rm -e "TEXT_ANALYTICS_API_KEY=$$TEXT_ANALYTICS_API_KEY" docker/compliance-nlp