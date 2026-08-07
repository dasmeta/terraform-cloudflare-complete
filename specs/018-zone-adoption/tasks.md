# Tasks: Adopt Existing DNS Zones

## Phase 1: Foundation

- [X] T001 Create Speckit evidence in `specs/018-zone-adoption/`.
- [X] T002 Inspect the pinned Cloudflare provider schema for DNS record fields.

## Phase 2: Preserve DNS Records

- [X] T003 Update root record input and CSV normalization in `variables.tf` and `locals.tf`.
- [X] T004 Update `modules/records/variables.tf` and `modules/records/main.tf` with optional adoption attributes.
- [X] T005 [P] Add a neutral adoption fixture at `tests/records-adoption/main.tf`.

## Phase 3: Verification

- [X] T006 Regenerate module documentation and format Terraform files.
- [X] T007 Validate root, CSV, and adoption fixture Terraform configuration.
- [X] T008 Run scoped pre-commit hooks and mark all tasks complete.
