# Build and Test Workflow

## Overview

This GitHub Actions workflow performs continuous integration tasks including building the project and running unit and snapshot tests.

## Workflow File

`.github/workflows/build-and-test.yml`

## Triggers

This workflow runs automatically and manually:

1. **Pull Request**: `pull_request`
   - Trigger: Automatically runs on pull requests
   - Types: `opened`, `edited`, `synchronize`
   - Purpose: Validate code changes before merging
   - Ensures all builds and tests pass before code review

2. **Manual Trigger**: `workflow_dispatch`
   - Can be manually triggered from the GitHub Actions tab
   - Navigate to Actions → "build-and-test" → "Run workflow"
   - Useful for running tests on-demand without creating a PR
   - Requires appropriate repository permissions

## Environment Variables

- `swift_version`: `6.2` - Swift version used for all jobs
- `xcode_path`: `/Applications/Xcode_26.3.app` - Xcode installation path
- `demo_app_name`: `SparkDemoApp` - Name of the demo app scheme, used to build it and to name the uploaded xcresult artifact

## Jobs

### 1. Build Job

**Name**: Build
**Runner**: macos-26

**Steps**:
1. **Package name** - Logs the workspace path
2. **Set Swift Version** - Uses `swift-actions/setup-swift@v2.4.0` to configure Swift 6.2
3. **Get swift version** - Verifies Swift installation
4. **Select Xcode** - Configures Xcode 26.3
5. **Checkout Action** - Checks out the repository using `actions/checkout@v6`
6. **Build** - Executes `make build` to build all packages

### 2. Tests Job

**Name**: Tests
**Runner**: macos-26

**Steps**:
1. **Package name** - Logs the workspace path
2. **Set Swift Version** - Uses `swift-actions/setup-swift@v2.4.0` to configure Swift 6.2
3. **Get swift version** - Verifies Swift installation
4. **Select Xcode** - Configures Xcode 26.3
5. **Checkout Action** - Checks out the repository using `actions/checkout@v6`
6. **Test** - Executes `make test` with a 30-minute timeout

### 4. Build Demo App Job

**Name**: Build Demo App
**Runner**: macos-26

**Steps**:
1. **Select Xcode** - Configures Xcode 26.3
2. **Checkout Action** - Checks out the repository using `actions/checkout@v6`
3. **Run xcodegen** - Uses `xavierLowmiller/xcodegen-action@1.2.2` to generate the Xcode project from `project.yml`
4. **Build** - Executes `make build-demo-app` to build the demo app scheme for the iOS Simulator (`iPhone 17`, `OS=26.2`)
5. **Upload xcresult file** - On failure, uploads the `.xcresult` bundle as an artifact (`actions/upload-artifact@v6`), retained for 15 days

## Notes

- All jobs run in parallel on macOS 26 runners
- Each job independently sets up Xcode; the Build, Unit Test, and Snapshot Test jobs also set up Swift
- Test jobs have a 15-minute timeout to prevent hanging
- The Build Demo App job uploads the xcresult bundle as an artifact only when the build fails, to help diagnose the failure
- Runner information is available at:
  - General: https://github.com/actions/runner-images
  - macOS-specific: https://github.com/actions/runner-images/tree/main/images/macos

## Usage

This workflow automatically runs on all pull requests to ensure code quality. It can also be manually triggered when you need to verify that:
- All packages build successfully
- All unit tests pass
- All snapshot tests pass
- The demo app builds successfully

**Automatic Execution**:
- Runs when a pull request is opened
- Runs when a pull request is edited
- Runs when new commits are pushed to a pull request branch (synchronize)

**Manual Execution**:
- Can be triggered from the GitHub Actions tab for on-demand testing

## Related Files

- `Makefile` - Contains the `build`, `test-unit`, `test-snapshots`, and `build-demo-app` targets
