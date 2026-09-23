//
//  RatingGetColorsUseCaseDeprecatedUnitTests.swift
//  SparkComponentRating
//
//  Created by michael.zimmermann on 09.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkThemingTesting

final class RatingGetColorsUseCaseDeprecatedUnitTests: XCTestCase {

    // MARK: - Variables
    var sut: RatingGetColorsUseCaseDeprecated!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup
    override func setUp() {
        super.setUp()

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = RatingGetColorsUseCaseDeprecated()
    }

    // MARK: - Tests
    func test_standard_display() {
        // When
        let colors = self.sut.execute(
            theme: self.theme,
            intent: .main,
            state: .standard)

        // Then
        let expectedColors = RatingColorsDeprecated(
            fillColor: theme.colors.main.mainVariant,
            strokeColor: theme.colors.base.onSurface.opacity(theme.dims.dim3),
            opacity: theme.dims.none)

        XCTAssertEqual(colors, expectedColors)
    }

    func test_disabled() {
        // When
        let colors = self.sut.execute(
            theme: self.theme,
            intent: .main,
            state: .disabled)

        // Then
        let expectedColors = RatingColorsDeprecated(
            fillColor: theme.colors.main.mainVariant,
            strokeColor: theme.colors.base.onSurface.opacity(theme.dims.dim3),
            opacity: theme.dims.dim3)

        XCTAssertEqual(colors, expectedColors)
    }

    func test_pressed() {
        // When
        let colors = self.sut.execute(
            theme: self.theme,
            intent: .main,
            state: .pressed)

        // Then
        let expectedColors = RatingColorsDeprecated(
            fillColor: theme.colors.states.mainVariantPressed,
            strokeColor: theme.colors.base.onSurface.opacity(theme.dims.dim3),
            opacity: theme.dims.none)

        XCTAssertEqual(colors, expectedColors)
    }
}
