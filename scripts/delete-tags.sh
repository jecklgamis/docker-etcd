#!/usr/bin/env bash

if [ "$1" = "confirm" ]; then
  echo "Deleting tags for real"
  for a in $(git tag -l); do
    git tag -d ${a}
  done
else
  tags=$(git tag -l)
  if [ -z "${tags}"]; then
    echo "No git tags"
  else
    echo "These tags will be deleted if you execute \"${0} confirm\""
    for a in $(git tag -l); do
      echo "$a"
    done
  fi
fi
