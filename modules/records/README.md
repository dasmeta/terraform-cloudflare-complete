# records

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.dns_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_records"></a> [cloudflare\_records](#input\_cloudflare\_records) | Cloudflare records name, type and value list. | <pre>list(object({<br>    name  = string,<br>    type  = string,<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | CloudFlare Zone ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_record_id"></a> [dns\_record\_id](#output\_dns\_record\_id) | The ID of the created DNS record |
| <a name="output_dns_record_name"></a> [dns\_record\_name](#output\_dns\_record\_name) | The name of the created DNS record |
| <a name="output_dns_record_type"></a> [dns\_record\_type](#output\_dns\_record\_type) | The type of the created DNS record |
| <a name="output_dns_record_value"></a> [dns\_record\_value](#output\_dns\_record\_value) | The value of the created DNS record |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
