//
//  SnackbarColorsDeprecated.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 03/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SparkTheming

/// Snackbar colors
@available(*, deprecated, message: "This model is no longer used and will be removed in a future version.")
public struct SnackbarColorsDeprecated {

    // MARK: - Properties

    /// Snackbar background color
    let background: any ColorToken
    /// Snackbar foreground color
    let foreground: any ColorToken

    // MARK: - Initialization

    /// Snackbar init
    /// - Parameters:
    ///   - background: Snackbar background color
    ///   - foreground: Snackbar foreground color
    public init(
        background: any ColorToken,
        foreground: any ColorToken
    ) {
        self.background = background
        self.foreground = foreground
    }
}
