# terraform-cloudflare-complete
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 5.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 5.23.0 |

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_records"></a> [records](#module\_records) | ./modules/records/ | n/a |
| <a name="module_waf"></a> [waf](#module\_waf) | ./modules/waf/ | n/a |
| <a name="module_zone"></a> [zone](#module\_zone) | ./modules/zone/ | n/a |

## Resources

| Name | Type |
| ---- | ---- |
| [cloudflare_zone.zone](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Cloudflare Account Id | `string` | n/a | yes |
| <a name="input_api_token"></a> [api\_token](#input\_api\_token) | API token | `string` | n/a | yes |
| <a name="input_blocked_countries"></a> [blocked\_countries](#input\_blocked\_countries) | Blocked countres | `string` | `""` | no |
| <a name="input_cloudflare_records"></a> [cloudflare\_records](#input\_cloudflare\_records) | Cloudflare DNS records to manage. Identifier is stable across imports; all record behaviour fields are optional. | <pre>list(object({<br/>    identifier = optional(string)      # Stable Terraform instance key for imports.<br/>    name       = string                # DNS record name.<br/>    type       = string                # DNS record type.<br/>    value      = string                # DNS record content.<br/>    ttl        = optional(number)      # DNS record TTL; defaults to automatic for proxied records.<br/>    proxied    = optional(bool)        # Enable Cloudflare proxying when supported by the record type.<br/>    priority   = optional(number)      # DNS record priority, required by record types such as MX.<br/>    comment    = optional(string)      # Optional operator-facing record comment.<br/>    tags       = optional(set(string)) # Optional Cloudflare DNS record tags.<br/>    settings = optional(object({<br/>      flatten_cname = optional(bool) # Flatten CNAME responses at the DNS edge.<br/>      ipv4_only     = optional(bool) # Serve only IPv4 answers for proxied records.<br/>      ipv6_only     = optional(bool) # Serve only IPv6 answers for proxied records.<br/>    }))                              # Optional Cloudflare DNS record settings.<br/>  }))</pre> | `[]` | no |
| <a name="input_cloudflare_records_file"></a> [cloudflare\_records\_file](#input\_cloudflare\_records\_file) | Optional path to a file to import DNS records from. Supports: CSV. | `string` | `""` | no |
| <a name="input_create_waf"></a> [create\_waf](#input\_create\_waf) | n/a | `bool` | `false` | no |
| <a name="input_create_zone"></a> [create\_zone](#input\_create\_zone) | n/a | `bool` | `false` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Cloudflare zone id if zone already created | `string` | `""` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | Cloudflare zone name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
