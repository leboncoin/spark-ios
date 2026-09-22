# Snackbar

The folder here contains only the **iOS Snackbar** for _SwiftUI_ and _UIKit_.

## Specifications

The snackbar specifications on Zeroheight are [here](https://zeroheight.com/1186e1705/v/latest/p/36d4af-snackbar).

A – Icon (optional).  
B – Snackbar content.  
C – Container.  
D – Action button (optional).

![Figma anatomy horizontal](https://github.com/leboncoin/spark-ios/blob/main/.github/assets/anatomy/snackbar-horizontal.png)
![Figma anatomy vertical](https://github.com/leboncoin/spark-ios/blob/main/.github/assets/anatomy/snackbar-vertical.png)

## Technical Documentation

You are a developer ? A technical documentation in _DocC_ is available [here](https://leboncoin.github.io/spark-ios/sparkcomponentsnackbar/documentation/sparkcomponentsnackbar/).

### Swift Package Manager

_Note: Instructions below are for using **SPM** without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add SparkComponentSnackbar from there._

To integrate using Apple's Swift package manager, without Xcode integration, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/leboncoin/spark-ios.git", .upToNextMajor(from: "2.0.0"))
```

and then specify `SparkComponentSnackbar` as a dependency of the Target in which you wish to use the SparkComponentSnackbar.

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
                    name: "SparkComponentSnackbar",
                    package: "Spark"
                ),
            ]
        )
    ]
)
```
