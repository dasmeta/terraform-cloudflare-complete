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

variable "api_token" {
  type        = string
  description = "API token"
}

variable "create_zone" {
  type    = bool
  default = false
}

variable "create_waf" {
  type    = bool
  default = false
}


variable "blocked_country" {
  type        = string
  default     = ""
  description = "Blocked countres"
}
