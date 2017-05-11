# Docker Enterprise Edition Compliance Documentation Sample

Included is a sample `opencontrol.yaml` file that imports the Docker EE components and generates compliance documentation for a Moderate ATO. You can use this as a starting point for your own ATO efforts and simply fill in the blanks in the component files in the `./policies/` directory to reflect your organization's own policies and procedures.

The steps below can be used to import the OpenControl dependencies and serve a GitBook. Ensure that Docker is installed on your local workstation. Run the following commands from the root of the `examples/opencontrol/DockerEE-Moderate-ATO` directory.

1. Remove any existing `exports/` and `opencontrols/` directories in your workspace

```sh
rm -rf exports/ opencontrols/
```

2. Retrieve dependencies

```sh
docker run --rm -v "$PWD":/opencontrol -w /opencontrol opencontrolorg/compliance-masonry get
```

3. Generate GitBook

```sh
docker run --rm -v "$PWD":/opencontrol -w /opencontrol opencontrolorg/compliance-masonry docs gitbook FedRAMP-moderate
```

4. Serve GitBook locally

```sh
docker run --rm -it -p 4000:4000 -v "$PWD/exports":/srv/gitbook fellah/gitbook:2.6.7
```

5. Access the generated SSP web site via your browser at http://localhost:4000. You can hit `Ctrl+C` to remove the container.

A Makefile has also been included for running these same steps:

```sh
make clean serve
```