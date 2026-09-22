//
//  ChipGetLayoutUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ChipGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, alignment: ChipAlignment) -> ChipLayout
}

final class ChipGetLayoutUseCase: ChipGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, alignment: ChipAlignment) -> ChipLayout {
        let token = ChipToken.Layout(theme: theme)

        let spacing = switch alignment {
        case .leadingIcon: token.spacingWhenLeadingIcon
        case .trailingIcon: token.spacingWhenTrailingIcon
        }

        return .init(
            spacing: spacing,
            extraContentSpacing: token.extraContentSpacing,
            padding: token.horizontalPadding
        )
    }
}
