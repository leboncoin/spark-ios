# Spark Demo App

The folder here contains the iOS demo app to test components in _SwiftUI_ and _UIKit_.

## Specifications

To launch the demo app, go to the root of the repository and launch the command line :

```
$ xcodegen
```

Then open the generated file : `Spark.xcodeproj`.

## Technical Documentation

You are a developer ? A technical documentation in _DocC_ is available [here](https://leboncoin.github.io/spark-ios/sparkdemo/documentation/sparkdemo/).

### Swift Package Manager

_Note: Instructions below are for using **SPM** without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add SparkDemo from there._

To integrate using Apple's Swift package manager, without Xcode integration, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/leboncoin/spark-ios.git", .upToNextMajor(from: "2.0.0"))
```

and then specify `SparkDemo` as a dependency of the Target in which you wish to use the SparkDemo.

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
                    name: "SparkDemo",
                    package: "Spark"
                ),
            ]
        )
    ]
)
```
