//
//  PopoverViewModelDeprecated.swift
//  SparkComponentPopover
//
//  Created by louis.borlee on 26/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

@available(*, deprecated, message: "This view model is no longer used and will be removed in a future version.")
struct PopoverViewModelDeprecated {
    let colors: PopoverColors
    let spaces: PopoverSpacesDeprecated
    let showArrow: Bool
    let arrowSize: CGFloat

    init(
        theme: any Theme,
        intent: PopoverIntent,
        showArrow: Bool,
        getColorsUseCase: any PopoverGetColorsUseCasableDeprecated = PopoverGetColorsUseCaseDeprecated(),
        getSpacesUseCase: any PopoverGetSpacesUseCasableDeprecated = PopoverGetSpacesUseCaseDeprecated()
    ) {
        let isLiquidGlass = PopoverConstants.isLiquidGlass
        self.colors = getColorsUseCase.execute(colors: theme.colors, intent: intent, isLiquidGlass: isLiquidGlass)
        self.spaces = getSpacesUseCase.execute(layoutSpacing: theme.layout.spacing, isLiquidGlass: isLiquidGlass)
        self.showArrow = showArrow
        self.arrowSize = theme.layout.spacing.medium
    }
}
