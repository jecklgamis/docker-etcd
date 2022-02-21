#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
BUILD_DIR="$(cd ${SCRIPT_DIR}/.. && pwd)"
source ${SCRIPT_DIR}/release-version.sh
source ${SCRIPT_DIR}/docker-image-info.sh

function die() {
  echo $1
  exit 1
}

echo "Switching to ${IMAGE_TAG} branch"
BUILD_BRANCH=build-${IMAGE_TAG}
git checkout -b ${BUILD_BRANCH} ${GIT_TAG} || die ""

echo "Building ${IMAGE_NAME}:${IMAGE_TAG}"
cd ${BUILD_DIR} && docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

git checkout main > /dev/null

echo "Deleting ${BUILD_BRANCH}"
git branch -D ${BUILD_BRANCH}
