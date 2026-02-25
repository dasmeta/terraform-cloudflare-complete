# records

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_dns_record.dns_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_records"></a> [cloudflare\_records](#input\_cloudflare\_records) | Cloudflare records name, type and value list. | <pre>list(object({<br/>    name     = string,<br/>    type     = string,<br/>    value    = string,<br/>    ttl      = optional(number, 3600)<br/>    priority = optional(any, null)<br/>  }))</pre> | `[]` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | CloudFlare Zone ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_record_id"></a> [dns\_record\_id](#output\_dns\_record\_id) | Map of record name to the ID of the created DNS record |
| <a name="output_dns_record_name"></a> [dns\_record\_name](#output\_dns\_record\_name) | Map of record name to the name of the created DNS record |
| <a name="output_dns_record_type"></a> [dns\_record\_type](#output\_dns\_record\_type) | Map of record name to the type of the created DNS record |
| <a name="output_dns_record_value"></a> [dns\_record\_value](#output\_dns\_record\_value) | Map of record name to the value of the created DNS record |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
