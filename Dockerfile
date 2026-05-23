# Use the official image as the base
FROM ghcr.io/papra-hq/papra:latest

# Install curl and clean up apt cache in one layer to minimize image size
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*
LABEL org.opencontainers.image.source=https://github.com/ouchalways/papra-with-curl
