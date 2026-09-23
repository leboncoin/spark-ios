//
//  ThemeEnvironmentValues.swift
//  SparkCommon
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming
import SwiftUI

public extension EnvironmentValues {
    @Entry var theme: EnvironmentTheme = .init(value: RainbowTheme.shared)
}

public extension View {

    /// Set the **theme**.
    ///
    /// Each components which using ```@Environment(\.theme) private var theme``` will be automatically updated.
    ///
    /// The default value is *RainbowTheme.shared*.
    @ViewBuilder
    func sparkTheme(_ theme: any Theme) -> some View {
        self.environment(\.theme, .init(value: theme))
    }
}

/// Used only on Spark component ```@Environment(\.theme)```.
/// Set only by the **theme** on **EnvironmentValues**.
public struct EnvironmentTheme: Equatable {

    // MARK: - Properties

    public let value: any Theme

    // MARK: - Equatable

    public static func == (lhs: EnvironmentTheme, rhs: EnvironmentTheme) -> Bool {
        lhs.value.equals(rhs.value)
    }
}
