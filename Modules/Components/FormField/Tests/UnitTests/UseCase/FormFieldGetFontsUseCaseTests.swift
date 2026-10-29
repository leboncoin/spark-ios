//
//  FormFieldGetFontsUseCaseTests.swift
//  SparkComponentFormField
//
//  Created by robin.lemaire on 06/05/25.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentFormField
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("FormField Get Fonts UseCase Tests")
struct FormFieldGetFontsUseCaseTests {

    // MARK: - Tests

    @Test("Execute for all feedback cases")
    func executeForAllFeedbackCases() {
        // GIVEN
        let themeMocked = ThemeGeneratedMock.mocked()

        let useCase = FormFieldGetFontsUseCase()

        // WHEN
        let fonts = useCase.execute(from: themeMocked)

        // THEN
        #expect(fonts.title.uiFont == themeMocked.typography.body2.uiFont)
        #expect(fonts.clearButton.uiFont == themeMocked.typography.body2.uiFont)
        #expect(fonts.helper.uiFont == themeMocked.typography.caption.uiFont)
        #expect(fonts.require.uiFont == themeMocked.typography.caption.uiFont)
        #expect(fonts.secondaryHelper.uiFont == themeMocked.typography.caption.uiFont)
    }
}
