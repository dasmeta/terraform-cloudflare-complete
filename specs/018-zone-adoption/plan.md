# Implementation Plan: Adopt Existing DNS Zones

## Technical Context

- Repository: `dasmeta/terraform-cloudflare-complete`
- Affected module: root module and `modules/records`
- Provider baseline: `cloudflare/cloudflare ~> 5.0` (v5.23.0 schema checked)
- Validation: `terraform fmt`, `terraform validate`, test fixtures, generated
  Terraform documentation, and pre-commit hooks.

## Current State and Gap

The root input removes CSV TTL information and accepts only name, type, and
content. The records module supports TTL but cannot express proxy status, MX
priority, DNS settings, comments, or tags. Its positional instance keys make
imports fragile when a zone contains duplicate name/type records.

## Design

Extend the existing `cloudflare_records` object with adoption attributes and
require a stable identifier for every record. v2 keys records by identifier;
there is no legacy index fallback. Add a migration marker that defaults to a
hard failure with `terraform state mv` instructions, and protect DNS records
with `prevent_destroy` so a missed state move cannot delete or recreate one.

The module remains a narrow opinionated wrapper; it intentionally does not
expose the provider's arbitrary `data` record surface. The current zone
inventory uses `content`, not structured data records.

## Modern Capabilities

| Ability | Provider support | Classification |
| --- | --- | --- |
| DNS record proxy, priority, settings, comments and tags | Cloudflare provider v5 | supported |
| Stable Terraform instance identifiers | Terraform `for_each` | supported |

Cloudflare provider v5 is the current non-deprecated resource baseline. No
provider upgrade is required.

## Standards and Governance

- Speckit evidence: `specs/018-zone-adoption/` contains `spec.md`, this plan,
  and `tasks.md`; the expected module-change gate result is pass.
- Shared standards source:
  `terraform-module-developer` internal standards and planning checklist.
- No provider-maintained wrapper candidate applies: this is an extension of an
  existing DasMeta wrapper, not new module creation.
- `versions.tf` remains the repository convention for provider constraints.
- Grouped record fields use optional attributes and inline field comments.

## Compatibility and Risks

This delivery is intentionally released as v2.0.0. Stable record identifiers
replace order-based resource addresses. Consumers must move each existing
record state object to its identifier address with `terraform state mv`, then
set the explicit migration marker. The module rejects unacknowledged upgrades
and prevents record destruction as a second safety barrier.

## Files

- `variables.tf`, `locals.tf`: preserve the full record objects and declare the
  backward-compatible root interface.
- `modules/records/{variables.tf,main.tf}`: declare and render supported
  attributes with stable keys.
- `tests/records-adoption/main.tf`: add a neutral validation fixture.
- module READMEs: regenerate from live inputs.
- tests: cover required identifiers and the migration acknowledgement guard.
