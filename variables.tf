variable "aws_region" {
  description = "AWS region for S3 and other resources (CloudFront/ACM still use us-east-1)."
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Root domain name (e.g., example.com). Must have a public hosted zone in Route 53."
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket that will host the static website."
  type        = string
}

variable "static_site_dir" {
  description = "Local path to the static site files to upload to S3 (e.g., WordPress static export)."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Common tags applied to all taggable resources."
  type        = map(string)
  default = {
    Project = "StaticSite"
  }
}
