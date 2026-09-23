# TextInput

The folder here contains the **iOS TextField**, **TextField with Addons** and the **TextEditor** for _SwiftUI_ and _UIKit_.

## Specifications

### TextField

The TextField specifications on Zeroheight are [here](https://zeroheight.com/1186e1705/v/latest/p/773c60-input--text-field).

![Figma anatomy](https://github.com/leboncoin/spark-ios/blob/main/.github/assets/anatomy/text-input-textfield.png)

### TextEditor

The TextEditor specifications on Zeroheight is [here](https://spark.adevinta.com/1186e1705/p/365c2e-text-area--text-view).

![Figma anatomy](https://github.com/leboncoin/spark-ios/blob/main/.github/assets/anatomy/text-input-texteditor.png)

## Technical Documentation

You are a developer ? A technical documentation in _DocC_ is available [here](https://leboncoin.github.io/spark-ios/sparkcomponenttextinput/documentation/sparkcomponenttextinput/).

### Swift Package Manager

_Note: Instructions below are for using **SPM** without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add SparkComponentTextInput from there._

To integrate using Apple's Swift package manager, without Xcode integration, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/leboncoin/spark-ios.git", .upToNextMajor(from: "2.0.0"))
```

and then specify `SparkComponentTextInput` as a dependency of the Target in which you wish to use the SparkComponentTextInput.

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
                    name: "SparkComponentTextInput",
                    package: "Spark"
                ),
            ]
        )
    ]
)
```
