//
//  PopoverGetSpacesUseCase.swift
//  SparkCore
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable
protocol PopoverGetSpacesUseCasable {
    func execute(layoutSpacing: any LayoutSpacing, isLiquidGlass: Bool) -> PopoverSpaces
}

final class PopoverGetSpacesUseCase: PopoverGetSpacesUseCasable {
    func execute(layoutSpacing: any LayoutSpacing, isLiquidGlass: Bool) -> PopoverSpaces {
        return .init(
            horizontal: isLiquidGlass ? layoutSpacing.xLarge : layoutSpacing.large,
            vertical: layoutSpacing.large
        )
    }
}
