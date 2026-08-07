module "cloudflare_records_adoption" {
  source = "../../"

  cloudflare_records = [
    {
      identifier = "example-mail-primary"
      name       = "example.com"
      type       = "MX"
      value      = "mail.example.com"
      ttl        = 1
      priority   = 10
    },
    {
      identifier = "example-web"
      name       = "app.example.com"
      type       = "CNAME"
      value      = "origin.example.net"
      proxied    = true
      settings = {
        flatten_cname = false
      }
    }
  ]

  zone_name              = "example.com"
  create_zone            = true
  create_waf             = false
  account_id             = "example-account-id"
  api_token              = "0123456789abcdef0123456789abcdef01234567"
  record_state_migration = "not-required-new-install"
}
