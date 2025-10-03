#!/bin/bash
# Exit on any error
set -e

# Generate a random suffix
RANDOM_SUFFIX=$RANDOM
REGION="eu-west-2"

# Bucket name
BUCKET_NAME="terraform-backend-state-$RANDOM_SUFFIX"

# Create the S3 bucket (for us-east-1)
aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --region "$REGION"      \
    --create-bucket-configuration LocationConstraint="$REGION"
    
# Enable versioning (optional but recommended for Terraform state)
#aws s3api put-bucket-versioning \
#    --bucket "$BUCKET_NAME" \
#    --versioning-configuration Status=Enabled

echo "S3 bucket for Terraform backend created: $BUCKET_NAME"
