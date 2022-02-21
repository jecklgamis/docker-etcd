#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
BUILD_DIR="$(cd ${SCRIPT_DIR}/.. && pwd)"

echo "Building app in ${BUILD_DIR}"
