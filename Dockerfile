# Use the official image as the base
FROM ghcr.io/papra-hq/papra:latest

# Link the image to your GitHub repository
LABEL org.opencontainers.image.source=https://github.com/ouchalways/papra-with-curl

# Install curl and clean up apt cache in one layer
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*
