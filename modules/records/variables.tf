variable "cloudflare_records" {
  type = list(object({
    name  = string,
    type  = string,
    value = string
  }))
  description = "Cloudflare records name, type and value list."
  default     = []
}

variable "zone_id" {
  type        = string
  description = "CloudFlare Zone ID"
}
