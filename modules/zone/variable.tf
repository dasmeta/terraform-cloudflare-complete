variable "cloudflare_records" {
  type = list(object({
    name  = string,
    type  = string,
    value = string
  }))
  description = "Cloudflare records name, type and value list."
  default     = []
}

variable "zone_name" {
  type        = string
  description = "Cloudflare zone name"
}

variable "account_id" {
  type        = string
  description = "Cloudflare Account Id"
}

