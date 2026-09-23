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
            path: "Dependencies/Common/Sources/Core"
        ),
        .target(
            name: "SparkCommonTesting",
            dependencies: [
                "SparkCommon",
                "SparkThemingTesting",
                "SparkTheme"
            ],
            path: "Dependencies/Common/Sources/Testing"
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
            path: "Dependencies/Common/Sources/SnapshotTesting"
        ),
        .target(
            name: "SparkTheming",
            path: "Dependencies/Theming/Sources/Core"
        ),
        .target(
            name: "SparkThemingTesting",
            dependencies: [
                "SparkTheming"
            ],
            path: "Dependencies/Theming/Sources/Testing"
        ),
        .target(
            name: "SparkTheme",
            dependencies: [
                "SparkTheming"
            ],
            path: "Dependencies/Theming/Sources/Theme",
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
            path: "Dependencies/ComponentAvatar/Sources/Core"
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
            path: "Dependencies/ComponentAvatar/Sources/Testing"
        ),

        // Badge
        .target(
            name: "SparkComponentBadge",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentBadge/Sources/Core"
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
            path: "Dependencies/ComponentBadge/Sources/Testing"
        ),

        // BottomSheet
        .target(
            name: "SparkComponentBottomSheet",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentBottomSheet/Sources/Core"
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
            path: "Dependencies/ComponentBottomSheet/Sources/Testing"
        ),

        // Button
        .target(
            name: "SparkComponentButton",
            dependencies: [
                "SparkCommon",
                "SparkComponentSpinner",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentButton/Sources/Core"
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
            path: "Dependencies/ComponentButton/Sources/Testing"
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
            path: "Dependencies/ComponentCard/Sources/Core"
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
            path: "Dependencies/ComponentCard/Sources/Testing"
        ),

        // Checkbox
        .target(
            name: "SparkComponentCheckbox",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentCheckbox/Sources/Core"
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
            path: "Dependencies/ComponentCheckbox/Sources/Testing"
        ),

        // Chip
        .target(
            name: "SparkComponentChip",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentChip/Sources/Core"
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
            path: "Dependencies/ComponentChip/Sources/Testing"
        ),

        // CircularMeter
        .target(
            name: "SparkComponentCircularMeter",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentCircularMeter/Sources/Core"
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
            path: "Dependencies/ComponentCircularMeter/Sources/Testing"
        ),

        // Divider
        .target(
            name: "SparkComponentDivider",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentDivider/Sources/Core"
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
            path: "Dependencies/ComponentDivider/Sources/Testing"
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
            path: "Dependencies/ComponentFileUpload/Sources/Core"
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
            path: "Dependencies/ComponentFileUpload/Sources/Testing",
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
            path: "Dependencies/ComponentFormField/Sources/Core"
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
            path: "Dependencies/ComponentFormField/Sources/Testing"
        ),

        // Icon
        .target(
            name: "SparkComponentIcon",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentIcon/Sources/Core"
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
            path: "Dependencies/ComponentIcon/Sources/Testing"
        ),

        // InputOTP
        .target(
            name: "SparkComponentInputOTP",
            dependencies: [
                "SparkResources",
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentInputOTP/Sources/Core"
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
            path: "Dependencies/ComponentInputOTP/Sources/Testing"
        ),

        // Popover
        .target(
            name: "SparkComponentPopover",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentPopover/Sources/Core"
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
            path: "Dependencies/ComponentPopover/Sources/Testing"
        ),

        // ProgressBar
        .target(
            name: "SparkComponentProgressBar",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentProgressBar/Sources/Core"
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
            path: "Dependencies/ComponentProgressBar/Sources/Testing"
        ),

        // ProgressTracker
        .target(
            name: "SparkComponentProgressTracker",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentProgressTracker/Sources/Core"
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
            path: "Dependencies/ComponentProgressTracker/Sources/Testing"
        ),

        // RadioButton
        .target(
            name: "SparkComponentRadioButton",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentRadioButton/Sources/Core"
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
            path: "Dependencies/ComponentRadioButton/Sources/Testing"
        ),

        // Rating
        .target(
            name: "SparkComponentRating",
            dependencies: [
                "SparkResources",
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentRating/Sources/Core"
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
            path: "Dependencies/ComponentRating/Sources/Testing"
        ),

        // SegmentedControl
        .target(
            name: "SparkComponentSegmentedControl",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentSegmentedControl/Sources/Core"
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
            path: "Dependencies/ComponentSegmentedControl/Sources/Testing"
        ),

        // SegmentedGauge
        .target(
            name: "SparkComponentSegmentedGauge",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentSegmentedGauge/Sources/Core"
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
            path: "Dependencies/ComponentSegmentedGauge/Sources/Testing"
        ),

        // SelectionControls
        .target(
            name: "SparkComponentSelectionControls",
            dependencies: [
                "SparkResources",
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentSelectionControls/Sources/Core"
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
            path: "Dependencies/ComponentSelectionControls/Sources/Testing"
        ),

        // Slider
        .target(
            name: "SparkComponentSlider",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentSlider/Sources/Core"
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
            path: "Dependencies/ComponentSlider/Sources/Testing"
        ),

        // Snackbar
        .target(
            name: "SparkComponentSnackbar",
            dependencies: [
                "SparkCommon",
                "SparkTheming",
                "SparkComponentButton"
            ],
            path: "Dependencies/ComponentSnackbar/Sources/Core"
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
            path: "Dependencies/ComponentSnackbar/Sources/Testing"
        ),

        // Spinner
        .target(
            name: "SparkComponentSpinner",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentSpinner/Sources/Core"
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
            path: "Dependencies/ComponentSpinner/Sources/Testing"
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
            path: "Dependencies/ComponentStepper/Sources/Core",
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
            path: "Dependencies/ComponentStepper/Sources/Testing"
        ),

        // Switch
        .target(
            name: "SparkComponentSwitch",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentSwitch/Sources/Core"
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
            path: "Dependencies/ComponentSwitch/Sources/Testing"
        ),

        // Tab
        .target(
            name: "SparkComponentTab",
            dependencies: [
                "SparkCommon",
                "SparkTheming",
                "SparkComponentBadge"
            ],
            path: "Dependencies/ComponentTab/Sources/Core"
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
            path: "Dependencies/ComponentTab/Sources/Testing"
        ),

        // Tag
        .target(
            name: "SparkComponentTag",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentTag/Sources/Core"
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
            path: "Dependencies/ComponentTag/Sources/Testing"
        ),

        // TextInput
        .target(
            name: "SparkComponentTextInput",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentTextInput/Sources/Core"
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
            path: "Dependencies/ComponentTextInput/Sources/Testing"
        ),

        // TextLink
        .target(
            name: "SparkComponentTextLink",
            dependencies: [
                "SparkCommon",
                "SparkTheming"
            ],
            path: "Dependencies/ComponentTextLink/Sources/Core"
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
            path: "Dependencies/ComponentTextLink/Sources/Testing"
        ),

        // Core test targets
        .testTarget(
            name: "SparkCommonUnitTests",
            dependencies: [
                "SparkCommon",
                "SparkCommonTesting"
            ],
            path: "Dependencies/Common/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkCommonSnapshotTests",
            dependencies: [
                "SparkCommon",
                "SparkCommonSnapshotTesting",
                "SparkCommonTesting"
            ],
            path: "Dependencies/Common/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkThemingUnitTests",
            dependencies: [
                "SparkTheming",
                "SparkThemingTesting"
            ],
            path: "Dependencies/Theming/Tests/UnitTests"
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
            path: "Dependencies/ComponentAvatar/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentAvatarSnapshotTests",
            dependencies: [
                "SparkComponentAvatar",
                "SparkComponentAvatarTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentAvatar/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentBadgeUnitTests",
            dependencies: [
                "SparkComponentBadge",
                "SparkComponentBadgeTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentBadge/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentBadgeSnapshotTests",
            dependencies: [
                "SparkComponentBadge",
                "SparkComponentBadgeTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentBadge/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkBottomSheetUnitTests",
            dependencies: [
                "SparkComponentBottomSheet",
                "SparkBottomSheetTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentBottomSheet/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkBottomSheetSnapshotTests",
            dependencies: [
                "SparkComponentBottomSheet",
                "SparkBottomSheetTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentBottomSheet/Tests/SnapshotTests"
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
            path: "Dependencies/ComponentButton/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentButtonSnapshotTests",
            dependencies: [
                "SparkComponentButton",
                "SparkComponentButtonTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentButton/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentCardUnitTests",
            dependencies: [
                "SparkComponentCard",
                "SparkComponentCardTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentCard/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentCardSnapshotTests",
            dependencies: [
                "SparkResources",
                "SparkComponentCard",
                "SparkComponentCardTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentCard/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentCheckboxUnitTests",
            dependencies: [
                "SparkComponentCheckbox",
                "SparkComponentCheckboxTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentCheckbox/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentCheckboxSnapshotTests",
            dependencies: [
                "SparkComponentCheckbox",
                "SparkComponentCheckboxTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentCheckbox/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentChipUnitTests",
            dependencies: [
                "SparkComponentChip",
                "SparkComponentChipTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentChip/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentChipSnapshotTests",
            dependencies: [
                "SparkComponentChip",
                "SparkComponentChipTesting",
                "SparkCommonSnapshotTesting"
            ],
            path: "Dependencies/ComponentChip/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentCircularMeterUnitTests",
            dependencies: [
                "SparkComponentCircularMeter",
                "SparkComponentCircularMeterTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentCircularMeter/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentCircularMeterSnapshotTests",
            dependencies: [
                "SparkResources",
                "SparkComponentCircularMeter",
                "SparkComponentCircularMeterTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentCircularMeter/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentDividerUnitTests",
            dependencies: [
                "SparkComponentDivider",
                "SparkComponentDividerTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentDivider/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentDividerSnapshotTests",
            dependencies: [
                "SparkComponentDivider",
                "SparkComponentDividerTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentDivider/Tests/SnapshotTests"
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
            path: "Dependencies/ComponentFileUpload/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentFileUploadSnapshotTests",
            dependencies: [
                "SparkResources",
                "SparkComponentFileUpload",
                "SparkComponentFileUploadTesting",
                "SparkCommonSnapshotTesting"
            ],
            path: "Dependencies/ComponentFileUpload/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentFormFieldUnitTests",
            dependencies: [
                "SparkComponentFormField",
                "SparkComponentFormFieldTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentFormField/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentFormFieldSnapshotTests",
            dependencies: [
                "SparkComponentFormField",
                "SparkComponentFormFieldTesting",
                "SparkCommonSnapshotTesting"
            ],
            path: "Dependencies/ComponentFormField/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentIconUnitTests",
            dependencies: [
                "SparkComponentIcon",
                "SparkComponentIconTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentIcon/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentIconSnapshotTests",
            dependencies: [
                "SparkComponentIcon",
                "SparkComponentIconTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentIcon/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentInputOTPUnitTests",
            dependencies: [
                "SparkComponentInputOTP",
                "SparkComponentInputOTPTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentInputOTP/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentInputOTPSnapshotTests",
            dependencies: [
                "SparkComponentInputOTP",
                "SparkComponentInputOTPTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentInputOTP/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentPopoverUnitTests",
            dependencies: [
                "SparkComponentPopover",
                "SparkComponentPopoverTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentPopover/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentPopoverSnapshotTests",
            dependencies: [
                "SparkComponentPopover",
                "SparkComponentPopoverTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentPopover/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentProgressBarUnitTests",
            dependencies: [
                "SparkComponentProgressBar",
                "SparkComponentProgressBarTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentProgressBar/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentProgressBarSnapshotTests",
            dependencies: [
                "SparkComponentProgressBar",
                "SparkComponentProgressBarTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentProgressBar/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentProgressTrackerUnitTests",
            dependencies: [
                "SparkComponentProgressTracker",
                "SparkComponentProgressTrackerTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentProgressTracker/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentProgressTrackerSnapshotTests",
            dependencies: [
                "SparkComponentProgressTracker",
                "SparkComponentProgressTrackerTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentProgressTracker/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentRadioButtonUnitTests",
            dependencies: [
                "SparkComponentRadioButton",
                "SparkComponentRadioButtonTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentRadioButton/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentRadioButtonSnapshotTests",
            dependencies: [
                "SparkComponentRadioButton",
                "SparkComponentRadioButtonTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentRadioButton/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentRatingUnitTests",
            dependencies: [
                "SparkComponentRating",
                "SparkComponentRatingTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentRating/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentRatingSnapshotTests",
            dependencies: [
                "SparkComponentRating",
                "SparkComponentRatingTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentRating/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSegmentedControlUnitTests",
            dependencies: [
                "SparkComponentSegmentedControl",
                "SparkComponentSegmentedControlTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentSegmentedControl/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSegmentedControlSnapshotTests",
            dependencies: [
                "SparkResources",
                "SparkComponentSegmentedControl",
                "SparkComponentSegmentedControlTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentSegmentedControl/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSegmentedGaugeUnitTests",
            dependencies: [
                "SparkComponentSegmentedGauge",
                "SparkComponentSegmentedGaugeTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentSegmentedGauge/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSegmentedGaugeSnapshotTests",
            dependencies: [
                "SparkComponentSegmentedGauge",
                "SparkComponentSegmentedGaugeTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentSegmentedGauge/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSelectionControlsUnitTests",
            dependencies: [
                "SparkComponentSelectionControls",
                "SparkComponentSelectionControlsTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentSelectionControls/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSelectionControlsSnapshotTests",
            dependencies: [
                "SparkComponentSelectionControls",
                "SparkComponentSelectionControlsTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentSelectionControls/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSliderUnitTests",
            dependencies: [
                "SparkComponentSlider",
                "SparkComponentSliderTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentSlider/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSliderSnapshotTests",
            dependencies: [
                "SparkComponentSlider",
                "SparkComponentSliderTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentSlider/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSnackbarUnitTests",
            dependencies: [
                "SparkComponentSnackbar",
                "SparkComponentSnackbarTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentSnackbar/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSnackbarSnapshotTests",
            dependencies: [
                "SparkComponentSnackbar",
                "SparkComponentSnackbarTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentSnackbar/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSpinnerUnitTests",
            dependencies: [
                "SparkComponentSpinner",
                "SparkComponentSpinnerTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentSpinner/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSpinnerSnapshotTests",
            dependencies: [
                "SparkComponentSpinner",
                "SparkComponentSpinnerTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentSpinner/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentStepperUnitTests",
            dependencies: [
                "SparkComponentStepper",
                "SparkComponentStepperTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentStepper/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentStepperSnapshotTests",
            dependencies: [
                "SparkComponentStepper",
                "SparkComponentStepperTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentStepper/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentSwitchUnitTests",
            dependencies: [
                "SparkComponentSwitch",
                "SparkComponentSwitchTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentSwitch/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentSwitchSnapshotTests",
            dependencies: [
                "SparkComponentSwitch",
                "SparkComponentSwitchTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentSwitch/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentTabUnitTests",
            dependencies: [
                "SparkComponentTab",
                "SparkComponentTabTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentTab/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentTabSnapshotTests",
            dependencies: [
                "SparkComponentTab",
                "SparkComponentTabTesting",
                "SparkCommonSnapshotTesting"
            ],
            path: "Dependencies/ComponentTab/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentTagUnitTests",
            dependencies: [
                "SparkComponentTag",
                "SparkComponentTagTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentTag/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentTagSnapshotTests",
            dependencies: [
                "SparkComponentTag",
                "SparkComponentTagTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentTag/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentTextInputUnitTests",
            dependencies: [
                "SparkComponentTextInput",
                "SparkComponentTextInputTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentTextInput/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentTextInputSnapshotTests",
            dependencies: [
                "SparkComponentTextInput",
                "SparkComponentTextInputTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentTextInput/Tests/SnapshotTests"
        ),
        .testTarget(
            name: "SparkComponentTextLinkUnitTests",
            dependencies: [
                "SparkComponentTextLink",
                "SparkComponentTextLinkTesting",
                "SparkCommonTesting",
                "SparkThemingTesting"
            ],
            path: "Dependencies/ComponentTextLink/Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentTextLinkSnapshotTests",
            dependencies: [
                "SparkComponentTextLink",
                "SparkComponentTextLinkTesting",
                "SparkCommonSnapshotTesting",
            ],
            path: "Dependencies/ComponentTextLink/Tests/SnapshotTests"
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
