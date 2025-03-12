//
//  DemoTheme.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Protocol

public protocol DemoTheme: CaseIterable {
    var value: Theme { get }

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

    public var value: Theme {
        switch self {
        case .spark:
            SparkTheme.shared
        case .sky:
            SkyTheme.shared
        }
    }
}
