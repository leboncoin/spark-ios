//
//  ChipGetBorderUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ChipGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        variant: ChipVariant
    ) -> ChipBorder
}

final class ChipGetBorderUseCase: ChipGetBorderUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        variant: ChipVariant
    ) -> ChipBorder {
        let token = ChipToken.Border(theme: theme)

        return .init(
            width: token.width,
            radius: token.radius,
            dash: variant == .dashed ? token.dashLength : .zero
        )
    }
}
