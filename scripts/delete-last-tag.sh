#!/usr/bin/env bash
last_tag=$(git tag -l | tail -1)
if [ -z "${last_tag}" ]; then
  echo "No tags"
  exit 0
fi
git tag -d ${last_tag}