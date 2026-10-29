//
//  RatingDisplayGetTextStylesUseCaseTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 14/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Rating Display Get Text Styles Use Case Tests")
struct RatingDisplayGetTextStylesUseCaseTests {

    // MARK: - Properties

    var sut: RatingDisplayGetTextStylesUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Setup

    init() {

        self.theme = ThemeGeneratedMock.mocked()
        self.sut = RatingDisplayGetTextStylesUseCase()
    }

    // MARK: - Tests

    @Test("Execute with small size")
    func executeWithSmallSize() {
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

        #expect(textStyles == expectedTextStyles)
    }

    @Test("Execute with medium size")
    func executeWithMediumSize() {
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

        #expect(textStyles == expectedTextStyles)
    }

    @Test("Execute with large size")
    func executeWithLargeSize() {
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

        #expect(textStyles == expectedTextStyles)
    }

    @Test("Execute with deprecated input case for undefined size")
    func executeWithDeprecatedInputCaseForUndefinedSize() {
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

        #expect(textStyles == expectedTextStyles)
    }
}
