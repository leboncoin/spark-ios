// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Spark",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Main Spark product that re-exports all components
        .library(
            name: "Spark",
            targets: ["Spark"]
        ),

        // Core products
        .library(
            name: "SparkThemingTesting",
            targets: ["SparkThemingTesting"]
        ),
        .library(
            name: "SparkTheme",
            targets: ["SparkTheme"]
        ),

        // Demo
        .library(
            name: "SparkDemo",
            targets: ["SparkDemo"]
        ),
    ],
    dependencies: [
        // External dependencies
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing",
            from: "1.11.0"
        ),
    ],
    targets: [
        // Main Spark target that re-exports all components
        .target(
            name: "Spark",
            dependencies: [
                // Core
                "SparkCommon",
                "SparkTheming",

                // Components
                "SparkComponentAvatar",
                "SparkComponentBadge",
                "SparkComponentBottomSheet",
                "SparkComponentButton",
                "SparkComponentCard",
                "SparkComponentCheckbox",
                "SparkComponentChip",
                "SparkComponentCircularMeter",
                "SparkComponentDivider",
                "SparkComponentFileUpload",
                "SparkComponentFormField",
                "SparkComponentIcon",
                "SparkComponentInputOTP",
                "SparkComponentPopover",
                "SparkComponentProgressBar",
                "SparkComponentProgressTracker",
                "SparkComponentRadioButton",
                "SparkComponentRating",
                "SparkComponentSegmentedControl",
                "SparkComponentSegmentedGauge",
                "SparkComponentSelectionControls",
                "SparkComponentSlider",
                "SparkComponentSnackbar",
                "SparkComponentSpinner",
                "SparkComponentStepper",
                "SparkComponentSwitch",
                "SparkComponentTab",
                "SparkComponentTag",
                "SparkComponentTextInput",
                "SparkComponentTextLink",

                // Resources
                "SparkResources"
            ],
            path: "Spark/Sources/Core"
        ),

        // Core targets
        .target(
            name: "SparkCommon",
            dependencies: [
                "SparkTheming"
            ],
            path: "Modules/Common/Sources/Core"
        ),
        .target(
            name: "SparkCommonTesting",
            dependencies: [
                "SparkCommon",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Common/Sources/Testing"
        ),
        .target(
            name: "SparkCommonSnapshotTesting",
            dependencies: [
                "SparkCommon",
                "SparkThemingTesting",
                "SparkTheme",
                .product(
                    name: "SnapshotTesting",
                    package: "swift-snapshot-testing"
                ),
            ],
            path: "Modules/Common/Sources/SnapshotTesting"
        ),
        .target(
            name: "SparkTheming",
            path: "Modules/Theming/Sources/Core"
        ),
        .target(
            name: "SparkThemingTesting",
            dependencies: [
                "SparkTheming"
            ],
            path: "Modules/Theming/Sources/Testing"
        ),
        .target(
            name: "SparkTheme",
            dependencies: [
                "SparkTheming"
            ],
            path: "Modules/Theming/Sources/Theme",
            resources: [
                .process("Resources/")
            ]
        ),

        // Component targets (alphabetically sorted)
        // Avatar
        .target(
            name: "SparkComponentAvatar",
            dependencies: [
                "SparkResources",
                "SparkCommon",
                "SparkTheming",
                "SparkComponentBadge"
            ],
            path: "Modules/Components/Avatar/Sources/Core"
        ),
        .target(
            name: "SparkComponentAvatarTesting",
            dependencies: [
                "SparkComponentAvatar",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Avatar/Sources/Testing"
        ),

        // Badge
        .target(
            name: "SparkComponentBadge",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/Badge/Sources/Core"
        ),
        .target(
            name: "SparkComponentBadgeTesting",
            dependencies: [
                "SparkComponentBadge",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Badge/Sources/Testing"
        ),

        // BottomSheet
        .target(
            name: "SparkComponentBottomSheet",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/BottomSheet/Sources/Core"
        ),
        .target(
            name: "SparkBottomSheetTesting",
            dependencies: [
                "SparkComponentBottomSheet",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/BottomSheet/Sources/Testing"
        ),

        // Button
        .target(
            name: "SparkComponentButton",
            dependencies: [
                "SparkCommon",
                "SparkComponentSpinner",
                "SparkTheming"
            ],
            path: "Modules/Components/Button/Sources/Core"
        ),
        .target(
            name: "SparkComponentButtonTesting",
            dependencies: [
                "SparkComponentButton",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkComponentSpinner",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Button/Sources/Testing"
        ),

        // Card
        .target(
            name: "SparkComponentCard",
            dependencies: [
                "SparkCommon",
                "SparkComponentButton",
                "SparkComponentTextLink",
                "SparkTheming"
            ],
            path: "Modules/Components/Card/Sources/Core"
        ),
        .target(
            name: "SparkComponentCardTesting",
            dependencies: [
                "SparkComponentCard",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Card/Sources/Testing"
        ),

        // Checkbox
        .target(
            name: "SparkComponentCheckbox",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/Checkbox/Sources/Core"
        ),
        .target(
            name: "SparkComponentCheckboxTesting",
            dependencies: [
                "SparkComponentCheckbox",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Checkbox/Sources/Testing"
        ),

        // Chip
        .target(
            name: "SparkComponentChip",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/Chip/Sources/Core"
        ),
        .target(
            name: "SparkComponentChipTesting",
            dependencies: [
                "SparkComponentChip",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Chip/Sources/Testing"
        ),

        // CircularMeter
        .target(
            name: "SparkComponentCircularMeter",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/CircularMeter/Sources/Core"
        ),
        .target(
            name: "SparkComponentCircularMeterTesting",
            dependencies: [
                "SparkComponentCircularMeter",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/CircularMeter/Sources/Testing"
        ),

        // Divider
        .target(
            name: "SparkComponentDivider",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/Divider/Sources/Core"
        ),
        .target(
            name: "SparkComponentDividerTesting",
            dependencies: [
                "SparkComponentDivider",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Divider/Sources/Testing"
        ),

        // FileUpload
        .target(
            name: "SparkComponentFileUpload",
            dependencies: [
                "SparkResources",
                "SparkCommon",
                "SparkComponentButton",
                "SparkComponentSpinner",
                "SparkTheming"
            ],
            path: "Modules/Components/FileUpload/Sources/Core"
        ),
        .target(
            name: "SparkComponentFileUploadTesting",
            dependencies: [
                "SparkComponentFileUpload",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkComponentButton",
                "SparkComponentSpinner",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/FileUpload/Sources/Testing",
            resources: [
                .process("Resources")
            ]
        ),

        // FormField
        .target(
            name: "SparkComponentFormField",
            dependencies: [
                "SparkCommon",
                "SparkComponentTextInput",
                "SparkTheming"
            ],
            path: "Modules/Components/FormField/Sources/Core"
        ),
        .target(
            name: "SparkComponentFormFieldTesting",
            dependencies: [
                "SparkComponentFormField",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/FormField/Sources/Testing"
        ),

        // Icon
        .target(
            name: "SparkComponentIcon",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/Icon/Sources/Core"
        ),
        .target(
            name: "SparkComponentIconTesting",
            dependencies: [
                "SparkComponentIcon",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Icon/Sources/Testing"
        ),

        // InputOTP
        .target(
            name: "SparkComponentInputOTP",
            dependencies: [
                "SparkResources",
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/InputOTP/Sources/Core"
        ),
        .target(
            name: "SparkComponentInputOTPTesting",
            dependencies: [
                "SparkComponentInputOTP",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/InputOTP/Sources/Testing"
        ),

        // Popover
        .target(
            name: "SparkComponentPopover",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/Popover/Sources/Core"
        ),
        .target(
            name: "SparkComponentPopoverTesting",
            dependencies: [
                "SparkComponentPopover",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Popover/Sources/Testing"
        ),

        // ProgressBar
        .target(
            name: "SparkComponentProgressBar",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/ProgressBar/Sources/Core"
        ),
        .target(
            name: "SparkComponentProgressBarTesting",
            dependencies: [
                "SparkComponentProgressBar",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/ProgressBar/Sources/Testing"
        ),

        // ProgressTracker
        .target(
            name: "SparkComponentProgressTracker",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/ProgressTracker/Sources/Core"
        ),
        .target(
            name: "SparkComponentProgressTrackerTesting",
            dependencies: [
                "SparkComponentProgressTracker",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/ProgressTracker/Sources/Testing"
        ),

        // RadioButton
        .target(
            name: "SparkComponentRadioButton",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/RadioButton/Sources/Core"
        ),
        .target(
            name: "SparkComponentRadioButtonTesting",
            dependencies: [
                "SparkComponentRadioButton",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/RadioButton/Sources/Testing"
        ),

        // Rating
        .target(
            name: "SparkComponentRating",
            dependencies: [
                "SparkResources",
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/Rating/Sources/Core"
        ),
        .target(
            name: "SparkComponentRatingTesting",
            dependencies: [
                "SparkComponentRating",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Rating/Sources/Testing"
        ),

        // SegmentedControl
        .target(
            name: "SparkComponentSegmentedControl",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/SegmentedControl/Sources/Core"
        ),
        .target(
            name: "SparkComponentSegmentedControlTesting",
            dependencies: [
                "SparkComponentSegmentedControl",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/SegmentedControl/Sources/Testing"
        ),

        // SegmentedGauge
        .target(
            name: "SparkComponentSegmentedGauge",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/SegmentedGauge/Sources/Core"
        ),
        .target(
            name: "SparkComponentSegmentedGaugeTesting",
            dependencies: [
                "SparkComponentSegmentedGauge",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/SegmentedGauge/Sources/Testing"
        ),

        // SelectionControls
        .target(
            name: "SparkComponentSelectionControls",
            dependencies: [
                "SparkResources",
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/SelectionControls/Sources/Core"
        ),
        .target(
            name: "SparkComponentSelectionControlsTesting",
            dependencies: [
                "SparkComponentSelectionControls",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/SelectionControls/Sources/Testing"
        ),

        // Slider
        .target(
            name: "SparkComponentSlider",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/Slider/Sources/Core"
        ),
        .target(
            name: "SparkComponentSliderTesting",
            dependencies: [
                "SparkComponentSlider",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Slider/Sources/Testing"
        ),

        // Snackbar
        .target(
            name: "SparkComponentSnackbar",
            dependencies: [
                "SparkCommon",
                "SparkTheming",
                "SparkComponentButton"
            ],
            path: "Modules/Components/Snackbar/Sources/Core"
        ),
        .target(
            name: "SparkComponentSnackbarTesting",
            dependencies: [
                "SparkComponentSnackbar",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Snackbar/Sources/Testing"
        ),

        // Spinner
        .target(
            name: "SparkComponentSpinner",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/Spinner/Sources/Core"
        ),
        .target(
            name: "SparkComponentSpinnerTesting",
            dependencies: [
                "SparkComponentSpinner",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Spinner/Sources/Testing"
        ),

        // Stepper
        .target(
            name: "SparkComponentStepper",
            dependencies: [
                "SparkResources",
                "SparkCommon",
                "SparkTheming",
                "SparkComponentButton"
            ],
            path: "Modules/Components/Stepper/Sources/Core",
            resources: [
                .process("Resources/Localizable.xcstrings")
            ]
        ),
        .target(
            name: "SparkComponentStepperTesting",
            dependencies: [
                "SparkComponentStepper",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Stepper/Sources/Testing"
        ),

        // Switch
        .target(
            name: "SparkComponentSwitch",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/Switch/Sources/Core"
        ),
        .target(
            name: "SparkComponentSwitchTesting",
            dependencies: [
                "SparkComponentSwitch",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Switch/Sources/Testing"
        ),

        // Tab
        .target(
            name: "SparkComponentTab",
            dependencies: [
                "SparkCommon",
                "SparkTheming",
                "SparkComponentBadge"
            ],
            path: "Modules/Components/Tab/Sources/Core"
        ),
        .target(
            name: "SparkComponentTabTesting",
            dependencies: [
                "SparkComponentTab",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Tab/Sources/Testing"
        ),

        // Tag
        .target(
            name: "SparkComponentTag",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/Tag/Sources/Core"
        ),
        .target(
            name: "SparkComponentTagTesting",
            dependencies: [
                "SparkComponentTag",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/Tag/Sources/Testing"
        ),

        // TextInput
        .target(
            name: "SparkComponentTextInput",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/TextInput/Sources/Core"
        ),
        .target(
            name: "SparkComponentTextInputTesting",
            dependencies: [
                "SparkComponentTextInput",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/TextInput/Sources/Testing"
        ),

        // TextLink
        .target(
            name: "SparkComponentTextLink",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Modules/Components/TextLink/Sources/Core"
        ),
        .target(
            name: "SparkComponentTextLinkTesting",
            dependencies: [
                "SparkComponentTextLink",
                "SparkCommon",
                "SparkCommonTesting",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Modules/Components/TextLink/Sources/Testing"
        ),

        // Core test targets
        .testTarget(
            name: "SparkCommonUnitTests",
            dependencies: [
                "SparkCommon",
                "SparkCommonTesting"
            ],
            path: "Modules/Common/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkCommonSnapshotTests",
            dependencies: [
                "SparkCommon",
                "SparkCommonSnapshotTesting",
                "SparkCommonTesting"
            ],
            path: "Modules/Common/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkThemingUnitTests",
            dependencies: [
                "SparkTheming",
                "SparkThemingTesting"
            ],
            path: "Modules/Theming/Tests/UnitTests"
        ),

        // Component test targets (alphabetically sorted)
        .testTarget(
            name: "SparkComponentAvatarUnitTests",
            dependencies: [
                "SparkResources",
                "SparkComponentAvatar",
                "SparkComponentAvatarTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Avatar/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentAvatarSnapshotTests",
            dependencies: [
                "SparkComponentAvatar",
                "SparkComponentAvatarTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Avatar/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentBadgeUnitTests",
            dependencies: [
                "SparkComponentBadge",
                "SparkComponentBadgeTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Badge/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentBadgeSnapshotTests",
            dependencies: [
                "SparkComponentBadge",
                "SparkComponentBadgeTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Badge/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkBottomSheetUnitTests",
            dependencies: [
                "SparkComponentBottomSheet",
                "SparkBottomSheetTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/BottomSheet/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkBottomSheetSnapshotTests",
            dependencies: [
                "SparkComponentBottomSheet",
                "SparkBottomSheetTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/BottomSheet/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentButtonUnitTests",
            dependencies: [
                "SparkComponentButton",
                "SparkComponentButtonTesting",
                "SparkCommonTesting",
                "SparkComponentSpinner",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Button/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentButtonSnapshotTests",
            dependencies: [
                "SparkComponentButton",
                "SparkComponentButtonTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Button/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentCardUnitTests",
            dependencies: [
                "SparkComponentCard",
                "SparkComponentCardTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Card/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentCardSnapshotTests",
            dependencies: [
                "SparkResources",
                "SparkComponentCard",
                "SparkComponentCardTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Card/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentCheckboxUnitTests",
            dependencies: [
                "SparkComponentCheckbox",
                "SparkComponentCheckboxTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Checkbox/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentCheckboxSnapshotTests",
            dependencies: [
                "SparkComponentCheckbox",
                "SparkComponentCheckboxTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Checkbox/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentChipUnitTests",
            dependencies: [
                "SparkComponentChip",
                "SparkComponentChipTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Chip/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentChipSnapshotTests",
            dependencies: [
                "SparkComponentChip",
                "SparkComponentChipTesting",
                "SparkCommonSnapshotTesting"
            ],
            path: "Modules/Components/Chip/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentCircularMeterUnitTests",
            dependencies: [
                "SparkComponentCircularMeter",
                "SparkComponentCircularMeterTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/CircularMeter/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentCircularMeterSnapshotTests",
            dependencies: [
                "SparkResources",
                "SparkComponentCircularMeter",
                "SparkComponentCircularMeterTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/CircularMeter/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentDividerUnitTests",
            dependencies: [
                "SparkComponentDivider",
                "SparkComponentDividerTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Divider/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentDividerSnapshotTests",
            dependencies: [
                "SparkComponentDivider",
                "SparkComponentDividerTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Divider/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentFileUploadUnitTests",
            dependencies: [
                "SparkResources",
                "SparkComponentFileUpload",
                "SparkComponentFileUploadTesting",
                "SparkCommonTesting",
                "SparkComponentButtonTesting",
                "SparkComponentSpinnerTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/FileUpload/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentFileUploadSnapshotTests",
            dependencies: [
                "SparkResources",
                "SparkComponentFileUpload",
                "SparkComponentFileUploadTesting",
                "SparkCommonSnapshotTesting"
            ],
            path: "Modules/Components/FileUpload/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentFormFieldUnitTests",
            dependencies: [
                "SparkComponentFormField",
                "SparkComponentFormFieldTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/FormField/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentFormFieldSnapshotTests",
            dependencies: [
                "SparkComponentFormField",
                "SparkComponentFormFieldTesting",
                "SparkCommonSnapshotTesting"
            ],
            path: "Modules/Components/FormField/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentIconUnitTests",
            dependencies: [
                "SparkComponentIcon",
                "SparkComponentIconTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Icon/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentIconSnapshotTests",
            dependencies: [
                "SparkComponentIcon",
                "SparkComponentIconTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Icon/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentInputOTPUnitTests",
            dependencies: [
                "SparkComponentInputOTP",
                "SparkComponentInputOTPTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/InputOTP/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentInputOTPSnapshotTests",
            dependencies: [
                "SparkComponentInputOTP",
                "SparkComponentInputOTPTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/InputOTP/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentPopoverUnitTests",
            dependencies: [
                "SparkComponentPopover",
                "SparkComponentPopoverTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Popover/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentPopoverSnapshotTests",
            dependencies: [
                "SparkComponentPopover",
                "SparkComponentPopoverTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Popover/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentProgressBarUnitTests",
            dependencies: [
                "SparkComponentProgressBar",
                "SparkComponentProgressBarTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/ProgressBar/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentProgressBarSnapshotTests",
            dependencies: [
                "SparkComponentProgressBar",
                "SparkComponentProgressBarTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/ProgressBar/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentProgressTrackerUnitTests",
            dependencies: [
                "SparkComponentProgressTracker",
                "SparkComponentProgressTrackerTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/ProgressTracker/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentProgressTrackerSnapshotTests",
            dependencies: [
                "SparkComponentProgressTracker",
                "SparkComponentProgressTrackerTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/ProgressTracker/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentRadioButtonUnitTests",
            dependencies: [
                "SparkComponentRadioButton",
                "SparkComponentRadioButtonTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/RadioButton/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentRadioButtonSnapshotTests",
            dependencies: [
                "SparkComponentRadioButton",
                "SparkComponentRadioButtonTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/RadioButton/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentRatingUnitTests",
            dependencies: [
                "SparkComponentRating",
                "SparkComponentRatingTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Rating/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentRatingSnapshotTests",
            dependencies: [
                "SparkComponentRating",
                "SparkComponentRatingTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Rating/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSegmentedControlUnitTests",
            dependencies: [
                "SparkComponentSegmentedControl",
                "SparkComponentSegmentedControlTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/SegmentedControl/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSegmentedControlSnapshotTests",
            dependencies: [
                "SparkResources",
                "SparkComponentSegmentedControl",
                "SparkComponentSegmentedControlTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/SegmentedControl/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSegmentedGaugeUnitTests",
            dependencies: [
                "SparkComponentSegmentedGauge",
                "SparkComponentSegmentedGaugeTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/SegmentedGauge/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSegmentedGaugeSnapshotTests",
            dependencies: [
                "SparkComponentSegmentedGauge",
                "SparkComponentSegmentedGaugeTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/SegmentedGauge/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSelectionControlsUnitTests",
            dependencies: [
                "SparkComponentSelectionControls",
                "SparkComponentSelectionControlsTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/SelectionControls/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSelectionControlsSnapshotTests",
            dependencies: [
                "SparkComponentSelectionControls",
                "SparkComponentSelectionControlsTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/SelectionControls/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSliderUnitTests",
            dependencies: [
                "SparkComponentSlider",
                "SparkComponentSliderTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Slider/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSliderSnapshotTests",
            dependencies: [
                "SparkComponentSlider",
                "SparkComponentSliderTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Slider/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSnackbarUnitTests",
            dependencies: [
                "SparkComponentSnackbar",
                "SparkComponentSnackbarTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Snackbar/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSnackbarSnapshotTests",
            dependencies: [
                "SparkComponentSnackbar",
                "SparkComponentSnackbarTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Snackbar/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSpinnerUnitTests",
            dependencies: [
                "SparkComponentSpinner",
                "SparkComponentSpinnerTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Spinner/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSpinnerSnapshotTests",
            dependencies: [
                "SparkComponentSpinner",
                "SparkComponentSpinnerTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Spinner/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentStepperUnitTests",
            dependencies: [
                "SparkComponentStepper",
                "SparkComponentStepperTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Stepper/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentStepperSnapshotTests",
            dependencies: [
                "SparkComponentStepper",
                "SparkComponentStepperTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Stepper/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSwitchUnitTests",
            dependencies: [
                "SparkComponentSwitch",
                "SparkComponentSwitchTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Switch/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSwitchSnapshotTests",
            dependencies: [
                "SparkComponentSwitch",
                "SparkComponentSwitchTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Switch/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentTabUnitTests",
            dependencies: [
                "SparkComponentTab",
                "SparkComponentTabTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Tab/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentTabSnapshotTests",
            dependencies: [
                "SparkComponentTab",
                "SparkComponentTabTesting",
                "SparkCommonSnapshotTesting"
            ],
            path: "Modules/Components/Tab/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentTagUnitTests",
            dependencies: [
                "SparkComponentTag",
                "SparkComponentTagTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/Tag/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentTagSnapshotTests",
            dependencies: [
                "SparkComponentTag",
                "SparkComponentTagTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/Tag/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentTextInputUnitTests",
            dependencies: [
                "SparkComponentTextInput",
                "SparkComponentTextInputTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/TextInput/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentTextInputSnapshotTests",
            dependencies: [
                "SparkComponentTextInput",
                "SparkComponentTextInputTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/TextInput/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentTextLinkUnitTests",
            dependencies: [
                "SparkComponentTextLink",
                "SparkComponentTextLinkTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Modules/Components/TextLink/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentTextLinkSnapshotTests",
            dependencies: [
                "SparkComponentTextLink",
                "SparkComponentTextLinkTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Modules/Components/TextLink/Tests/SnapshotTests"
        ),

        // Resources
        .target(
            name: "SparkResources",
            path: "Resources/Sources/Core",
            resources: [
                .process("Assets/")
            ]
        ),

        // Demo App targets
        .target(
            name: "SparkDemo",
            dependencies: [
                "Spark",
                "SparkTheme",
            ],
            path: "Demo/Sources/Core",
            resources: [
                .process("Resources/")
            ]
        )
    ]
)
