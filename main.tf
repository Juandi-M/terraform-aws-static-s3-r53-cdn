########################################
# Root configuration / data sources
########################################

# Public hosted zone for the domain. Must already exist in Route 53.
data "aws_route53_zone" "this" {
  name         = "${var.domain_name}."
  private_zone = false
}
