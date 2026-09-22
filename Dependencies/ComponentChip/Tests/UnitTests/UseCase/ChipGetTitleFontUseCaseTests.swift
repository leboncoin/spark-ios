//
//  ChipGetTitleFontUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ChipGetTitleFontUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_returns_correct_font() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let token = ChipToken.Typography(theme: theme)
        let useCase = ChipGetTitleFontUseCase()

        // WHEN
        let result = useCase.execute(theme: theme)

        // THEN
        XCTAssertTrue(result.equals(token.titleFont))
    }
}
