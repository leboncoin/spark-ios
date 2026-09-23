# Scripts Documentation

This document provides an overview of all utility scripts available in the project for code generation and asset management.

## Table of Contents

- [Component Tracking Scripts](#component-tracking-scripts)
  - [List Components](#list-components)
  - [List Deprecated Components](#list-deprecated-components)
- [Iconography Scripts](#iconography-scripts)
  - [Generate Iconography Assets](#generate-iconography-assets)
  - [Generate Iconography Codebase](#generate-iconography-codebase)
- [Release Management Scripts](#release-management-scripts)
  - [Update Changelog](#update-changelog)

---

## Component Tracking Scripts

### List Components

Scans the monorepo to extract and list all public Spark component views.

**Documentation:** [SCRIPT_LIST_COMPONENTS.md](script/SCRIPT_LIST_COMPONENTS.md)

**Description:**
- Scans all `Modules/Components/*/Sources/Core` directories
- Extracts public UIKit and SwiftUI component declarations
- Filters and validates component types
- Generates alphabetically sorted component list
- Outputs to `spark-components-listing.txt` (120 components)

---

### List Deprecated Components

Identifies deprecated components and maps them to their recommended replacements.

**Documentation:** [SCRIPT_LIST_DEPRECATED_COMPONENTS.md](script/SCRIPT_LIST_DEPRECATED_COMPONENTS.md)

**Description:**
- Scans all `Modules/Components/*/Sources/Core` directories
- Identifies `@available(*, deprecated)` annotations
- Extracts deprecated component names and replacements
- Generates JSON mapping for migration guidance
- Outputs to `spark-deprecated-components-listing.json` (36 deprecated components)

---

## Iconography Scripts

### Generate Iconography Assets

Processes and organizes icon assets for the design system.

**Documentation:** [SCRIPT_GENERATE_ICONOGRAPHY_ASSETS.md](script/SCRIPT_GENERATE_ICONOGRAPHY_ASSETS.md)

**Description:**
- Processes raw icon assets
- Organizes icons into appropriate directories
- Validates icon formats and sizes
- Prepares icons for codebase generation

---

### Generate Iconography Codebase

Generates type-safe Swift code for icons.

**Documentation:** [SCRIPT_GENERATE_ICONOGRAPHY_CODEBASE.md](script/SCRIPT_GENERATE_ICONOGRAPHY_CODEBASE.md)

**Description:**
- Generates Swift code from icon assets
- Creates type-safe enums for icon references
- Ensures compile-time checking of icon resources
- Provides a clean API for accessing icons in code

---

## Release Management Scripts

### Update Changelog

Automatically updates CHANGELOG.md when a new release is published.

**Documentation:** [SCRIPT_UPDATE_CHANGELOG.md](script/SCRIPT_UPDATE_CHANGELOG.md)

**Description:**
- Updates CHANGELOG.md with release information
- Cleans and formats release notes
- Updates version comparison links
- Inserts new version section with current date

---

## Usage

All scripts are designed to be run from the project root directory. Refer to individual script documentation for specific usage instructions, parameters, and examples.
