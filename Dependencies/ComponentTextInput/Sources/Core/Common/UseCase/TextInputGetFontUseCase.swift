//
//  TextInputGetFontUseCase.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 11/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol TextInputGetFontUseCaseable {
    // sourcery: theme = "Identical", return = "Identical"
    func execute(theme: any Theme) -> any TypographyFontToken

    // sourcery: theme = "Identical"
    func executeFont(theme: any Theme) -> Font
}

final class TextInputGetFontUseCase: TextInputGetFontUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> any TypographyFontToken {
        theme.typography.body1
    }

    func executeFont(theme: any Theme) -> Font {
        self.execute(theme: theme).font
    }
}
