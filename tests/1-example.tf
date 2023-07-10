module "cloudflare" {
  source = "../"
  cloudflare_records = [
    {
      name  = "devops.dasmeta.com"
      type  = "TXT"
      value = ""
    }
  ]

  # DasMeta
  zone_name       = "devops.dasmeta.com"
  create_zone     = true
  create_waf      = true
  account_id      = "account_id"
  api_token       = "api_token"
  blocked_country = "ip.geoip.country eq \"AF\""
}
