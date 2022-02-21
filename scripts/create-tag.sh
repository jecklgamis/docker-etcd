#!/usr/bin/env bash
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "${BRANCH}" != "main" ]; then
  echo "You are not in the main branch!"
  exit 1
fi

source ${SCRIPT_DIR}/release-version.sh
git tag -a ${VERSION} -m "${VERSION}" && echo "Created tag ${VERSION}"
