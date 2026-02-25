variable "cloudflare_records" {
  type = list(object({
    name     = string,
    type     = string,
    value    = string,
    ttl      = optional(number, 3600)
    priority = optional(number, null)
  }))
  description = "Cloudflare records name, type and value list."
  default     = []
}

variable "zone_id" {
  type        = string
  description = "CloudFlare Zone ID"
}
