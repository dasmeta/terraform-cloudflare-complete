resource "cloudflare_record" "dns_record" {
  for_each = { for record in var.cloudflare_records : record.name => record }

  zone_id = var.zone_id
  name    = each.value.name
  type    = each.value.type
  value   = each.value.value
}
