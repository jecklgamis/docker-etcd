# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Single-node etcd cluster running inside Docker. Based on Ubuntu 22.04 with etcd v3.5.8. Supports running with or without TLS (controlled by `ENABLE_TLS` env var).

## Build and Run Commands

- `make image` — Build the Docker image (`jecklgamis/etcd:main`)
- `make run` — Build nothing; run the container with port 2379 exposed (no TLS)
- `make up` — Build image then run
- `make run-shell` — Start a bash shell inside a new container
- `make exec-shell` — Exec into an already-running container

## Architecture

- **Dockerfile** — Downloads etcd binary from Google storage, copies TLS certs into `/etcd`
- **docker-entrypoint.sh** — Entry point script; checks `ENABLE_TLS` env var to decide whether to start etcd with TLS flags
- **TLS certs** — `ca.pem`, `server.pem`, `server-key.pem` are dummy self-signed certs generated with `cfssl`. The server cert has CN=`etcd` and SAN=`localhost`

## CI

GitHub Actions workflow (`.github/workflows/build.yml`) builds and pushes the Docker image to Docker Hub on pushes to `main` and version tags (`v*`).
