# Linter Workflow

## Overview

This GitHub Actions workflow runs SwiftLint to enforce code style and quality standards across the Spark iOS monorepo. It performs multiple linting passes with different configurations to ensure code consistency and catch potential issues before they are merged.

## Workflow File

`.github/workflows/linter.yml`

## Triggers

This workflow runs automatically on pull requests:

- **Pull Request**: `pull_request`
  - Trigger: Automatically runs on pull requests
  - Types: `opened`, `edited`, `synchronize`
  - Purpose: Enforce code quality and style standards before merging
  - Ensures consistent code style across all components

## Usage

This workflow automatically runs on all pull requests to maintain code quality:

**Automatic Execution**:
- Runs when a pull request is opened
- Runs when a pull request is edited
- Runs when new commits are pushed to a pull request branch (synchronize)

**What It Validates**:
- Code style consistency
- Swift best practices
- Naming conventions
- Code complexity
- Documentation completeness
- Unused code detection