# terraform-aws-s3-hosting-r53-cdn

Terraform module for deploying a **static website** on AWS using S3, CloudFront, ACM, and Route 53.  
Provides a clean, reusable baseline for hosting static sites, WordPress exports, or small landing pages.

---

## 🚀 Features

- Static hosting on S3  
- CloudFront global CDN with HTTPS  
- ACM certificate (DNS validated, us-east-1)  
- Route 53 alias records for root + www  
- Optional automatic upload of local static files  
- Minimal inputs, production-ready defaults  

---

## 📦 Architecture

Route 53 → CloudFront → S3

Traffic flows through CloudFront (HTTPS) and ends on an S3 static website bucket.

---

## 📂 Usage Example

```hcl
module "static_site" {
  source = "github.com/your-user/terraform-aws-s3-hosting-r53-cdn"

  domain_name     = "example.com"
  bucket_name     = "example-static"
  static_site_dir = "./site"   # optional

  tags = {
    Project = "StaticSite"
  }
}
```

Run:

```bash
terraform init
terraform apply
```

---

## ⚙️ Inputs

| Variable | Description |
|---------|-------------|
| `domain_name` | Root domain (e.g., `mysite.com`) |
| `bucket_name` | S3 bucket name |
| `static_site_dir` | Optional local folder to upload |
| `aws_region` | Region for infra (default: us-east-1) |
| `tags` | Resource tags |

---

## 📦 Outputs

- `bucket_id`  
- `website_url`  
- `cloudfront_domain`  
- `cloudfront_id`  

---

## 🔐 Notes

- This version uses **public S3 website hosting** for simplicity.  
- Future versions may include OAC/OAI for private S3 access.

---

## 🧑‍💻 Author

Created by **Juandi** – DevOps & FullStack Architect
