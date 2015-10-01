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

"$WERCKER_STEP_ROOT/wercker-rackspace-cloud-files-upload" -region "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_REGION" -user "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_USERNAME" -key "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_TOKEN" -path "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_PATH" -file "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_FILE_PATH" -container "$WERCKER_RACKSPACE_CLOUD_FILES_UPLOAD_CONTAINER"
