locals {
  # Support for Cloudflare DNS export CSV (ID,Type,Name,Content,TTL,Priority,Proxied).
  file_content = var.cloudflare_records_file != "" ? file(var.cloudflare_records_file) : ""
  file_records = var.cloudflare_records_file != "" ? [
    for row in csvdecode(local.file_content) : {
      identifier = trimspace(try(row["ID"], ""))
      name       = row["Name"]
      type       = row["Type"]
      value      = row["Content"]
      ttl        = try(tonumber(row["TTL"]), 1)
      priority   = try(tonumber(row["Priority"]), null)
      proxied    = contains(["true", "yes", "proxied"], lower(trimspace(row["Proxied"])))
    }
  ] : []

  all_records = concat(var.cloudflare_records, local.file_records)
}
