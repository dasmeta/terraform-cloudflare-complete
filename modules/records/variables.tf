variable "cloudflare_records" {
  type = list(object({
    identifier = optional(string)       # Stable Terraform instance key for imports.
    name       = string                 # DNS record name.
    type       = string                 # DNS record type.
    value      = string                 # DNS record content.
    ttl        = optional(number, 3600) # DNS record TTL in seconds; use 1 for automatic.
    proxied    = optional(bool)         # Enable Cloudflare proxying when supported by the record type.
    priority   = optional(number)       # DNS record priority, required by record types such as MX.
    comment    = optional(string)       # Optional operator-facing record comment.
    tags       = optional(set(string))  # Optional Cloudflare DNS record tags.
    settings = optional(object({
      flatten_cname = optional(bool) # Flatten CNAME responses at the DNS edge.
      ipv4_only     = optional(bool) # Serve only IPv4 answers for proxied records.
      ipv6_only     = optional(bool) # Serve only IPv6 answers for proxied records.
    }))                              # Optional Cloudflare DNS record settings.
  }))
  description = "Cloudflare DNS records to manage. Identifier is stable across imports; all record behaviour fields are optional."
  default     = []

  validation {
    condition = length(distinct(compact([
      for record in var.cloudflare_records : try(record.identifier, null)
      ]))) == length(compact([
      for record in var.cloudflare_records : try(record.identifier, null)
    ]))
    error_message = "Each non-null cloudflare_records identifier must be unique."
  }
}

variable "zone_id" {
  type        = string
  description = "CloudFlare Zone ID"
}
