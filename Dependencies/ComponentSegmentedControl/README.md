# SegmentedControl

The folder here contains only the **iOS SegmentedControl** for _SwiftUI_ and _UIKit_.

## Specifications

The segmentedcontrol specifications is visible on [Zeroheight](https://zeroheight.com/1186e1705/p/049d6e-segmented-control).

![Figma anatomy](https://github.com/leboncoin/spark-ios/blob/main/.github/assets/anatomy/segmented-control.png)

## Technical Documentation

You are a developer ? A technical documentation in _DocC_ is available [here](https://leboncoin.github.io/spark-ios/sparkcomponentsegmented-control/documentation/sparkcomponentsegmented-control/).

### Swift Package Manager

_Note: Instructions below are for using **SPM** without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add SparkComponentSegmentedControl from there.\_

To integrate using Apple's Swift package manager, without Xcode integration, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/leboncoin/spark-ios.git", .upToNextMajor(from: "2.0.0"))
```

and then specify `SparkComponentSegmentedControl` as a dependency of the Target in which you wish to use the SparkComponentSegmentedControl.

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
                    name: "SparkComponentSegmentedControl",
                    package: "Spark"
                ),
            ]
        )
    ]
)
```
