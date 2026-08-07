locals {
  cloudflare_records_by_key = {
    for record in var.cloudflare_records :
    trimspace(record.identifier) => record
  }
}

# Provider 5: resource renamed to cloudflare_dns_record; uses content and required ttl.
# Identifiers are required so state addresses remain stable when records are reordered.
resource "cloudflare_dns_record" "dns_record" {
  for_each = local.cloudflare_records_by_key

  zone_id  = var.zone_id
  name     = each.value.name
  type     = each.value.type
  content  = each.value.value
  ttl      = coalesce(each.value.ttl, each.value.proxied == true ? 1 : 3600)
  proxied  = each.value.proxied
  priority = each.value.priority
  comment  = each.value.comment
  tags     = each.value.tags
  settings = each.value.settings

  lifecycle {
    prevent_destroy = true

    precondition {
      condition     = var.record_state_migration == "v2-record-addresses-migrated"
      error_message = "Cloudflare DNS records require a v2 state migration. Run terraform state mv for every legacy index address to its identifier address, then set record_state_migration = \"v2-record-addresses-migrated\"."
    }
  }
}
