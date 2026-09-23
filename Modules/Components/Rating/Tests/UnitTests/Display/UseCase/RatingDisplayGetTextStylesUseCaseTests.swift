//
//  RatingDisplayGetTextStylesUseCaseTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 14/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkThemingTesting

final class RatingDisplayGetTextStylesUseCaseTests: XCTestCase {

    // MARK: - Properties

    var sut: RatingDisplayGetTextStylesUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = RatingDisplayGetTextStylesUseCase()
    }

    // MARK: - Tests

    func test_execute_with_small_size() {
        // GIVEN / WHEN
        let textStyles = self.sut.execute(
            theme: self.theme,
            size: .small
        )

        // THEN
        let expectedTextStyles = RatingDisplayTextStyles(
            value: .init(
                fontToken: self.theme.typography.captionHighlight,
                colorToken: self.theme.colors.base.onSurface
            ),
            count: .init(
                fontToken: self.theme.typography.caption,
                colorToken: self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)
            ),
            additional: .init(
                fontToken: self.theme.typography.caption,
                colorToken: self.theme.colors.base.onSurface
            )
        )

        XCTAssertEqual(textStyles, expectedTextStyles)
    }

    func test_execute_with_medium_size() {
        // GIVEN / WHEN
        let textStyles = self.sut.execute(
            theme: self.theme,
            size: .medium
        )

        // THEN
        let expectedTextStyles = RatingDisplayTextStyles(
            value: .init(
                fontToken: self.theme.typography.body2Highlight,
                colorToken: self.theme.colors.base.onSurface
            ),
            count: .init(
                fontToken: self.theme.typography.body2,
                colorToken: self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)
            ),
            additional: .init(
                fontToken: self.theme.typography.body2,
                colorToken: self.theme.colors.base.onSurface
            )
        )

        XCTAssertEqual(textStyles, expectedTextStyles)
    }

    func test_execute_with_large_size() {
        // GIVEN / WHEN
        let textStyles = self.sut.execute(
            theme: self.theme,
            size: .large
        )

        // THEN
        let expectedTextStyles = RatingDisplayTextStyles(
            value: .init(
                fontToken: self.theme.typography.display3,
                colorToken: self.theme.colors.base.onSurface
            ),
            count: .init(
                fontToken: self.theme.typography.display3,
                colorToken: self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)
            ),
            additional: .init(
                fontToken: self.theme.typography.display3,
                colorToken: self.theme.colors.base.onSurface
            )
        )

        XCTAssertEqual(textStyles, expectedTextStyles)
    }

    func test_execute_with_deprecated_input_case_for_undefined_size() {
        // GIVEN
        let customSize: RatingDisplaySize = .input

        // WHEN
        let textStyles = self.sut.execute(
            theme: self.theme,
            size: customSize
        )

        // THEN
        let expectedTextStyles = RatingDisplayTextStyles(
            value: .init(
                fontToken: self.theme.typography.display3,
                colorToken: self.theme.colors.base.onSurface
            ),
            count: .init(
                fontToken: self.theme.typography.display3,
                colorToken: self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)
            ),
            additional: .init(
                fontToken: self.theme.typography.display3,
                colorToken: self.theme.colors.base.onSurface
            )
        )

        XCTAssertEqual(textStyles, expectedTextStyles)
    }
}
