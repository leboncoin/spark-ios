# SparkTheming

The Spark Theming contains many class to manage styles like colors, border, ...

## Overview

The theming is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

The Spark theming is composed by:

- colors : ``Colors``
- border (radius & width) : ``Border``
- elevation : ``Elevation``
- layout (spacing) : ``Layout``
- typographies : ``Typography``
- dims : ``Dims``

## Guidelines

There is two importants rules for this repository:

- All `protocols`, `class`, `struct`, `var/let/func`, ..., used by on other spark repositories or consummer application must be in **`public`** or **`open`**.
- If the code can be used only by the **spark iOS team**, all `public` or **`open`** must contains the **`@_spi(SI_SPI)`** annotation. If the code can also be used by consommer too, you don't need to add this annotation.
