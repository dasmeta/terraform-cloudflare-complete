# Records migration guard

This fixture deliberately leaves `record_state_migration` at its default
`migrate_me` value. `terraform plan -refresh=false` must fail with the v2
state-migration acknowledgement instruction before any DNS record can be
applied.
