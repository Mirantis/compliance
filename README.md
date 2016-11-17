# Docker Datacenter Compliance

Contained within this repository is compliance information for Docker Datacenter as it pertains to NIST-800-53 Rev 4 security controls and the FedRAMP Moderate baseline. This data adheres to the [OpenControl](http://open-control.org/) schema for building compliance documentation and can be used as part of your own ATO review process.

System Security Plan (SSP) Templates for Docker Datacenter that also contain this content as it applies to a specific cloud provider can be obtained by contacting [compliance@docker.com](mailto:compliance@docker.com). Templates are available for the following providers:

- Microsoft Azure Government (based on [Azure Blueprint](https://blogs.msdn.microsoft.com/azuregov/2016/10/12/azure-blueprint-architecting-secure-solutions-just-got-easier/))
- AWS GovCloud (coming soon)

## Component Validation

The OpenControl schema is defined by the [Kwalify](http://www.kuwata-lab.com/kwalify/) schema validator and YAML parser. Each Docker Datacenter component definition is tested against this schema using the [PyKwalify](https://github.com/Grokzen/pykwalify) Python port of the Kwalify specification. This repository contains a Dockerfile for running the component tests within a container.

```sh
docker build -t docker/ddc-opencontrol .
docker run docker/ddc-opencontrol
```