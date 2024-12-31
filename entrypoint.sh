#!/bin/bash

set -e

API_key=$1
PROJECT_ID=$2
DIRECTORY_PATH=$3
ENVIRONMENT=$4


if [ -z "$API_key" ]; then
  echo "Error: API key is missing"
  exit 1
fi

if [ -z "$PROJECT_ID" ]; then
    echo "Error: Project id is misssing"
    exit 1
fi

if [ -z "$ENVIRONMENT"]; then
    echo "Error: Enviroment is missing"
    exit 1
fi


if !git diff --quiet HEAD^ -- "$DIRECTORY_PATH"; then
echo "Changes detected. Deploying to $ENVIRONMENT"
amp deploy "$DIRECTORY_PATH" --key "$API_key" --project "$PROJECT_ID"
echo "::set-output name=deployment_status::success"
else
echo "No Changes detected in $DIRECTORY_PATH. Skipping deployment"
echo "::set-output name=deployment_status::skipped"
fi
