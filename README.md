# Docker Enterprise Edition Compliance Controls [![CircleCI](https://circleci.com/gh/docker/compliance/tree/master.svg?style=svg&circle-token=daeaf5acd7ac08000ea727cbf8ec9baa8ded8da4)](https://circleci.com/gh/docker/compliance/tree/master) [![codecov](https://codecov.io/gh/docker/compliance/branch/master/graph/badge.svg?token=WiRPQcno3c)](https://codecov.io/gh/docker/compliance)

This repository contains compliance information for [Docker Enterprise Edition (EE)](https://www.docker.com/enterprise-edition) at the Basic, Standard and Advanced tiers as it pertains to NIST-800-53 Rev 4 security controls at the [FedRAMP](https://www.fedramp.gov/) Moderate and High baselines. This data adheres to the [OpenControl](http://open-control.org/) schema for building compliance documentation and can be used as part of your own authority to operate (ATO) review process. The documentation generated from this content can be used to assist your organization in authorizing Docker Enterprise Edition in both on-premises/private cloud infrastructure and in public cloud providers.

> This content is provided for informational purposes only and has not been vetted by any third-party security assessors. You are solely responsible for developing, implementing, and managing your applications and/or subscriptions running on your own platform in compliance with applicable laws, regulations, and contractual obligations. The documentation is provided "as-is" and without any warranty of any kind, whether express, implied or statutory, and Docker, Inc. expressly disclaims all warranties for non-infringement, merchantability or fitness for a particular purpose.

Docker also provides pre-built System Security Plan (SSP) templates for authorizing Docker Enterprise Edition on various FedRAMP P-ATO'd IaaS providers, as indicated in the table below. These can be obtained by contacting [compliance@docker.com](mailto:compliance@docker.com). These templates are **not** the offial cloud providers' SSP templates but rather show both the controls inherited from that IaaS provider's P-ATO and the controls applicable to Docker Enterprise Edition. When conducting an ATO, it is still your responsibility to request the provider's official SSP package as appropriate and conduct your own security analysis.

|Provider|Format|Baselines|Status|
|--------|------|---------|------|
|[Microsoft Azure Government](https://azure.microsoft.com/en-us/overview/clouds/government/)|[Azure Blueprint](https://docs.microsoft.com/en-us/azure/azure-government/documentation-government-plan-compliance) (.docx)|Moderate<br>High<br>DoD L4<br>DoD L5|Available<br>Coming Soon<br>Coming Soon<br>Coming Soon|
|[AWS GovCloud](https://aws.amazon.com/govcloud-us/)|TBD|Moderate|Coming soon|

Note that even if a pre-built template for Docker EE is not available for your chosen cloud provider, you can still use the OpenControl-formatted content in this repository to generate your own SSP templates. Much of the content in this repository is identical to that which is provided in the pre-built templates.

## Usage

In order to generate the documentation appropriate to your system, you can either download and install the [Compliance Masonry](https://github.com/opencontrol/compliance-masonry/) command-line tool on to your local workstation or run the official [Compliance Masonry Docker image](https://store.docker.com/community/images/opencontrolorg/compliance-masonry) from the root of this repository as follows:

```sh
docker run --rm -v "$PWD":/opencontrol -w /opencontrol opencontrolorg/compliance-masonry get
docker run --rm -v "$PWD":/opencontrol -w /opencontrol opencontrolorg/compliance-masonry docs gitbook FedRAMP-moderate
```

 Refer to the Compliance Masonry [usage instructions](https://github.com/opencontrol/compliance-masonry/blob/master/docs/usage.md) for more info on the various CLI options. The [`examples/DockerEE-compliance`](https://github.com/docker/compliance/tree/master/examples/DockerEE-compliance) directory contains an example use of this tooling.

In order to meet all of the applicable security controls included in this repository, you must have Docker Enterprise Edition at the Advanced tier and at the versions specified in the table below. The control guidance is separated in to the following components:

|Component Name|Folder|Version|
|--------------|------|-------|
|Docker EE Engine|[`DockerEE/`](https://github.com/docker/compliance/tree/master/DockerEE)|17.03.0-ee|
|Docker Trusted Registry (DTR)|[`DTR/`](https://github.com/docker/compliance/tree/master/DTR)|2.2|
|Docker Security Scanning (DSS)|[`DSS/`](https://github.com/docker/compliance/tree/master/DSS)|2.2|
|Universal Control Plane (UCP)|[`UCP/`](https://github.com/docker/compliance/tree/master/UCP)|2.1|
|Authentication and Authorization Service (eNZi)|[`eNZi/`](https://github.com/docker/compliance/tree/master/eNZi)|2.1|

> Both the UCP and DTR components leverage the eNZi authentication and authorization service component for authentication and authorization across an entire Docker Enterprise Edition cluster at the Standard and Advanced tiers.

Each component is associated with a single `component.yaml` file. These files container the actual security narratives.

Bear in mind that you'll also need to include your own `component.yaml` files that aren't covered by the functionality of Docker Enterprise Edition and that reflect your organization's adherence to the appropriate controls. Typically these are organized in separate component directories for each control familiy (e.g. `AC_Policy/`, `MA_POLICY/`, etc). An example of this can be found at [https://github.com/18F/cg-compliance](https://github.com/18F/cg-compliance).

## Developing

Refer to the [Contributing Guide](https://github.com/docker/compliance/blob/master/CONTRIBUTING.md) for instructions on contributing to this project.

### Component Validation

The OpenControl schema is defined by the [Kwalify](http://www.kuwata-lab.com/kwalify/) schema validator and YAML parser. Each component definition in the Docker Enterprise Edition Advanced tier is tested against this schema using the [PyKwalify](https://github.com/Grokzen/pykwalify) Python port of the Kwalify specification. The Dockerfile in the root of this repository is used only by CircleCI for running the component tests within a container.

### Natural Language Processing [Experimental]

Thorough documentation of the relevant security controls for each of the Docker EE components is a critical aspect of this project. It's imperative that not only is each control satisfied, but that the contents of the actual narratives match that which is defined by NIST 800-53. As such, this project includes experimental support for key phrase text analysis backed by [Microsoft Cognitive Services](https://www.microsoft.com/cognitive-services).

The [`nlp/`](https://github.com/docker/compliance/tree/master/nlp) directory contains a command-line service written in Go that parses each component control's narratives and submits them to the [Text Analytics API](https://www.microsoft.com/cognitive-services/en-us/text-analytics-api) for detection of key phrases (e.g. "access control", "authentication", etc). The key phrases are then checked against the key phrases that represent each of the NIST 800-53 definitions to ensure that the content indeed matches. The match process is currently quite basic. A successful match occurs when a component's narrative includes one or more of the key phrases that are also in the list of key phrases representative of the NIST definition itself. You can think of this as a form of automated proofreading.

Ultimately, this functionality is best served as a compliance-masonry [plugin](https://github.com/opencontrol/compliance-masonry/tree/master/exampleplugin) developed in a separate repository instead of as a standalone tool. Contributions welcome!

The potential use cases for natural language processing in documentation efforts are pretty wide-ranging. As such, our goal with this example is to open the door to new and exciting ways to build security and compliance documentation.
