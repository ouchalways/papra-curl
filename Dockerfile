ARG PAPRA_VERSION=latest
FROM ghcr.io/papra-hq/papra:${PAPRA_VERSION}

LABEL org.opencontainers.image.source="https://github.com/ouchalways/papra-with-curl"

USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

# Restore non-root user (verify exact user with: docker inspect --format='{{.Config.User}}' ghcr.io/papra-hq/papra:latest)
# USER 1000
