# Provider 5: arguments are "name" and "account" (object with id)
resource "cloudflare_zone" "zone" {
  name    = var.zone_name
  account = { id = var.account_id }
}
