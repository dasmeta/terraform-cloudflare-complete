resource "cloudflare_ruleset" "zone_custom_firewall" {
  zone_id     = var.zone_id
  name        = "Block Geolocations"
  description = "Block Geolocations"
  kind        = "zone"
  phase       = "http_request_firewall_custom"


  rules {
    action      = "block"
    expression  = var.blocked_country
    description = "Blocked Countres"
    enabled     = true
  }
}