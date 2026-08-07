module "cloudflare_record" {
  source = "../../"
  cloudflare_records = [
    {
      identifier = "example-test-a"
      name       = "test-terraform"
      type       = "A"
      value      = "129.10.1.0"
    }
  ]

  zone_name              = "example.com"
  create_zone            = false
  create_waf             = false
  account_id             = "hsdihaidhaihd"
  zone_id                = "adushdaiudhaihd"
  api_token              = "0123456789abcdef0123456789abcdef01234567"
  record_state_migration = "v2-record-addresses-migrated"
}
