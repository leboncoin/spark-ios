# GitHub Actions Workflows Documentation

This document provides an overview of all continuous integration and deployment workflows used in the project.

## Table of Contents

- [Component Tracking Workflows](#component-tracking-workflows)
  - [List Components Workflow](#list-components-workflow)
  - [List Deprecated Components Workflow](#list-deprecated-components-workflow)
- [CI/CD Workflows](#cicd-workflows)
  - [Linter Workflow](#linter-workflow)
  - [Build and Test Workflow](#build-and-test-workflow)
  - [Deploy DocC to GitHub Pages](#deploy-docc-to-github-pages)
  - [PR Icon Updates](#pr-icon-updates)
  - [Release Changelog Update](#release-changelog-update)

---

## Component Tracking Workflows

### List Components Workflow

Automatically generates and archives a comprehensive list of all Spark components.

**Documentation:** [WORKFLOW_NIGHTLY_LIST_COMPONENTS.md](workflow/WORKFLOW_NIGHTLY_LIST_COMPONENTS.md)

**Description:**
- Triggers: Push to main, daily at 11 PM UTC, manual
- Executes `.script/list-components.sh`
- Generates `spark-components-listing.txt`
- Uploads artifact with 90-day retention
- Enables component inventory tracking over time

---

### List Deprecated Components Workflow

Generates JSON mapping of deprecated components to their replacements.

**Documentation:** [WORKFLOW_NIGHTLY_LIST_DEPRECATED_COMPONENTS.md](workflow/WORKFLOW_NIGHTLY_LIST_DEPRECATED_COMPONENTS.md)

**Description:**
- Triggers: Push to main, daily at 11 PM UTC, manual
- Executes `.script/list-deprecated-components.sh`
- Generates `spark-deprecated-components-listing.json`
- Uploads artifact with 90-day retention
- Supports migration planning and deprecation tracking

---

## CI/CD Workflows

### Linter Workflow

Automated code style and quality enforcement using SwiftLint.

**Documentation:** [WORKFLOW_LINTER.md](workflow/WORKFLOW_LINTER.md)

**Description:**
- Triggers: Pull requests (opened, edited, synchronize)
- Runs SwiftLint with multiple configurations
- Standard check, strict mode, and diff-based linting
- Enforces zero-warning policy with strict mode
- Validates only changed files for quick feedback

---

### Build and Test Workflow

Automated building and testing of the project.

**Documentation:** [WORKFLOW_BUILD_AND_TEST.md](workflow/WORKFLOW_BUILD_AND_TEST.md)

**Description:**
- Runs on pull requests and pushes
- Builds all packages
- Executes unit tests and snapshot tests
- Validates code quality
- Reports test results

---

### Deploy DocC to GitHub Pages

Automated documentation deployment to GitHub Pages.

**Documentation:** [WORKFLOW_DEPLOY_DOC_PAGE.md](workflow/WORKFLOW_DEPLOY_DOC_PAGE.md)

**Description:**
- Generates DocC documentation
- Transforms documentation for static hosting
- Deploys to GitHub Pages
- Updates documentation website automatically

---

### PR Icon Updates

Automated icon processing for pull requests.

**Documentation:** [WORKFLOW_PR_ICON_UPDATES.md](workflow/WORKFLOW_PR_ICON_UPDATES.md)

**Description:**
- Monitors icon asset changes in pull requests
- Processes new or updated icons
- Generates corresponding Swift code
- Ensures icon consistency

---

### Release Changelog Update

Automated CHANGELOG.md updates when releases are published.

**Documentation:** [WORKFLOW_RELEASE_CHANGELOG_UPDATE.md](workflow/WORKFLOW_RELEASE_CHANGELOG_UPDATE.md)

**Description:**
- Triggers when a new release is published
- Updates CHANGELOG.md with release notes
- Updates version comparison links
- Creates a pull request for review

---

## Usage

These workflows run automatically based on GitHub events. Refer to individual workflow documentation for specific triggers, configuration options, and customization details.
