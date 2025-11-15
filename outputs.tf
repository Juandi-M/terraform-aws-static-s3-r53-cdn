########################################
# Outputs
########################################

output "bucket_id" {
  description = "ID (name) of the S3 bucket hosting the static site."
  value       = aws_s3_bucket.site.id
}

output "website_url" {
  description = "S3 static website endpoint URL."
  value       = aws_s3_bucket_website_configuration.site.website_endpoint
}

output "cloudfront_domain" {
  description = "CloudFront distribution domain name."
  value       = aws_cloudfront_distribution.this.domain_name
}

output "cloudfront_id" {
  description = "CloudFront distribution ID."
  value       = aws_cloudfront_distribution.this.id
}

output "cdn_aliases" {
  description = "Custom domain aliases configured for CloudFront."
  value       = aws_cloudfront_distribution.this.aliases
}
