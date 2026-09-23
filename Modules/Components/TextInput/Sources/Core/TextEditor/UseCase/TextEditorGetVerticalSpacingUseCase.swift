//
//  TextEditorGetVerticalSpacingUseCase.swift
//  SparkTextField
//
//  Created by robin.lemaire on 05/09/2024.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol TextEditorGetVerticalSpacingUseCaseable {
    // sourcery: font = "Identical"
    func execute(height: CGFloat, font: any TypographyFontToken) -> CGFloat
}

final class TextEditorGetVerticalSpacingUseCase: TextEditorGetVerticalSpacingUseCaseable {

    // MARK: - Methods

    func execute(height: CGFloat, font: any TypographyFontToken) -> CGFloat {
        return (height - (font.uiFont.lineHeight)) / 2
    }
}
