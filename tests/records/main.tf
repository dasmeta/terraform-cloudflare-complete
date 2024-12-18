module "cloudflare_record" {
  source = "../../"
  cloudflare_records = [
    {
      name  = "test-terraform"
      type  = "A"
      value = "129.10.1.0"
    }
  ]

  zone_name   = "dasmeta.com"
  create_zone = false
  create_waf  = false
  account_id  = "hsdihaidhaihd"
  zone_id     = "adushdaiudhaihd"
  api_token   = "xvevsdvs6jx-ahdishaidsha"
}
