FROM ghcr.io/hassio-addons/base:13.0.0

ARG TARGETPLATFORM
ARG BUILDPLATFORM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /tmp

RUN apk add --no-cache nginx nginx-mod-rtmp ffmpeg

COPY rootfs /



