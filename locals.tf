locals {
  # Support for Cloudflare DNS export CSV (Type,Name,Content,TTL,Priority,Proxied)
  # e.g. DNS_records_for_fccardsolutions_nl_cloudflare.csv
  file_content = var.cloudflare_records_file != "" ? file(var.cloudflare_records_file) : ""
  file_records = var.cloudflare_records_file != "" ? [
    for row in csvdecode(local.file_content) : {
      name  = row["Name"]
      type  = row["Type"]
      value = row["Content"]
      ttl   = row["TTL"]
    }
  ] : []

  all_records = concat(var.cloudflare_records, local.file_records)
}
