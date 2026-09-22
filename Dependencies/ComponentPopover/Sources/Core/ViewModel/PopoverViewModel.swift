//
//  PopoverViewModel.swift
//  SparkComponentPopover
//
//  Created by louis.borlee on 26/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

struct PopoverViewModel {
    let colors: PopoverColors
    let spaces: PopoverSpaces
    let showArrow: Bool
    let arrowSize: CGFloat

    init(
        theme: any Theme,
        intent: PopoverIntent,
        showArrow: Bool,
        getColorsUseCase: any PopoverGetColorsUseCasable = PopoverGetColorsUseCase(),
        getSpacesUseCase: any PopoverGetSpacesUseCasable = PopoverGetSpacesUseCase()
    ) {
        let isLiquidGlass = PopoverConstants.isLiquidGlass
        self.colors = getColorsUseCase.execute(colors: theme.colors, intent: intent, isLiquidGlass: isLiquidGlass)
        self.spaces = getSpacesUseCase.execute(layoutSpacing: theme.layout.spacing, isLiquidGlass: isLiquidGlass)
        self.showArrow = showArrow
        self.arrowSize = theme.layout.spacing.medium
    }
}
