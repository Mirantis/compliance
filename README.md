# Docker Datacenter Compliance Controls [![CircleCI](https://circleci.com/gh/docker/ddc-opencontrol/tree/master.svg?style=svg&circle-token=daeaf5acd7ac08000ea727cbf8ec9baa8ded8da4)](https://circleci.com/gh/docker/ddc-opencontrol/tree/master)

**This content is not yet complete.**

Contained within this repository is compliance information for Docker Datacenter as it pertains to NIST-800-53 Rev 4 security controls and the FedRAMP Moderate baseline. This data adheres to the [OpenControl](http://open-control.org/) schema for building compliance documentation and can be used as part of your own ATO review process.

> This content is provided for informational purposes only and has not been vetted by any third-party security assessors. You are solely responsible for developing, implementing, and managing your applications and/or subscriptions running on your own platform in compliance with applicable laws, regulations, and contractual obligations. The documentation is provided "as-is" and without any warranty of any kind, whether in express, implied or statutory, and Docker, Inc expressly disclaims all warranties or mechantability fitness for a particular purpose, or non-infringement.

System Security Plan (SSP) Templates for Docker Datacenter that also contain this content as it applies to a specific cloud provider can be obtained by contacting [compliance@docker.com](mailto:compliance@docker.com). Templates are available for the following providers:

- Microsoft Azure Government (based on [Azure Blueprint](https://blogs.msdn.microsoft.com/azuregov/2016/10/12/azure-blueprint-architecting-secure-solutions-just-got-easier/))
- AWS GovCloud (coming soon)

## Component Validation

The OpenControl schema is defined by the [Kwalify](http://www.kuwata-lab.com/kwalify/) schema validator and YAML parser. Each Docker Datacenter component definition is tested against this schema using the [PyKwalify](https://github.com/Grokzen/pykwalify) Python port of the Kwalify specification. This repository contains a Dockerfile for running the component tests within a container.

```sh
docker build -t docker/ddc-opencontrol .
docker run docker/ddc-opencontrol
```