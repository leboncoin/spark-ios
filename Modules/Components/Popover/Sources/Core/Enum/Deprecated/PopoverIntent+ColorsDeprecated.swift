//
//  PopoverIntent+ColorsDeprecated.swift
//  SparkComponentPopover
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

public extension PopoverIntent {

    // MARK: - Internal Properties

    @available(*, deprecated, message: "This use case is no longer used and will be removed in a future version.")
    internal var getColorsUseCase: PopoverGetColorsUseCasableDeprecated {
        return PopoverGetColorsUseCaseDeprecated()
    }

    // MARK: - Internal Methods

    @available(*, deprecated, message: "This use case is no longer used and will be removed in a future version.")
    internal func getColors(
        theme: any Theme,
        getColorsUseCase: PopoverGetColorsUseCasableDeprecated,
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
    @available(*, deprecated, message: "Use theme.component.popover.colors instead")
    func getColors(theme: any Theme) -> PopoverColors {
        return self.getColors(theme: theme, getColorsUseCase: self.getColorsUseCase)
    }
}
