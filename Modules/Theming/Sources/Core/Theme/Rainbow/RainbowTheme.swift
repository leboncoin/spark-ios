//
//  SparkTheme.swift
//  SparkTheme
//
//  Created by robin.lemaire on 13/10/2025.
//  Copyright © 2023 2025. All rights reserved.
//

import Foundation

/// The Rainbow theme is only used by an EnvironmentValues on spark-ios-common.
/// It should not be used somewhere else.
@_spi(SI_SPI) public enum RainbowTheme {

    // MARK: - Properties

    /// The Rainbow theme is only used by an EnvironmentValues on spark-ios-common.
    /// It should not be used somewhere else.
    public static var shared = ThemeDefault(
        border: RainbowBorder(),
        colors: RainbowColors(),
        elevation: RainbowElevation(),
        layout: RainbowLayout(),
        typography: RainbowTypography(),
        dims: RainbowDims()
    )
}
