//
//  ButtonGetTitleFontTokenUseCase.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetTitleFontTokenUseCaseable {
    // sourcery: theme = "Identical", return = "Identical"
    func execute(theme: any Theme) -> any TypographyFontToken
}

struct ButtonGetTitleFontTokenUseCase: ButtonGetTitleFontTokenUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> any TypographyFontToken {
        return theme.typography.callout
    }
}
