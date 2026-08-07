# records

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 5.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [cloudflare_dns_record.dns_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cloudflare_records"></a> [cloudflare\_records](#input\_cloudflare\_records) | Cloudflare DNS records to manage. Identifier is stable across imports; all record behaviour fields are optional. | <pre>list(object({<br/>    identifier = optional(string)       # Stable Terraform instance key for imports.<br/>    name       = string                 # DNS record name.<br/>    type       = string                 # DNS record type.<br/>    value      = string                 # DNS record content.<br/>    ttl        = optional(number, 3600) # DNS record TTL in seconds; use 1 for automatic.<br/>    proxied    = optional(bool)         # Enable Cloudflare proxying when supported by the record type.<br/>    priority   = optional(number)       # DNS record priority, required by record types such as MX.<br/>    comment    = optional(string)       # Optional operator-facing record comment.<br/>    tags       = optional(set(string))  # Optional Cloudflare DNS record tags.<br/>    settings = optional(object({<br/>      flatten_cname = optional(bool) # Flatten CNAME responses at the DNS edge.<br/>      ipv4_only     = optional(bool) # Serve only IPv4 answers for proxied records.<br/>      ipv6_only     = optional(bool) # Serve only IPv6 answers for proxied records.<br/>    }))                              # Optional Cloudflare DNS record settings.<br/>  }))</pre> | `[]` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | CloudFlare Zone ID | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_dns_record_id"></a> [dns\_record\_id](#output\_dns\_record\_id) | Map of record name to the ID of the created DNS record |
| <a name="output_dns_record_name"></a> [dns\_record\_name](#output\_dns\_record\_name) | Map of record name to the name of the created DNS record |
| <a name="output_dns_record_type"></a> [dns\_record\_type](#output\_dns\_record\_type) | Map of record name to the type of the created DNS record |
| <a name="output_dns_record_value"></a> [dns\_record\_value](#output\_dns\_record\_value) | Map of record name to the value of the created DNS record |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
