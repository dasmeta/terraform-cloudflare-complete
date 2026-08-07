# Implementation Plan: Publish Module Releases Reliably

## Technical Context

- Repository: `dasmeta/terraform-cloudflare-complete`
- Release tool: existing `semantic-release` v19 dependencies
- Trigger: GitHub Actions on `main` and manual dispatch
- Current registry evidence: only tags `1.0.0` and `1.0.1` existed after the
  v2 module change merged.

## Current State and Gap

The repository declares semantic-release dependencies but has no workflow to
execute them. The release configuration also leaves plugins at the package root,
which does not configure semantic-release and can retain its default npm
publisher behavior.

## Design

Create a least-privilege GitHub Actions release workflow that checks out full
history, installs the existing Node dependencies, and runs semantic-release on
`main` or manual dispatch. Move the semantic-release plugins under its `release`
configuration and omit the npm plugin. Create the already-missing `2.0.0` tag
at the v2 merge commit to unblock the private registry immediately.

## Standards and Governance

- Speckit bootstrap exemption: this repository has `specs/` evidence but no
  `.specify/` tooling; this bounded package provides the required `spec.md`,
  `plan.md`, and `tasks.md` without introducing the unrelated framework.
- The module source interface is unchanged; this is repository automation only.
- A GitHub release workflow is the supported release path for the existing
  semantic-release dependency; no provider/module interface is widened.

## Risks

- A workflow run after its merge observes the prior `feat!` commit and releases
  v2.0.0 only if that tag does not already exist. Creating the tag now prevents
  duplicate major release behavior.
- The Terraform Cloud private registry still needs its existing VCS webhook and
  tag-based publish configuration; the workflow cannot repair organization-level
  registry permissions.

## Files

- `package.json`: scope semantic-release plugins to GitHub release behavior.
- `.github/workflows/release.yml`: run semantic-release safely on the default
  branch and by manual dispatch.
- `specs/019-release-automation/`: record requirements, plan, and verification.
