#!/bin/sh
set -e

BUCKET_NAME="${SPOT_AWS_BUCKET_NAME:-spot-media-local}"
REGION="${SPOT_AWS_REGION:-us-east-1}"

echo "[localstack-init] ensuring s3 bucket: ${BUCKET_NAME}"
awslocal s3api create-bucket --bucket "${BUCKET_NAME}" --region "${REGION}" 2>/dev/null || true
awslocal s3api put-bucket-versioning --bucket "${BUCKET_NAME}" --versioning-configuration Status=Enabled 2>/dev/null || true
echo "[localstack-init] bucket ready: ${BUCKET_NAME}"
