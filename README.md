# AnnotSV Docker Image

This repository contains a Dockerfile for building a Docker image with [AnnotSV](https://github.com/lgmgeo/AnnotSV) version 3.4.4 and its dependencies.
For more information on using AnnotSV, please refer to the [official AnnotSV documentation](https://lbgi.fr/AnnotSV/Documentation/README.AnnotSV_latest.pdf).

🐋 Docker Image: [docker://papaemmelab/annotsv:3.4.4](https://hub.docker.com/r/papaemmelab/annotsv/tags)

## Description

AnnotSV (Annotation of Structural Variations) is a program designed to annotate and rank Structural Variations (SV). This Dockerfile sets up an environment with AnnotSV and its required tools, making it easy to use AnnotSV in a containerized environment.

## Included Software

- AnnotSV v3.4.4
- BEDTools v2.31.0
- SAMtools v1.21
- BCFtools v1.21
- Other dependencies (wget, git, make, gcc, zlib1g-dev, liblzma-dev, libbz2-dev, libcurl4-gnutls-dev, tcl, pigz)

## Building the Docker Image

To build the Docker image for multiple platforms (amd64 and arm64), run the following command in the directory containing the Dockerfile:

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t papaemmelab/annotsv:3.4.4 . --push
```

## Using AnnotSV with the container

To run the container, use the following command:

```bash
docker run -it --rm papaemmelab/annotsv:3.4.4 \
    annotsv -h
```

For more information on using AnnotSV, please refer to the [official AnnotSV documentation](https://lbgi.fr/AnnotSV/Documentation/README.AnnotSV_latest.pdf).

## License

Please note that while this Dockerfile is provided under the MIT License, the software packages it installs may have their own licenses. Make sure to comply with the licenses of all included software when using this Docker image.

## Contributing

Contributions to improve the Dockerfile or this README are welcome. Please submit a pull request or open an issue to discuss proposed changes.

## Support

For issues related to this Dockerfile, please open an issue in this repository. For issues related to AnnotSV itself, please refer to the [official AnnotSV repository](https://github.com/lgmgeo/AnnotSV).
