# Spark

**Spark** is the [Leboncoin](https://www.leboncoin.fr/)'s _Design System_.

The package re-exports every Spark module behind a single import.

## Overview

``Spark`` is a convenience umbrella library: importing it gives you access to every Spark component, without having to import each one individually.

It re-exports:
- `SparkCommon`
- `SparkTheming`
- `SparkResources`
- Every non-deprecated Spark component (e.g. `SparkComponentButton`, `SparkComponentChip`, `SparkComponentSelectionControls`, ...)

> Note: Deprecated components (`SparkComponentCheckbox`, `SparkComponentRadioButton`, `SparkComponentSwitch`) are **not** re-exported. Use `SparkComponentSelectionControls` instead.

### Implementation

Import `Spark` once to get everything :
```swift
import Spark
```

### Adding a New Component

When a new component is created, it must be added to this package :
- as a dependency of the `Spark` target in `Package.swift`
- as a `@_exported import` in `Sources/Core/Import.swift`
