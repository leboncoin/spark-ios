# SelectionControls

The folder here contains the _SwiftUI_ and _UIKit_ **iOS** : 
- **Checkbox** & **CheckboxGroup**
- **RadioButton** & **RadioGroup**
- **Toggle** & **Switch**

## Specifications

- The checkbox/checkboxGroup specifications are visible on [Zeroheight](https://zeroheight.com/1186e1705/p/76f5a8-checkbox).
![Figma anatomy](https://github.com/leboncoin/spark-ios/blob/main/.github/assets/anatomy/selection-controls-checkbox.png)

- The radioButton/radioGroup specifications are visible on [Zeroheight](https://zeroheight.com/1186e1705/p/98058f-radio-button).
![Figma anatomy](https://github.com/leboncoin/spark-ios/blob/main/.github/assets/anatomy/selection-controls-radiogroup.png)

- The toggle/switch specifications are visible on [Zeroheight](https://zeroheight.com/1186e1705/p/58a2c6-switch).
![Figma anatomy](https://github.com/leboncoin/spark-ios/blob/main/.github/assets/anatomy/selection-controls-toggle.png)


## Technical Documentation

You are a developer ? A technical documentation in _DocC_ is available [here](https://leboncoin.github.io/spark-ios/sparkcomponentselectioncontrols/documentation/sparkcomponentselectioncontrols/).

### Swift Package Manager

_Note: Instructions below are for using **SPM** without the Xcode UI. It's the easiest to go to your Project Settings -> Swift Packages and add SparkComponentSelectionControls from there.\_

To integrate using Apple's Swift package manager, without Xcode integration, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/leboncoin/spark-ios.git", .upToNextMajor(from: "2.0.0"))
```

and then specify `SparkComponentSelectionControls` as a dependency of the Target in which you wish to use the SparkComponentSelectionControls.

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
                    name: "SparkComponentSelectionControls",
                    package: "Spark"
                ),
            ]
        )
    ]
)
```
