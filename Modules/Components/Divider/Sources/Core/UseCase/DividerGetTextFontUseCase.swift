//
//
//  DividerGetTextFontUseCase.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 12/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol DividerGetTextFontUseCaseable {

    // sourcery: theme = "Identical", return = "Identical"
    func execute(theme: any Theme) -> any TypographyFontToken
}

struct DividerGetTextFontUseCase: DividerGetTextFontUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> any TypographyFontToken {
        return theme.typography.body1
    }
}
