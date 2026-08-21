# ___COMPONENT_NAME___

**Spark** is the [Leboncoin](https://www.leboncoin.fr/)'s _Design System_.

The folder here contains only the **iOS ___COMPONENT_NAME___** for _SwiftUI_ and _UIKit_.

## Specifications

The ___component_name___ specifications is visible on [Zeroheight](TODO).

![Figma anatomy](https://github.com/leboncoin/spark-ios/___COMPONENT_NAME___/blob/main/.github/assets/sparkcomponent-___component_name___-anatomy.png)

## Technical Documentation

You are a developer ? A technical documentation in _DocC_ is available [here](https://leboncoin.github.io/spark-ios/sparkcomponent___component_name___/documentation/sparkcomponent___component_name___/).

### Swift Package Manager

_Note: Instructions below are for using **SPM** without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add SparkComponent___COMPONENT_NAME___ from there.\_

To integrate using Apple's Swift package manager, without Xcode integration, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/leboncoin/spark-ios.git", .upToNextMajor(from: "1.0.0"))
```

and then specify `SparkComponent___COMPONENT_NAME___` as a dependency of the Target in which you wish to use the SparkComponent___COMPONENT_NAME___.

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
            .upToNextMajor(from: "1.0.0")
        )
    ],
    targets: [
        .target(
            name: "MyPackage",
            dependencies: [
                .product(
                    name: "SparkComponent___COMPONENT_NAME___",
                    package: "Spark"
                ),
            ]
        )
    ]
)
```