//
//  PopoverGetColorsUseCase.swift
//  Spark
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable
protocol PopoverGetColorsUseCasable {
    func execute(
        colors: any Colors,
        intent: PopoverIntent,
        isLiquidGlass: Bool
    ) -> PopoverColors
}

final class PopoverGetColorsUseCase: PopoverGetColorsUseCasable {
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
