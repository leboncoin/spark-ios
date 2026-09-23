# SparkDemo

The Spark Demo contains all Spark components in UIKit and SwiftUI and the details of the Theming.

## Overview

By default, there is four entries in the TabBar : 
- **SwiftUI** : contains all SwiftUI components.
- **UIKit** :  contains all UIKit components.
- **Icons** : contains all Spark icons, with a search bar, a filter, a color picker and a size picker.
- **Other** : contains the current theming solution (*by default* : SparkTheme from **SparkTheming** repository)

## Nightly Build

A `.app` build of the demo app is generated every night at midnight from the `main` branch by the [nightly-demo-app](https://github.com/leboncoin/spark-ios/actions/workflows/nightly-demo-app.yml) GitHub Action.

The artifact can be downloaded from that action's page (select the latest successful run).

### Installation

1. Unzip the downloaded file.
2. Drag and drop the `.app` onto an iPhone Simulator on macOS.

## Configuration

``DemoConfiguration`` centralizes the setup and settings of the demo app :

- ``DemoConfiguration/load()`` : must be called once, before displaying the ``MainView``, typically in your **@main** App's `init()`. It registers all the fonts needed by the demo and the components.
- ``DemoConfiguration/isDevMode`` : a `Bool` (default `true`) that shows or hides the internal **Dev Mode** tools (visible as an extra entry in the **SwiftUI**/**UIKit** tabs and in the **Other** tab). Set it to `false` to hide these developer-only tools, for example in a release build of your customized demo app.

### Implementation

#### Default implementation (without any customization)

In the body of your **@main** view, you can add :
```swift

// Needed import
@_exported import SparkDemo

@main
struct MyApp: App {

    // MARK: - Initialization

    init() {
        DemoConfiguration.load()
    }

    // MARK: - View

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
```

#### With customization implementation

- Create a class inherits from ``DemoTheme`` to implement your own theming solution :
```swift
enum MyThemes: DemoTheme {
    case lbc
    case other

    // MARK: - Properties

    static var mainTheme: Self {
        Self.lbc
    }

    var value: any Theme {
        switch self {
        case .lbc:
            LBCTheme()
        case .other:
            OtherTheme()
        }
    }
}

// ******************************
// Then add the themes in the App
// ******************************

@main
struct MyApp: App {

    // MARK: - Initialization

    init() {
        DemoThemes.shared = .init(value: MyThemes.self)
    }

    // MARK: - View

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
```

![Default Integration rendering.](default_integration.png)

- Add an another entry in the Tabbar :
```swift

// Needed import
@_exported import SparkDemo

@main
struct MyApp: App {

    // MARK: - Initialization

    init() {
        DemoConfiguration.load()
    }

    // MARK: - View

    var body: some Scene {
        WindowGroup {
            MainView {
                YourTabItemView()
                    .tabItem {
                        Image(systemName: "fire.extinguisher")
                        Text("Fire")
                    }
            }
        }
    }
}
```
 
![Custom Integration rendering.](custom_integration.png)
