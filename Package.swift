// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swiftlint:disable all
let package = Package(
    name: "SparkCore",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SparkCore",
            targets: ["SparkCore"]
        ),
        .library(
            name: "SparkCoreTesting",
            targets: ["SparkCoreTesting"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/leboncoin/spark-ios-common.git",
            // path: "../spark-ios-common"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-theming.git",
            // path: "../spark-ios-theming"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-badge.git",
            // path: "../spark-ios-component-badge"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-bottom-sheet.git",
            // path: "../spark-ios-component-bottom-sheet"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-button.git",
            // path: "../spark-ios-component-button"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-checkbox.git",
            // path: "../spark-ios-component-checkbox"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-chip.git",
            // path: "../spark-ios-component-chip"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-divider.git",
            // path: "../spark-ios-component-divider"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-form-field.git",
            // path: "../spark-ios-component-form-field"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-icon.git",
            // path: "../spark-ios-component-icon"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-popover.git",
            // path: "../spark-ios-component-popover"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-progress-bar.git",
            // path: "../spark-ios-component-progress-bar"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-progress-tracker.git",
            // path: "../spark-ios-component-progress-tracker"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-radio-button.git",
            // path: "../spark-ios-component-radio-button"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-rating.git",
            // path: "../spark-ios-component-rating"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-snackbar.git",
            // path: "../spark-ios-component-snackbar"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-slider.git",
            // path: "../spark-ios-component-slider"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-spinner.git",
            // path: "../spark-ios-component-spinner"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        // TODO: remettre
//        .package(
//            url: "https://github.com/leboncoin/spark-ios-component-stepper.git",
//            // path: "../spark-ios-component-stepper"
//            /*version*/ "0.0.1"..."999.999.999"
//        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-switch.git",
            // path: "../spark-ios-component-switch"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-tab.git",
            // path: "../spark-ios-component-tab"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-tag.git",
            // path: "../spark-ios-component-tag"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-text-input.git",
            // path: "../spark-ios-component-text-input"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-text-link.git",
            // path: "../spark-ios-component-text-link"
            /*version*/ "0.0.1"..."999.999.999"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SparkCore",
            dependencies: [
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkTheming",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SparkBadge",
                    package: "spark-ios-component-badge"
                ),
                .product(
                    name: "SparkBottomSheet",
                    package: "spark-ios-component-bottom-sheet"
                ),
                .product(
                    name: "SparkButton",
                    package: "spark-ios-component-button"
                ),
                .product(
                    name: "SparkCheckbox",
                    package: "spark-ios-component-checkbox"
                ),
                .product(
                    name: "SparkChip",
                    package: "spark-ios-component-chip"
                ),
                .product(
                    name: "SparkDivider",
                    package: "spark-ios-component-divider"
                ),
                .product(
                    name: "SparkFormField",
                    package: "spark-ios-component-form-field"
                ),
                .product(
                    name: "SparkIcon",
                    package: "spark-ios-component-icon"
                ),
                .product(
                    name: "SparkPopover",
                    package: "spark-ios-component-popover"
                ),
                .product(
                    name: "SparkProgressBar",
                    package: "spark-ios-component-progress-bar"
                ),
                .product(
                    name: "SparkProgressTracker",
                    package: "spark-ios-component-progress-tracker"
                ),
                .product(
                    name: "SparkRadioButton",
                    package: "spark-ios-component-radio-button"
                ),
                .product(
                    name: "SparkRating",
                    package: "spark-ios-component-rating"
                ),
                .product(
                    name: "SparkSnackbar",
                    package: "spark-ios-component-snackbar"
                ),
                .product(
                    name: "SparkSlider",
                    package: "spark-ios-component-slider"
                ),
                .product(
                    name: "SparkSpinner",
                    package: "spark-ios-component-spinner"
                ),

                // TODO: remettre
//                .product(
//                    name: "SparkStepper",
//                    package: "spark-ios-component-stepper"
//                ),
                .product(
                    name: "SparkSwitch",
                    package: "spark-ios-component-switch"
                ),
                .product(
                    name: "SparkTab",
                    package: "spark-ios-component-tab"
                ),
                .product(
                    name: "SparkTag",
                    package: "spark-ios-component-tag"
                ),
                .product(
                    name: "SparkTextInput",
                    package: "spark-ios-component-text-input"
                ),
                .product(
                    name: "SparkTextLink",
                    package: "spark-ios-component-text-link"
                )
            ],
            path: "Sources/Core"
        ),
        .target(
            name: "SparkCoreTesting",
            dependencies: [
                "SparkCore",
                .product(
                    name: "SparkTheme",
                    package: "spark-ios-theming"
                )
            ],
            path: "Sources/Testing"
        ),
        .testTarget(
            name: "CoreTests",
            dependencies: ["SparkCore"]
        ),
    ]
)
