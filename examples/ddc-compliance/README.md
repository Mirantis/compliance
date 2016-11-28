# DDC Compliance Documentation Sample

Included is a sample `opencontrol.yaml` file that imports the DDC components and supports the generation of FedRAMP Moderate compliance documentation.

The steps below can be used to import the OpenControl dependencies and serve a GitBook. Both the compliance-masonry and gitbook-cli tools should be installed.

1. Retrieve dependencies

```sh
compliance-masonry get
```

2. Generate GitBook

```sh
compliance-masonry docs gitbook FedRAMP-moderate
```

3. Serve GitBook locally

```sh
cd exports
gitbook serve
```

A Makefile has also been included for running these same steps:

```sh
make clean serve
```