//
//  PopoverGetColorsUseCaseDeprecated.swift
//  Spark
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable
@available(*, deprecated, message: "This use case is no longer used and will be removed in a future version.")
protocol PopoverGetColorsUseCasableDeprecated {
    func execute(
        colors: any Colors,
        intent: PopoverIntent,
        isLiquidGlass: Bool
    ) -> PopoverColors
}

@available(*, deprecated, message: "This use case is no longer used and will be removed in a future version.")
final class PopoverGetColorsUseCaseDeprecated: PopoverGetColorsUseCasableDeprecated {
    func execute(
        colors: any Colors,
        intent: PopoverIntent,
        isLiquidGlass: Bool
    ) -> PopoverColors {
        return if isLiquidGlass {
            self.executeNew(colors: colors, intent: intent)
        } else {
            self.executeOldIosVersion(colors: colors, intent: intent)
        }
    }

    func executeNew(colors: any Colors, intent: PopoverIntent) -> PopoverColors {
        return switch intent {
        case .surface:
            .init(
                background: ColorTokenClear(),
                foreground: colors.base.onSurface
            )
        default:
            .init(
                background: ColorTokenClear(),
                foreground: colors.feedback.info
            )
        }
    }

    func executeOldIosVersion(colors: any Colors, intent: PopoverIntent) -> PopoverColors {
        return switch intent {
        case .surface:
            .init(
                background: colors.base.surface,
                foreground: colors.base.onSurface
            )
        default:
            .init(
                background: colors.feedback.infoContainer,
                foreground: colors.feedback.onInfoContainer
            )
        }
    }
}
