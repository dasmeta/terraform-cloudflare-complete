module "cloudflare_records_migration_guard" {
  source = "../../"

  cloudflare_records = [
    {
      identifier = "example-record-id"
      name       = "example.com"
      type       = "A"
      value      = "192.0.2.10"
    }
  ]

  zone_name   = "example.com"
  create_zone = true
  create_waf  = false
  account_id  = "example-account-id"
  api_token   = "abcdefghijklmnopqrstuvwxyz1234567890abcd"
}
