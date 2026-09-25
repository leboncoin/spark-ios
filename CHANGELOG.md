# Changelog

## [Unreleased]

## [2.0.0]

_25/09/2026_

### 💥 Breaking Changes

- Migrated to a monorepo: all components, common, theming, resources and demo sources are now imported in this repository ([#1116](https://github.com/leboncoin/spark-ios/pull/1116))
- Renamed the `Dependencies` folder to `Modules` and removed commented-out library products from `Package.swift` ([#1117](https://github.com/leboncoin/spark-ios/pull/1117))

### ✨ New Features

#### Iconography
- Updated icons and added iconography assets with generated code ([#1115](https://github.com/leboncoin/spark-ios/pull/1115))
- Added iconography generation scripts and Makefile ([#1115](https://github.com/leboncoin/spark-ios/pull/1115))

#### Tooling
- Added component creation templates and skills ([#1116](https://github.com/leboncoin/spark-ios/pull/1116))

### 📚 Documentation

- Added documentation site with landing page, favicon and fixed images and links ([#1116](https://github.com/leboncoin/spark-ios/pull/1116))
- Added SPM integration guide and removed duplicated per-component setup docs ([#1116](https://github.com/leboncoin/spark-ios/pull/1116))
- Added architecture and contributing docs ([#1116](https://github.com/leboncoin/spark-ios/pull/1116))
- Updated Spark tokens bridge setup documentation ([#1115](https://github.com/leboncoin/spark-ios/pull/1115))

### 🔧 Infrastructure & CI/CD

#### GitHub Actions
- Bumped Xcode to 26.6 and updated default simulator destination to iPhone 17 Pro (iOS 26.5) ([#1116](https://github.com/leboncoin/spark-ios/pull/1116))
- Merged unit and snapshot test jobs into a single test job ([#1116](https://github.com/leboncoin/spark-ios/pull/1116))
- Uploaded xcresult artifact on test job failure ([#1116](https://github.com/leboncoin/spark-ios/pull/1116))
- Installed Sourcery in CI and ran it before build and documentation deployment ([#1116](https://github.com/leboncoin/spark-ios/pull/1116))
- Fixed spark-token folder cleanup in the icon update workflow ([#1115](https://github.com/leboncoin/spark-ios/pull/1115))

#### Tests
- Updated snapshots with the new Xcode configuration ([#1117](https://github.com/leboncoin/spark-ios/pull/1117))

## [1.0.0]

_27/03/2025_

### ✨ New Features

#### TextEditor Component
- Added SwiftUI TextEditor component for multiline text input ([#1106](https://github.com/leboncoin/spark-ios/pull/1106))

#### Stepper Component
- Added Stepper component to the demo app ([#1113](https://github.com/leboncoin/spark-ios/pull/1113))

### 📱 Demo App Improvements

#### Component Demos
- Updated Radio Button demos with enhanced examples ([#1103](https://github.com/leboncoin/spark-ios/pull/1103))
- Added Snackbar presentation demos for both UIKit and SwiftUI ([#1104](https://github.com/leboncoin/spark-ios/pull/1104))

#### Refactoring
- Comprehensive demo app refactoring for better organization and maintainability ([#1112](https://github.com/leboncoin/spark-ios/pull/1112))

### 🐛 Bug Fixes

- Fixed Snackbar demos to ensure proper functionality ([#1105](https://github.com/leboncoin/spark-ios/pull/1105))

### 🔧 Infrastructure & CI/CD

#### GitHub Actions
- Added scheduled action to automatically generate the demo app ([#1102](https://github.com/leboncoin/spark-ios/pull/1102))
- Updated Xcode version for better compatibility ([#1109](https://github.com/leboncoin/spark-ios/pull/1109))
- Updated iPhone simulator and iOS version configurations ([#1111](https://github.com/leboncoin/spark-ios/pull/1111))

<!-- Links -->

[Unreleased]: https://github.com/leboncoin/spark-ios/compare/2.0.0...HEAD

[2.0.0]: https://github.com/leboncoin/spark-ios/compare/1.0.0...2.0.0
[1.0.0]: https://github.com/leboncoin/spark-ios/compare/0.21.0...1.0.0