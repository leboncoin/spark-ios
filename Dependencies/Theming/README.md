# Theming

The folder here contains the Theming, the Spark Theme and the mock for the Theming.

## Technical Documentation

You are a developer ? A technical documentation in _DocC_ is available [here](https://leboncoin.github.io/spark-ios/sparktheming/documentation/sparktheming/).

### Swift Package Manager

_Note: Instructions below are for using **SPM** without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add SparkTheming from there._

To integrate using Apple's Swift package manager, without Xcode integration, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/leboncoin/spark-ios.git", .upToNextMajor(from: "2.0.0"))
```

and then specify `SparkTheming` as a dependency of the Target in which you wish to use the SparkTheming.

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
                    name: "SparkTheming", // Theming protocols
                    package: "Spark"
                ),
                .product(
                    name: "SparkTheme", // Leboncoin theming implementation
                    package: "Spark"
                ),
        )
        .testTarget(
            name: "MyPackageUnitTests",
            dependencies: [
                "MyPackage",
                .product(
                    name: "SparkThemingTesting", // Public theming mocks
                    package: "Spark"
                )
            ],
            path: "Tests/UnitTests"
        ),
    ]
)
```
