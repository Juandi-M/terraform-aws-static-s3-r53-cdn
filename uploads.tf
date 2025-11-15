########################################
# Optional static file upload
########################################
# If static_site_dir is non-empty, upload files from that folder to S3.
# Note: Terraform will read the directory at plan/apply time.

locals {
  static_enabled = var.static_site_dir != ""
  static_files   = local.static_enabled ? fileset(var.static_site_dir, "**") : []
}

resource "aws_s3_object" "static_files" {
  for_each = { for file in local.static_files : file => file }

  bucket = aws_s3_bucket.site.id
  key    = each.key
  source = "${var.static_site_dir}/${each.key}"
  etag   = filemd5("${var.static_site_dir}/${each.key}")

  # Basic content-type detection based on extension
  content_type = lookup(
    {
      ".html" = "text/html"
      ".htm"  = "text/html"
      ".css"  = "text/css"
      ".js"   = "application/javascript"
      ".json" = "application/json"
      ".png"  = "image/png"
      ".jpg"  = "image/jpeg"
      ".jpeg" = "image/jpeg"
      ".gif"  = "image/gif"
      ".svg"  = "image/svg+xml"
      ".ico"  = "image/x-icon"
    },
    regex("\.[^.]+$", each.key),
    null
  )

  depends_on = [
    aws_s3_bucket_website_configuration.site
  ]
}
