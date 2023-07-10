# terraform-cloudflare-complete
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 4.9.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_waf"></a> [waf](#module\_waf) | ./modules/waf/ | n/a |
| <a name="module_zone"></a> [zone](#module\_zone) | ./modules/zone/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Cloudflare Account Id | `string` | n/a | yes |
| <a name="input_api_token"></a> [api\_token](#input\_api\_token) | API token | `string` | n/a | yes |
| <a name="input_blocked_country"></a> [blocked\_country](#input\_blocked\_country) | Blocked countres | `string` | `""` | no |
| <a name="input_cloudflare_records"></a> [cloudflare\_records](#input\_cloudflare\_records) | Cloudflare records name, type and value list. | <pre>list(object({<br>    name  = string,<br>    type  = string,<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_create_waf"></a> [create\_waf](#input\_create\_waf) | n/a | `bool` | `false` | no |
| <a name="input_create_zone"></a> [create\_zone](#input\_create\_zone) | n/a | `bool` | `false` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | Cloudflare zone name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
