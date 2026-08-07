variable "cloudflare_records" {
  type = list(object({
    identifier = string                # Stable Terraform instance key for imports and state migration.
    name       = string                # DNS record name.
    type       = string                # DNS record type.
    value      = string                # DNS record content.
    ttl        = optional(number)      # DNS record TTL; defaults to automatic for proxied records.
    proxied    = optional(bool)        # Enable Cloudflare proxying when supported by the record type.
    priority   = optional(number)      # DNS record priority, required by record types such as MX.
    comment    = optional(string)      # Optional operator-facing record comment.
    tags       = optional(set(string)) # Optional Cloudflare DNS record tags.
    settings = optional(object({
      flatten_cname = optional(bool) # Flatten CNAME responses at the DNS edge.
      ipv4_only     = optional(bool) # Serve only IPv4 answers for proxied records.
      ipv6_only     = optional(bool) # Serve only IPv6 answers for proxied records.
    }))                              # Optional Cloudflare DNS record settings.
  }))
  description = "Cloudflare DNS records to manage. Every record requires a stable identifier; all record behaviour fields are optional."
  default     = []

  validation {
    condition = alltrue([
      for record in var.cloudflare_records : trimspace(record.identifier) != ""
      ]) && length(distinct([
        for record in var.cloudflare_records : trimspace(record.identifier)
    ])) == length(var.cloudflare_records)
    error_message = "Each cloudflare_records entry must define a non-empty unique identifier in v2."
  }
}

variable "record_state_migration" {
  type        = string
  description = "Set to v2-record-addresses-migrated only after every existing DNS record has been moved to its identifier address with terraform state mv."
}

variable "zone_id" {
  type        = string
  description = "CloudFlare Zone ID"
}
