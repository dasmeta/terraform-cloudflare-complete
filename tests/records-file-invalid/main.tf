module "cloudflare_invalid_csv" {
  source = "../../"

  cloudflare_records_file = "${path.module}/DNS_records_invalid.csv"
  zone_name               = "example.com"
  create_zone             = true
  create_waf              = false
  account_id              = "example-account-id"
  api_token               = "0123456789abcdef0123456789abcdef01234567"
  record_state_migration  = "not-required-new-install"
}
