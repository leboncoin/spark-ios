# Contributing

Thank you for your interest in **Spark**, Leboncoin's iOS Design System. This document describes how changes are made to this repository.

## Table of Contents

- [Who Can Contribute](#who-can-contribute)
- [Before You Start](#before-you-start)
- [Documentation Requirements](#documentation-requirements)
- [Testing Requirements](#testing-requirements)
- [Before Pushing](#before-pushing)
- [Releases](#releases)
- [Code of Conduct](#code-of-conduct)

---

## Who Can Contribute

This repository is developed and maintained by **Leboncoin iOS developers**. Contributions are expected to come from within the team.

## Before You Start

1. Never commit directly to `main`. Create a branch for your change.
2. Get familiar with [`docs/ARCHITECTURE.md`](ARCHITECTURE.md) — it describes the project layout, the shared structure every component follows, and the theming system. Most changes fit into one of the folders described there.
3. Use the matching `spark-component-*` skill (see [`docs/CLAUDE_SKILLS.md`](CLAUDE_SKILLS.md)) when adding or updating an Enum, Model, Token, Environment, UseCase, ViewModel, View, AccessibilityIdentifier, Constants, or DocC documentation — they encode the exact conventions and templates for that file type.
4. Run `make sourcery` before writing tests that rely on generated mocks, and `make build` / `make test` before opening a pull request (see [`docs/MAKEFILE.md`](MAKEFILE.md)).

## Documentation Requirements

- **All public code must be documented.** Every public `struct`, `class`, `protocol`, `enum`, `func`, and property needs a doc comment (`///`) explaining what it does. This is checked by the `spark-check-before-push` skill and by code review.
- **All scripts and GitHub Actions workflows must be documented**, in `docs/script/` and `docs/workflow/` respectively (one Markdown file per script/workflow). After adding or changing a script or workflow:
  1. Add or update its file under `docs/script/SCRIPT_XXX.md` or `docs/workflow/WORKFLOW_XXX.md`.
  2. Update the corresponding index — [`docs/SCRIPTS.md`](SCRIPTS.md) or [`docs/WORKFLOWS.md`](WORKFLOWS.md) — to reference it.

## Testing Requirements

Every component change needs corresponding tests — see [`docs/ARCHITECTURE.md#component-testing`](ARCHITECTURE.md#component-testing) for the full breakdown of unit tests and snapshot tests. In short:

- Add or update **unit tests** under `Tests/UnitTests/`, mirroring the `Sources/Core/` structure you changed. Use **Swift Testing**, except for ViewModel tests and UseCase-of-UseCase tests, which use XCTest.
- Add or update **snapshot tests** under `Tests/SnapshotTests/` for any visual change. Review generated snapshot diffs before committing new baselines — a passing re-record is not the same as an intentional visual change.

## Before Pushing

Before opening a pull request, make sure that, for every file you created or updated:

- [ ] No `TODO` remains.
- [ ] All public code is documented.
- [ ] There's no commented-out code (aside from documentation).
- [ ] The file header has a copyright line with the current year.
- [ ] No empty lines contain whitespace or tabs.
- [ ] All class members are accessed with `self.`.
- [ ] `swiftlint` (and `swiftlint --fix` if needed) passes.
- [ ] `Package.swift` uses remote URLs, not local paths.

The `spark-check-before-push` skill runs all of these checks for you; `spark-push` then helps you write a [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)-style commit message and push.

## Releases

Each modification should ship as its own release rather than being batched with several unrelated changes — a small, isolated release is much easier to revert than a large one.

Releases are tracked in [`CHANGELOG.md`](../CHANGELOG.md). When a GitHub release is published, the `📝 Release changelog update` workflow (see [`docs/workflow/WORKFLOW_RELEASE_CHANGELOG_UPDATE.md`](workflow/WORKFLOW_RELEASE_CHANGELOG_UPDATE.md)) automatically opens a pull request updating it from the release notes.

### Versioning

Releases follow `1.2.3` version numbers:

| Position | Meaning |
|---|---|
| **1** | A big change, or a new component |
| **2** | A small change |
| **3** | A fix |

## Code of Conduct

All contributions are expected to follow the project's [Code of Conduct](CODE_OF_CONDUCT.md).
