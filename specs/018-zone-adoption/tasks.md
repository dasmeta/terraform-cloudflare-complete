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

## Phase 4: Review Fixes

- [X] T009 Instantiate records for file-only CSV input in `main.tf`.
- [X] T010 Validate the complete generated record key set in `modules/records/variables.tf`.
- [X] T011 Derive automatic TTL for proxied records in `modules/records/main.tf`.

## Phase 5: Major Release

- [X] T012 Document the v2.0.0 upgrade and breaking state-adoption impact.
- [X] T013 Mark the release commit as a semantic-versioning major change.

## Phase 6: Safe v2 State Migration

- [X] T014 Require non-empty identifiers for inline and CSV DNS records.
- [X] T015 Add a default-failing migration acknowledgement and DNS destroy
  protection to the records module.
- [X] T016 Update fixtures and documentation with the `terraform state mv`
  migration workflow.
- [X] T017 Regenerate documentation and validate migration-guard fixtures.

## Phase 7: Review Corrections

- [X] T018 Remove permanent DNS `prevent_destroy`; retain the migration
  acknowledgement as the scoped v2 migration guard.
- [X] T019 Validate CSV `ID` and `Proxied` contracts at the root module and
  normalize supported proxy values explicitly.
- [X] T020 Add a new-install acknowledgement, root duplicate-ID validation,
  and effective existing-zone ID selection.
- [X] T021 Exercise merged CSV and inline records in plan-only fixtures.
- [X] T022 Consolidate generated README blocks and rerun Terraform checks.
