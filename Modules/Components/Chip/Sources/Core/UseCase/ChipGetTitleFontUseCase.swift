//
//  ChipGetTitleFontUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ChipGetTitleFontUseCaseable {

    // sourcery: theme = "Identical", return = "Identical"
    func execute(theme: any Theme) -> any TypographyFontToken
}

final class ChipGetTitleFontUseCase: ChipGetTitleFontUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> any TypographyFontToken {
        let token = ChipToken.Typography(theme: theme)
        return token.titleFont
    }
}
