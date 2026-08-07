# Invalid CSV record fixture

This fixture deliberately contains an unsupported `Proxied` value. A
plan-only run must fail at the root module with the CSV contract message rather
than silently creating a DNS-only record.
