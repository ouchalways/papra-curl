## Papra with curl

This repository provides an automated, hardened, and updated container image based on `ghcr.io/papra-hq/papra`. The primary purpose of this image is to provide the `curl` utility, which is not included in the base upstream image, enabling broader compatibility for specific integration workflows.

## Features
* **Custom Build:** Extends `ghcr.io/papra-hq/papra:latest` to include `curl`.
* **Automated Updates:** A GitHub Actions workflow monitors the upstream `papra-hq/papra` releases.
* **Safe Delay:** Builds are triggered automatically **48 hours** after a new release is detected, providing a buffer to catch initial upstream bugfixes.
* **Version Pinning:** Every build is tagged with the upstream version and tracked in `latest-version.txt`.
* **x64 Optimized:** Specifically built and validated for `linux/amd64` architecture.

## How it Works
1.  **Scheduled Monitoring:** A daily GitHub Action checks the GitHub API for new releases of `papra-hq/papra`.
2.  **Delay Logic:** If a new version is found, the workflow calculates the release age. Once 48 hours have elapsed, the build process triggers.
3.  **Container Build:** The Dockerfile installs `curl`, cleans up `apt` cache layers, and pushes the image to this repository's Container Registry (`ghcr.io`).
4.  **Tagging:** The image is pushed with two tags:
    * `latest`
    * `[upstream-version]` (e.g., `26.4.2`)

## Usage

You can pull the latest version directly from GitHub Container Registry:

```bash
docker pull ghcr.io/<YOUR_GITHUB_USERNAME>/papra-with-curl:latest
