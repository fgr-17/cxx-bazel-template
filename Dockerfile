FROM ubuntu:20.04@sha256:ca5534a51dd04bbcebe9b23ba05f389466cf0c190f1f8f182d7eea92a9671d00

ARG TARGETARCH

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    unzip \
    bash \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN curl -Lo /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/v1.17.0/bazelisk-linux-${TARGETARCH} && \
    chmod +x /usr/local/bin/bazel

RUN bazel --version

WORKDIR /workspace
