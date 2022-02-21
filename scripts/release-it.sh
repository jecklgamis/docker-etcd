#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source ${SCRIPT_DIR}/release-version.sh
source ${SCRIPT_DIR}/docker-image-info.sh

echo "Releasing ${APP_NAME}-${VERSION}"
${SCRIPT_DIR}/build-app.sh \
&& ${SCRIPT_DIR}/create-tag.sh \
&& ${SCRIPT_DIR}/build-image-from-tag.sh \
&& ${SCRIPT_DIR}/push-to-docker-registry.sh
