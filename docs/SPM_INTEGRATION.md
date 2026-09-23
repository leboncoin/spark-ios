# SPM Integration

This document describes how to add **Spark** to your project using Apple's Swift Package Manager (SPM), without the Xcode UI, and gives `Package.swift` examples for the different available products.

_Note: It's also possible to go to your Project Settings -> Swift Packages and add the desired Spark products from there._

For every case below, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/leboncoin/spark-ios.git", .upToNextMajor(from: "2.0.0"))
```

## With Spark only

Use this when you only need the components and theming used by your consuming target.

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
                    name: "Spark",
                    package: "spark-ios"
                ),
            ]
        )
    ]
)
```

## With Spark and SparkThemingTesting

Use this when you want to mock the Spark `Theme` in your unit/UI tests.

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
                    name: "Spark",
                    package: "spark-ios"
                ),
            ]
        ),
        .testTarget(
            name: "MyPackageTests",
            dependencies: [
                .target(name: "MyPackage"),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios"
                ),
            ]
        )
    ]
)
```

## With Spark and SparkTheme

Use this when you want to use the default Spark theme implementation directly.

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
                    name: "Spark",
                    package: "spark-ios"
                ),
                .product(
                    name: "SparkTheme",
                    package: "spark-ios"
                ),
            ]
        )
    ]
)
```

## With SparkDemo

Use this when you want to implement the Spark demo app content inside another app.

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
                    package: "spark-ios"
                ),
            ]
        )
    ]
)
```
