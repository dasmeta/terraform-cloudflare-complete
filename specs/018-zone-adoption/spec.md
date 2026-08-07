# Feature Specification: Adopt Existing DNS Zones

**Feature Branch**: `018-zone-adoption`  
**Created**: 2026-08-07  
**Status**: Review fixes in progress

## User Scenarios & Testing

### User Story 1 - Preserve Existing DNS Behaviour (Priority: P1)

An infrastructure operator can express existing DNS records completely enough
that adopting them into Terraform state does not alter their public DNS
behaviour.

**Independent Test**: Configure representative records with automatic and
explicit TTLs, proxying, MX priority, and DNS settings; validate the module
configuration without provider diagnostics.

### User Story 2 - Import Duplicate Record Types Reliably (Priority: P2)

An operator can assign a stable identifier to records that share a name and
type, so their Terraform addresses remain stable throughout the import.

**Independent Test**: Configure two records with the same name and type but
different identifiers, and validate that both resource instances are present.

### User Story 3 - Require Safe State Migration (Priority: P1)

An operator upgrading an existing DNS-record state to identifier-based
addresses receives a hard, actionable plan failure until every state object is
moved to its identifier address.

**Independent Test**: A configuration using the default migration marker fails
validation with instructions to run `terraform state mv`; both migrated
installations and explicitly declared new installations validate without
changing DNS-record lifecycle semantics.

## Functional Requirements

- **FR-001**: The v2 module MUST require a stable identifier for every DNS
  record so record addresses are deterministic.
- **FR-002**: A record MAY define TTL, proxy status, comment, tags, MX priority,
  and supported DNS settings.
- **FR-003**: A record MUST define a stable, module-only identifier used for
  the Terraform instance address.
- **FR-004**: CSV-imported records MUST provide non-empty `ID` and `Proxied`
  columns; invalid proxy values MUST be rejected rather than implicitly
  changing DNS proxying.
- **FR-005**: File-imported records MUST retain their CSV TTL values.
- **FR-006**: Documentation, examples, and validation fixtures MUST demonstrate
  the supported adoption attributes using neutral example domains.
- **FR-007**: Every managed DNS record MUST define a non-empty stable
  identifier, including CSV-imported records.
- **FR-008**: DNS record plans MUST fail until the caller explicitly acknowledges
  completion of the v2 state-address migration.
- **FR-009**: The migration acknowledgement MUST accept a separate explicit
  value for a new installation, where no legacy state exists to move.
- **FR-010**: Existing-zone record and WAF modules MUST use the supplied
  `zone_id` when available, otherwise resolve it from the zone lookup.

## Success Criteria

- Invalid CSV contracts fail at the root module with an actionable message.
- A configuration containing duplicate-name records produces one address per
  supplied stable identifier.
- All supported live-zone attributes can be represented without Terraform
  recreating a record solely because an attribute was omitted from the module.
- An upgrade that has not acknowledged its migration cannot apply a DNS-record
  plan.

## Assumptions

- The existing Cloudflare provider v5 resource remains the supported API.
- Advanced DNS data-form records outside the current zone inventory are out of
  scope; they can be added later as a separately reviewed extension.
