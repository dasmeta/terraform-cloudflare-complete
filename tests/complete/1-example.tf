module "cloudflare" {
  source = "../../"
  cloudflare_records = [
    {
      identifier = "example-devops-txt"
      name       = "devops.example.com"
      type       = "TXT"
      value      = ""
    }
  ]

  # Example zone
  zone_name              = "example.com"
  create_zone            = true
  create_waf             = true
  account_id             = "account_id"
  api_token              = "api_token"
  blocked_countries      = "ip.geoip.country eq \"AF\""
  record_state_migration = "v2-record-addresses-migrated"
}
