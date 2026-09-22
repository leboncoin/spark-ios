# SparkResources

The Spark Resources contains the Spark iconography assets and the tools to use them.

## Overview

The package can be used in **UIKit** and **SwiftUI** project.

It is composed by:
- The **Iconography** asset catalog, containing the `Global` and `Criteria` icon sets.
- A generated `ImageResource` extension, exposing every icon as a static property on ``ImageResource/Spark`` and ``ImageResource/SparkCriteria``.
- Convenience initializers on `Image` and `UIImage` to create an icon from a Spark icon.

### Implementation

- On SwiftUI, you need to use the `Image(spark:)` or `Image(sparkCriteria:)` initializer.
- On UIKit, you need to use the `UIImage(spark:)` or `UIImage(sparkCriteria:)` initializer.

#### Example of usage

On SwiftUI :
```swift
import SwiftUI
import SparkResources

struct MyView: View {
    var body: some View {
        Image(spark: \.actionsFill)
        Image(sparkCriteria: \.accessories)
    }
}
```

On UIKit :
```swift
import UIKit
import SparkResources

let image = UIImage(spark: \.actionsFill)
let image = UIImage(sparkCriteria: \.accessories)
```

## Source

The icons come from [leboncoin/spark-tokens](https://github.com/leboncoin/spark-tokens).

Every update of the iconography assets on **spark-tokens** automatically creates a pull request on **spark-ios** to update the Spark iconography (see the `🎨 PR icon updates` workflow).

## Code Generation

The icons are generated using `.script/generate-iconography-codebase.swift`.

Do not edit ``ImageResource/Spark`` and ``ImageResource/SparkCriteria`` manually: run the script again after adding or updating icons in the **Iconography** asset catalog.
