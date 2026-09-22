# Common

The folder here contains the Common code and the mock for the Common.

## Technical Documentation

You are a developer ? A technical documentation in _DocC_ is available [here](https://leboncoin.github.io/spark-ios/sparkcommon/documentation/sparkcommon/).

### Swift Package Manager

_Note: Instructions below are for using **SPM** without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add SparkCommon from there._

To integrate using Apple's Swift package manager, without Xcode integration, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/leboncoin/spark-ios.git", .upToNextMajor(from: "2.0.0"))
```

and then specify `SparkCommon` as a dependency of the Target in which you wish to use the SparkCommon.

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
                    name: "SparkCommon", // Common code
                    package: "Spark"
                ),
        )
        .testTarget(
            name: "MyPackageUnitTests",
            dependencies: [
                "MyPackage",
                .product(
                    name: "SparkCommonTesting", // Public protocols mocks
                    package: "Spark"
                ),
                .product(
                    name: "SparkCommonSnapshotTesting", // Public snapshot test cases, mock and extensions
                    package: "Spark"
                )
            ],
            path: "Tests/UnitTests"
        ),
    ]
)
```
