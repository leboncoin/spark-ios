//
//  CardGetBorderUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

@Suite("Card Get Border Use Case Tests")
struct CardGetBorderUseCaseTests {

    // MARK: - Properties

    private let useCase = CardGetBorderUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute with outlined variant and banner position without header")
    func executeWithOutlinedVariantAndBannerPositionWithoutHeader() {
        // GIVEN
        let variant = CardVariant.outlined
        let isHeader = false
        let headerPosition = CardHeaderPosition.banner

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isHeader: isHeader,
            headerPosition: headerPosition
        )

        // THEN
        #expect(border.width == self.theme.border.width.small)
        #expect(border.radius == self.theme.border.radius.large)
        #expect(border.headerRadius == self.theme.border.radius.none)
    }

    @Test("Execute with outlined variant and banner position with header")
    func executeWithOutlinedVariantAndBannerPositionWithHeader() {
        // GIVEN
        let variant = CardVariant.outlined
        let isHeader = true
        let headerPosition = CardHeaderPosition.banner

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isHeader: isHeader,
            headerPosition: headerPosition
        )

        // THEN
        #expect(border.width == self.theme.border.width.medium)
        #expect(border.radius == self.theme.border.radius.large)
        #expect(border.headerRadius == self.theme.border.radius.none)
    }

    @Test("Execute with outlined variant and border position without header")
    func executeWithOutlinedVariantAndBorderPositionWithoutHeader() {
        // GIVEN
        let variant = CardVariant.outlined
        let isHeader = false
        let headerPosition = CardHeaderPosition.border

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isHeader: isHeader,
            headerPosition: headerPosition
        )

        // THEN
        #expect(border.width == self.theme.border.width.small)
        #expect(border.radius == self.theme.border.radius.large)
        #expect(border.headerRadius == self.theme.border.radius.large)
    }

    @Test("Execute with outlined variant and border position with header")
    func executeWithOutlinedVariantAndBorderPositionWithHeader() {
        // GIVEN
        let variant = CardVariant.outlined
        let isHeader = true
        let headerPosition = CardHeaderPosition.border

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isHeader: isHeader,
            headerPosition: headerPosition
        )

        // THEN
        #expect(border.width == self.theme.border.width.small)
        #expect(border.radius == self.theme.border.radius.large)
        #expect(border.headerRadius == self.theme.border.radius.large)
    }

    @Test("Execute with filled variant and banner position")
    func executeWithFilledVariantAndBannerPosition() {
        // GIVEN
        let variant = CardVariant.filled
        let isHeader = false
        let headerPosition = CardHeaderPosition.banner

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isHeader: isHeader,
            headerPosition: headerPosition
        )

        // THEN
        #expect(border.width == self.theme.border.width.none)
        #expect(border.radius == self.theme.border.radius.large)
        #expect(border.headerRadius == self.theme.border.radius.none)
    }

    @Test("Execute with filled variant and border position")
    func executeWithFilledVariantAndBorderPosition() {
        // GIVEN
        let variant = CardVariant.filled
        let isHeader = false
        let headerPosition = CardHeaderPosition.border

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isHeader: isHeader,
            headerPosition: headerPosition
        )

        // THEN
        #expect(border.width == self.theme.border.width.none)
        #expect(border.radius == self.theme.border.radius.large)
        #expect(border.headerRadius == self.theme.border.radius.large)
    }

    @Test("Execute with tinted variant and banner position")
    func executeWithTintedVariantAndBannerPosition() {
        // GIVEN
        let variant = CardVariant.tinted
        let isHeader = false
        let headerPosition = CardHeaderPosition.banner

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isHeader: isHeader,
            headerPosition: headerPosition
        )

        // THEN
        #expect(border.width == self.theme.border.width.none)
        #expect(border.radius == self.theme.border.radius.large)
        #expect(border.headerRadius == self.theme.border.radius.none)
    }

    @Test("Execute with tinted variant and border position")
    func executeWithTintedVariantAndBorderPosition() {
        // GIVEN
        let variant = CardVariant.tinted
        let isHeader = false
        let headerPosition = CardHeaderPosition.border

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isHeader: isHeader,
            headerPosition: headerPosition
        )

        // THEN
        #expect(border.width == self.theme.border.width.none)
        #expect(border.radius == self.theme.border.radius.large)
        #expect(border.headerRadius == self.theme.border.radius.large)
    }
}
