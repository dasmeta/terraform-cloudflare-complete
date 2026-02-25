output "dns_record_id" {
  description = "Map of record name to the ID of the created DNS record"
  value       = { for k, r in cloudflare_dns_record.dns_record : k => r.id }
}

output "dns_record_name" {
  description = "Map of record name to the name of the created DNS record"
  value       = { for k, r in cloudflare_dns_record.dns_record : k => r.name }
}

output "dns_record_type" {
  description = "Map of record name to the type of the created DNS record"
  value       = { for k, r in cloudflare_dns_record.dns_record : k => r.type }
}

output "dns_record_value" {
  description = "Map of record name to the value of the created DNS record"
  value       = { for k, r in cloudflare_dns_record.dns_record : k => r.content }
}
