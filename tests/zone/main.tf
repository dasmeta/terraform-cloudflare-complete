module "cloudflare" {
  source = "../../"

  zone_name   = "dasmeta.com"
  create_zone = true
  create_waf  = false
  account_id  = "hsdihaidhaihd"
  api_token   = "xvevsdvs6jx-ahdishaidsha"
}
