resource "cloudflare_zone" "zone" {
  account_id = var.account_id
  zone       = var.zone_name
}

resource "cloudflare_record" "records" {
  for_each = { for record in var.cloudflare_records : record.name => record }

  zone_id = cloudflare_zone.zone.id
  name    = each.value.name
  type    = each.value.type
  value   = each.value.value
}
