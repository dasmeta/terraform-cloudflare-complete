# Paths are relative to the module so file() can read them (must be under module source).
# Provider 5 validates api_token length; this placeholder is plan-only.
locals {
  test_api_token = "0123456789abcdef0123456789abcdef01234567"
}
# Test: CSV file + inline records merged
module "cloudflare_merged_csv_and_inline" {
  source = "../../"

  cloudflare_records = [
    {
      identifier = "example-inline-cname"
      name       = "app.example.com"
      type       = "CNAME"
      value      = "origin.example.net"
      proxied    = true
    }
  ]
  # Path relative to module (../../) so file() can read it; file must live under module source
  cloudflare_records_file = "${path.module}/DNS_records_cloudflare.csv"
  zone_name               = "example.com"
  create_zone             = true
  create_waf              = false
  account_id              = "account_id"
  api_token               = local.test_api_token
  record_state_migration  = "not-required-new-install"
}
