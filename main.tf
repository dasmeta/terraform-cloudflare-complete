# Provider 5: look up zone by name; cloudflare_zone requires zone_id or filter (name is read-only)
data "cloudflare_zone" "zone" {
  count = var.create_zone || var.zone_id != "" ? 0 : 1

  filter = {
    name = var.zone_name
  }
}

locals {
  effective_zone_id = var.create_zone ? module.zone[0].id : (
    var.zone_id != "" ? var.zone_id : data.cloudflare_zone.zone[0].id
  )
}

module "waf" {
  count = var.create_waf ? 1 : 0

  source = "./modules/waf/"

  zone_id           = local.effective_zone_id
  blocked_countries = var.blocked_countries
}

module "zone" {
  count = var.create_zone ? 1 : 0

  source = "./modules/zone/"

  zone_name  = var.zone_name
  account_id = var.account_id
}

module "records" {
  count = length(local.all_records) > 0 ? 1 : 0

  source = "./modules/records/"

  zone_id                = local.effective_zone_id
  cloudflare_records     = local.all_records
  record_state_migration = var.record_state_migration
}
