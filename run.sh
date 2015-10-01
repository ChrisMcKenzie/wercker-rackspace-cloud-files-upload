#!/bin/bash

if [ ! -n "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_TOKEN" ]; then
  error 'Please specify token property'
  exit 1
fi

if [ ! -n "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_USERNAME" ]; then
  error 'Please specify username property'
  exit 1
fi

if [ ! -n "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_CONTAINER" ]; then
  error 'Please specify container property'
  exit 1
fi

if [ ! -n "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_PATH" ]; then
  error 'Please specify path property'
  exit 1
fi

if [ ! -n "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_FILE_PATH" ]; then
  error 'Please specify path property'
  exit 1
fi

if [ ! -n "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_REGION" ]; then
  error 'Please specify region property'
  exit 1
fi

python "$WERCKER_STEP_ROOT/main.py" "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_REGION" "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_USERNAME" "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_TOKEN" "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_PATH" "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_FILE_PATH" "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_CONTAINER"
