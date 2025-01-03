#!/bin/bash

set -e

API_key=$1
PROJECT_ID=$2
DIRECTORY_PATH=$3


if [ -z "$API_key" ]; then
  echo "Error: API key is missing"
  exit 1
fi

if [ -z "$PROJECT_ID" ]; then
    echo "Error: Project id is misssing"
    exit 1
fi

if ! git diff --quiet HEAD^ -- "$DIRECTORY_PATH"; then
echo "Changes detected. Deploying amp file to Ampersand. "
amp deploy "$DIRECTORY_PATH" --key "$API_key" --project "$PROJECT_ID"
echo "deployment_status=skipped" >> $GITHUB_ENV
else
echo "No Changes detected in $DIRECTORY_PATH. Skipping deployment"
echo "deployment_status=success" >> $GITHUB_ENV
fi
