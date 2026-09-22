//
//  DemoTheme.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Protocol

/// The *protocol* which be used to set theme in components .
public protocol DemoTheme: CaseIterable {
    /// The Spark **Theme**.
    var value: any Theme { get }

    /// The theme used to display all properties of a theme on the demo app (**Other** section in **Tabbar / Theme**)
    static var mainTheme: Self { get }
}

// MARK: - Implementation

/// The Spark themes used by default on the demo app.
public enum SparkDemoThemes: DemoTheme {
    case spark
    case sky

    // MARK: - Properties

    /// The main theme is **.spark**
    public static var mainTheme: Self {
        Self.spark
    }

    /// The Spark **Theme** from the current enum value.
    public var value: any Theme {
        switch self {
        case .spark:
            SparkTheme.shared
        case .sky:
            SkyTheme.shared
        }
    }
}
