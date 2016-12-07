default: run

clean:
	rm -rf DTR/ CSEngine/ UCP/
	docker rmi -f docker/ddc-opencontrol-nlp

vendor:
	govendor add +external

test: vendor
	go vet `go list ./... | grep -v /vendor/`
	go test -v -race `go list ./... | grep -v /vendor/`

build: test
	cp -r ../DTR . && cp -r ../CSEngine . && cp -r ../UCP .
	docker build -t docker/ddc-opencontrol-nlp .
	rm -rf DTR/ CSEngine/ UCP/

run: build
	docker run --rm -e "TEXT_ANALYTICS_API_KEY=$$TEXT_ANALYTICS_API_KEY" docker/ddc-opencontrol-nlp