FROM debian:jessie-slim

RUN apt-get update && \
    apt-get install -y git dh-make build-essential autoconf autotools-dev lsb-release devscripts
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y -q --profile minimal
ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /package

LABEL RUN="podman run -it --rm --net=host -v pkg:/package/:Z IMAGE"
ENTRYPOINT ["/bin/bash", "-l", "-c"]
