provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "secure_logs" {
  bucket = "enterprise-zero-trust-logs"
  acl    = "private"

  tags = {
    Environment = "Dev"
    Project     = "ZeroTrust"
  }
}
