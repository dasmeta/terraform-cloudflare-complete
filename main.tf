module "waf" {
    count = var.create_waf ? 1 : 0

    source = "./modules/waf/"

    zone_id = module.zone[0].id
    blocked_country = var.blocked_country
}

module "zone" {
    count = var.create_zone ? 1 : 0

    source = "./modules/zone/"

    cloudflare_records = var.cloudflare_records
    zone_name = var.zone_name
    account_id = var.account_id
}
