//
//  FormFieldGetFontsUseCaseTests.swift
//  SparkComponentFormField
//
//  Created by robin.lemaire on 06/05/25.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentFormField
@_spi(SI_SPI) import SparkThemingTesting

final class FormFieldGetFontsUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_for_all_feedback_cases() {
        // GIVEN
        let themeMocked = ThemeGeneratedMock.mocked()

        let useCase = FormFieldGetFontsUseCase()

        // WHEN
        let fonts = useCase.execute(from: themeMocked)

        // THEN
        XCTAssertEqual(fonts.title.uiFont, themeMocked.typography.body2.uiFont)
        XCTAssertEqual(fonts.clearButton.uiFont, themeMocked.typography.body2.uiFont)
        XCTAssertEqual(fonts.helper.uiFont, themeMocked.typography.caption.uiFont)
        XCTAssertEqual(fonts.require.uiFont, themeMocked.typography.caption.uiFont)
        XCTAssertEqual(fonts.secondaryHelper.uiFont, themeMocked.typography.caption.uiFont)
    }
}
