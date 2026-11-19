//
//  PopoverGetSpacesUseCaseDeprecated.swift
//  SparkCore
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable
@available(*, deprecated, message: "This use case is no longer used and will be removed in a future version.")
protocol PopoverGetSpacesUseCasableDeprecated {
    func execute(layoutSpacing: any LayoutSpacing, isLiquidGlass: Bool) -> PopoverSpacesDeprecated
}

@available(*, deprecated, message: "This use case is no longer used and will be removed in a future version.")
final class PopoverGetSpacesUseCaseDeprecated: PopoverGetSpacesUseCasableDeprecated {
    func execute(layoutSpacing: any LayoutSpacing, isLiquidGlass: Bool) -> PopoverSpacesDeprecated {
        return .init(
            horizontal: isLiquidGlass ? layoutSpacing.xLarge : layoutSpacing.large,
            vertical: layoutSpacing.large
        )
    }
}
