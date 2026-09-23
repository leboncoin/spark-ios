//
//  SnackbarIntent.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 03/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SparkTheming

/// The intent of the snackbar.
public enum SnackbarIntent: CaseIterable {
    case alert
    case error
    case info
    case success

    // MARK: - Deprecated Cases

    @available(*, deprecated, message: "This case is no longer used and will be removed in a future version.")
    case accent
    @available(*, deprecated, message: "This case is no longer used and will be removed in a future version.")
    case main
    @available(*, deprecated, message: "This case is no longer used and will be removed in a future version.")
    case neutral
    @available(*, deprecated, message: "This case is no longer used and will be removed in a future version.")
    case support
    @available(*, deprecated, message: "This case is no longer used and will be removed in a future version.")
    case surfaceInverse

    // MARK: - Properties

    /// The default value is *info*
    public static let `default`: Self = .info

    /// Override of CaseIterable to return only non-deprecated cases
    public static var allCases: [SnackbarIntent] {
        return [.alert, .error, .info, .success]
    }

    @available(*, deprecated, message: "This property is no longer used and will be removed in a future version.")
    internal var getColorsUseCase: SnackbarGetColorsUseCasableDeprecated {
        return SnackbarGetColorsUseCaseDeprecated()
    }

    // MARK: - Methods

    @available(*, deprecated, message: "This property is no longer used and will be removed in a future version.")
    internal func getColors(
        theme: any Theme,
        variant: SnackbarVariant,
        getColorsUseCase: SnackbarGetColorsUseCasableDeprecated
    ) -> SnackbarColorsDeprecated {
        return getColorsUseCase.execute(
            colors: theme.colors,
            intent: self,
            variant: variant
        )
    }

    /// Get the colors to apply on snackbars from an intent
    /// - Parameters:
    ///   - theme: Spark theme
    ///   - variant: The variant of the snackbar
    /// - Returns: SnackbarColors
    @available(*, deprecated, message: "This property is no longer used and will be removed in a future version.")
    public func getColors(
        theme: any Theme,
        variant: SnackbarVariant
    ) -> SnackbarColorsDeprecated {
        return self.getColors(
            theme: theme,
            variant: variant,
            getColorsUseCase: self.getColorsUseCase
        )
    }
}
