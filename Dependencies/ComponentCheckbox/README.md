# Checkbox

**This folder is deprecated.** Please use the **Selection controls** repository instead.

The folder here contains only the **iOS Checkbox** for _SwiftUI_ and _UIKit_.

## Specifications

The checkbox specifications on Zeroheight is [here](https://spark.adevinta.com/1186e1705/p/76f5a8-checkbox).

![Figma anatomy](https://github.com/leboncoin/spark-ios/blob/main/.github/assets/anatomy/checkbox.png)

## Technical Documentation

You are a developer ? A technical documentation in _DocC_ is available [here](https://leboncoin.github.io/spark-ios/sparkcomponentcheckbox/documentation/sparkcomponentcheckbox/).

### Swift Package Manager

_Note: Instructions below are for using **SPM** without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add SparkComponentCheckbox from there._

To integrate using Apple's Swift package manager, without Xcode integration, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/leboncoin/spark-ios.git", .upToNextMajor(from: "2.0.0"))
```

and then specify `SparkComponentCheckbox` as a dependency of the Target in which you wish to use the SparkComponentCheckbox.

Here's an example `Package.swift`:

```swift
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "MyPackage",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "MyPackage",
            targets: ["MyPackage"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/leboncoin/spark-ios.git",
            .upToNextMajor(from: "2.0.0")
        )
    ],
    targets: [
        .target(
            name: "MyPackage",
            dependencies: [
                .product(
                    name: "SparkComponentCheckbox",
                    package: "Spark"
                ),
            ]
        )
    ]
)
```
