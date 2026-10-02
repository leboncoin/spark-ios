# Spark Demo App

The folder here contains the iOS demo app to test components in _SwiftUI_ and _UIKit_.

## Specifications

To launch the demo app, go to the root of the repository and launch the command line :

```
$ xcodegen
```

Then open the generated file : `Spark.xcodeproj`.

## Technical Documentation

You are a developer ? A technical documentation in _DocC_ is available [here](https://leboncoin.github.io/spark-ios/sparkdemo/documentation/sparkdemo/documentation).

## Download App

A prebuilt demo app (simulator build) from the latest nightly run is also available: [download SparkMainDemo.app](https://nightly.link/leboncoin/spark-ios/workflows/nightly-demo-app/main/SparkMainDemo.app.zip) (see the [Nightly Demo App workflow](https://github.com/leboncoin/spark-ios/actions/workflows/nightly-demo-app.yml)).

To install it on a simulator:

1. Download and unzip `SparkMainDemo.app.zip`.
2. Launch a simulator (from Xcode, or with `open -a Simulator`).
3. Drag and drop `SparkMainDemo.app` onto the simulator window.
4. The app is installed and appears on the simulator home screen.

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
        .iOS(.v17)
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
                )
            ]
        )
    ]
)
```
