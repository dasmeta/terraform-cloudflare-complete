# Feature Specification: Publish Module Releases Reliably

**Feature Branch**: `fix/release-automation`
**Created**: 2026-08-07
**Status**: Ready for implementation

## User Scenarios & Testing

### User Story 1 - Consume merged module releases (Priority: P1)

An infrastructure consumer can select a semantic module version after a
compatible module change merges to the default branch.

**Independent Test**: The existing merged v2 change has a `2.0.0` Git tag that
points to the merge commit, allowing the private registry VCS integration to
import it.

### User Story 2 - Automate future releases (Priority: P2)

A module maintainer does not need to create release tags by hand after merging
conventional commits to the default branch.

**Independent Test**: The repository contains a default-branch release workflow
with repository write permissions and full Git history available to the release
tool.

## Functional Requirements

- **FR-001**: The existing major module change MUST be tagged `2.0.0` at its
  merged default-branch commit.
- **FR-002**: Default-branch pushes and manual dispatches MUST run the release
  workflow.
- **FR-003**: Release automation MUST create GitHub releases and semantic Git
  tags without attempting to publish an npm package.
- **FR-004**: The workflow MUST have access to complete repository history and
  permissions to write release artifacts.

## Success Criteria

- The `2.0.0` tag resolves to the merged v2 module commit.
- The private registry can import the tagged module version through its existing
  VCS integration.
- Future conventional commits on the default branch produce the correct
  semantic release without a manual tag.

## Assumptions

- The existing private registry module uses tag-based VCS publishing with no
  additional tag prefix.
- GitHub Actions is permitted to create releases in this repository.
