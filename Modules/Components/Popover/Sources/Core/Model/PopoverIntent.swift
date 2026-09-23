//
//  PopoverIntent.swift
//  Spark
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

/// Intent used to { get set } background & foreground colors on the popover
public enum PopoverIntent: CaseIterable {
    case info
    case surface

    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case accent
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case neutral
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case main
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case support
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case success
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case alert
    @available(*, deprecated, message: "Not used anymore by the Spark popover")
    case error

    // MARK: - Properties

    public static var allCases: [PopoverIntent] = [
        .info,
        .surface
    ]

    internal var getColorsUseCase: PopoverGetColorsUseCasable {
        return PopoverGetColorsUseCase()
    }

    internal func getColors(
        theme: any Theme,
        getColorsUseCase: PopoverGetColorsUseCasable,
        isLiquidGlass: Bool = PopoverConstants.isLiquidGlass
    ) -> PopoverColors {
        return getColorsUseCase.execute(
            colors: theme.colors,
            intent: self,
            isLiquidGlass: isLiquidGlass
        )
    }

    // MARK: - Methods

    /// Get the colors to apply on popovers from an intent
    /// - Parameters:
    ///   - theme: Spark theme
    /// - Returns: PopoverColors
    public func getColors(theme: any Theme) -> PopoverColors {
        return self.getColors(theme: theme, getColorsUseCase: self.getColorsUseCase)
    }
}
