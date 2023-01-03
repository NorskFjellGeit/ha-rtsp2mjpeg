ARG BUILD_FROM=ghcr.io/hassio-addons/base:12.2.7
FROM ${BUILD_FROM}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG TARGETPLATFORM
ARG BUILDPLATFORM

WORKDIR /tmp

RUN apk add --no-cache python3 py3-pip

COPY rootfs /

RUN pip3 install -r /opt/rtsp2mjpeg/requirements.txt

