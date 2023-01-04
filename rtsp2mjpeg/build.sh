#!/bin/bash
#docker buildx build --progress=plain --no-cache --push --platform linux/386,linux/arm/v6,linux/arm/v7,linux/arm64,linux/amd64 --tag norskfjellgeit/ha-rtsp2mjpeg:1.0.0 .
#docker buildx build --progress=plain --no-cache --push --platform linux/aarch64,linux/amd64 --tag norskfjellgeit/ha-rtsp2mjpeg:1.0.0 .
docker buildx build --progress=plain --push --platform linux/386,linux/arm/v6,linux/arm/v7,linux/aarch64,linux/amd64 --tag norskfjellgeit/ha-rtsp2mjpeg:1.0.0 .