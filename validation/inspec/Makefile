.PHONY: FedRAMP

default: validate-fedramp-moderate

validate-fedramp-moderate:
	inspec exec FedRAMP/Moderate --attrs profile-attribute.yml

validate-fedramp-high:
	inspec exec FedRAMP/High --attrs profile-attribute.yml
