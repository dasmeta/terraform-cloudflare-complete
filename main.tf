data "cloudflare_zone" "zone" {
  count = var.create_zone ? 0 : 1

  name = var.zone_name
}

module "waf" {
  count = var.create_waf ? 1 : 0

  source = "./modules/waf/"

  zone_id           = var.create_zone ? module.zone[0].id : data.cloudflare_zone.zone[0].id
  blocked_countries = var.blocked_countries
}

module "zone" {
  count = var.create_zone ? 1 : 0

  source = "./modules/zone/"

  zone_name  = var.zone_name
  account_id = var.account_id
}

module "records" {
  count = var.cloudflare_records != [] ? 1 : 0

  source = "./modules/records/"

  zone_id            = var.create_zone ? module.zone[0].id : var.zone_id
  cloudflare_records = var.cloudflare_records
}
