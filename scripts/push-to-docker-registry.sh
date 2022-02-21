#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source ${SCRIPT_DIR}/release-version.sh
source ${SCRIPT_DIR}/docker-image-info.sh

docker image push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
