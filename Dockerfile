FROM debian:jessie-slim

RUN apt-get update && \
    apt-get install -y git dh-make build-essential autoconf autotools-dev cargo

WORKDIR /package

LABEL RUN="podman run -it --rm --net=host -v pkg:/package/:Z IMAGE"
ENTRYPOINT ["/bin/bash"]
