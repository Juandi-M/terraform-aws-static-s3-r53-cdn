terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Default AWS provider (used for S3, Route 53, etc.)
provider "aws" {
  region = var.aws_region
}

# AWS provider in us-east-1 for ACM certificates used by CloudFront
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
