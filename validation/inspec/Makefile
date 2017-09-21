.PHONY: FedRAMP

default: validate-fedramp-moderate

validate-fedramp-moderate:
	inspec exec FedRAMP/Moderate --attrs profile-attribute.yml

validate-fedramp-high:
	inspec exec FedRAMP/High --attrs profile-attribute.yml

build-docker:
	docker build -t docker/compliance-inspec .

run-docker: build-docker
	docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$$PWD":/share docker/compliance-inspec exec FedRAMP/Moderate --attrs profile-attribute.yml
