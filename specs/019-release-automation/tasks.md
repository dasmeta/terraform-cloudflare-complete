# Tasks: Publish Module Releases Reliably

## Phase 1: Immediate Registry Recovery

- [X] T001 Verify the v2 merge commit and absence of the `2.0.0` tag.
- [X] T002 Create and push the `2.0.0` tag at the verified merge commit.
- [ ] T003 Verify that the private registry exposes module version `2.0.0`.

## Phase 2: Future Release Automation

- [X] T004 Configure semantic-release to publish GitHub releases only in
  `package.json`.
- [X] T005 Add default-branch and manual-dispatch release automation in
  `.github/workflows/release.yml`.
- [ ] T006 Validate workflow YAML and package JSON, then create a follow-up PR.
