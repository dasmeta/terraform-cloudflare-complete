# Provider 5: resource renamed to cloudflare_dns_record; uses content and required ttl
# Key must be unique: CSV/Cloudflare export can have multiple records with same name (e.g. @ for A and TXT)
resource "cloudflare_dns_record" "dns_record" {
  for_each = { for i, record in var.cloudflare_records : "${record.name}_${record.type}_${i}" => record }

  zone_id = var.zone_id
  name    = each.value.name
  type    = each.value.type
  content = each.value.value
  ttl     = 3600
}
