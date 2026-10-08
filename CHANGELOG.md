# Changelog

## [Unreleased]

## [2.2.0]

_08/10/2026_

### 💥 Breaking Changes

- Removed iOS 16 support, iOS 17 is now the minimum deployment target ([#1125](https://github.com/leboncoin/spark-ios/pull/1125))

### 🐛 Bug Fixes

- Fixed the SparkCommon documentation URL

### 📚 Documentation

- Added a direct download link to the latest nightly demo app
- Added the simulator installation steps for the nightly demo app

### 🔧 Infrastructure & CI/CD

- Updated the nightly component listing workflows to run only on schedule

## [2.1.0]

_05/10/2026_

### ✨ New Features

#### Components
- Added visual identification to all SwiftUI and UIKit component views ([#1120](https://github.com/leboncoin/spark-ios/pull/1120))

#### SegmentedControl Component
- Added `sparkSegmentedControlRowLength(_:)` environment value to split segments into rows (default 4, 0 for a single line) ([#1122](https://github.com/leboncoin/spark-ios/pull/1122))

#### Iconography
- Added a script to generate the iconography DocC documentation, run by the icon update workflow ([#1123](https://github.com/leboncoin/spark-ios/pull/1123))

### 🚀 Improvements

- Migrated `AvatarViewModel` from `ObservableObject` to `@Observable` ([#1123](https://github.com/leboncoin/spark-ios/pull/1123))

### 🐛 Bug Fixes

- Fixed the Spinner rotation by starting it once the view model is set up ([#1121](https://github.com/leboncoin/spark-ios/pull/1121))
- Fixed DocC warnings by replacing symbol links to external types ([#1123](https://github.com/leboncoin/spark-ios/pull/1123))

### 📱 Demo App Improvements

- Added row length stepper and code syntax to the SegmentedControl demo ([#1122](https://github.com/leboncoin/spark-ios/pull/1122))
- Removed the deprecated SpinnerView from the Spinner demo ([#1121](https://github.com/leboncoin/spark-ios/pull/1121))

### 📚 Documentation

- Added 2.0.0 release notes and the changelog generation skill ([#1118](https://github.com/leboncoin/spark-ios/pull/1118))
- Added the Iconography page to the Resources documentation ([#1123](https://github.com/leboncoin/spark-ios/pull/1123))
- Documented the SegmentedControl row splitting rules ([#1122](https://github.com/leboncoin/spark-ios/pull/1122))

### 🔧 Infrastructure & CI/CD

- Deployed the documentation on published releases instead of pushes to main ([#1118](https://github.com/leboncoin/spark-ios/pull/1118))
- Fixed the `[Unreleased]` compare link and release links order in the update-changelog script ([#1118](https://github.com/leboncoin/spark-ios/pull/1118))

### 🧹 Chores

- Removed trailing commas in array literals ([#1119](https://github.com/leboncoin/spark-ios/pull/1119))

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

[Unreleased]: https://github.com/leboncoin/spark-ios/compare/2.2.0...HEAD

[2.2.0]: https://github.com/leboncoin/spark-ios/compare/2.1.0...2.2.0
[2.1.0]: https://github.com/leboncoin/spark-ios/compare/2.0.0...2.1.0
[2.0.0]: https://github.com/leboncoin/spark-ios/compare/1.0.0...2.0.0
[1.0.0]: https://github.com/leboncoin/spark-ios/compare/0.21.0...1.0.0