# Paths relative to the module (../../) so file() can read them (must be under module source)
# Provider 5 validates api_token length (40 chars); use placeholder for plan-only tests
locals {
  test_api_token = ""
}
# Test: CSV file + inline records merged
module "cloudflare_merged_csv_and_inline" {
  source = "../../"

  cloudflare_records = []
  # Path relative to module (../../) so file() can read it; file must live under module source
  cloudflare_records_file = "${path.module}/DNS_records_cloudflare.csv"
  zone_name               = "domain"
  create_zone             = false
  create_waf              = false
  account_id              = "account_id"
  zone_id                 = "zone_id"
  api_token               = local.test_api_token
}
