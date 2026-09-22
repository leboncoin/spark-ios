//
//  ChipGetLayoutUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ChipGetLayoutUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: ChipGetLayoutUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = ChipGetLayoutUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_with_leading_icon_alignment() {
        // GIVEN
        let token = ChipToken.Layout(theme: self.theme)

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .leadingIcon
        )

        // THEN
        XCTAssertEqual(result.spacing, token.spacingWhenLeadingIcon)
        XCTAssertEqual(result.extraContentSpacing, token.extraContentSpacing)
        XCTAssertEqual(result.padding, token.horizontalPadding)
    }

    func test_execute_with_trailing_icon_alignment() {
        // GIVEN
        let token = ChipToken.Layout(theme: self.theme)

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .trailingIcon
        )

        // THEN
        XCTAssertEqual(result.spacing, token.spacingWhenTrailingIcon)
        XCTAssertEqual(result.extraContentSpacing, token.extraContentSpacing)
        XCTAssertEqual(result.padding, token.horizontalPadding)
    }
}
