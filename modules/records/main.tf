locals {
  cloudflare_records_by_key = {
    for index, record in var.cloudflare_records :
    coalesce(try(record.identifier, null), "${record.name}_${record.type}_${index}") => record
  }
}

# Provider 5: resource renamed to cloudflare_dns_record; uses content and required ttl.
# A supplied identifier keeps import addresses stable when duplicate record types exist.
resource "cloudflare_dns_record" "dns_record" {
  for_each = local.cloudflare_records_by_key

  zone_id  = var.zone_id
  name     = each.value.name
  type     = each.value.type
  content  = each.value.value
  ttl      = each.value.ttl
  proxied  = each.value.proxied
  priority = each.value.priority
  comment  = each.value.comment
  tags     = each.value.tags
  settings = each.value.settings
}
