//
//  CardGetLayoutUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

@Suite("Card Get Layout Use Case Tests")
struct CardGetLayoutUseCaseTests {

    // MARK: - Properties

    private let useCase = CardGetLayoutUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute with padding all and banner position")
    func executeWithPaddingAllAndBannerPosition() {
        // GIVEN
        let padding = CardPadding.all
        let headerPosition = CardHeaderPosition.banner

        // WHEN
        let layout = self.useCase.execute(
            theme: self.theme,
            padding: padding,
            headerPosition: headerPosition
        )

        // THEN
        #expect(layout.padding == self.theme.layout.spacing.large)
        #expect(layout.headerVerticalPadding == self.theme.layout.spacing.medium)
        #expect(layout.headerHorizontalPadding == self.theme.layout.spacing.medium)
        #expect(layout.isHeaderBottonPadding == false)
    }

    @Test("Execute with padding all and border position")
    func executeWithPaddingAllAndBorderPosition() {
        // GIVEN
        let padding = CardPadding.all
        let headerPosition = CardHeaderPosition.border

        // WHEN
        let layout = self.useCase.execute(
            theme: self.theme,
            padding: padding,
            headerPosition: headerPosition
        )

        // THEN
        #expect(layout.padding == self.theme.layout.spacing.large)
        #expect(layout.headerVerticalPadding == self.theme.layout.spacing.small)
        #expect(layout.headerHorizontalPadding == self.theme.layout.spacing.large)
        #expect(layout.isHeaderBottonPadding == false)
    }

    @Test("Execute with padding all and bottom header and banner position")
    func executeWithPaddingAllAndBottomHeaderAndBannerPosition() {
        // GIVEN
        let padding = CardPadding.allAndBottomHeader
        let headerPosition = CardHeaderPosition.banner

        // WHEN
        let layout = self.useCase.execute(
            theme: self.theme,
            padding: padding,
            headerPosition: headerPosition
        )

        // THEN
        #expect(layout.padding == self.theme.layout.spacing.large)
        #expect(layout.headerVerticalPadding == self.theme.layout.spacing.medium)
        #expect(layout.headerHorizontalPadding == self.theme.layout.spacing.medium)
        #expect(layout.isHeaderBottonPadding == false)
    }

    @Test("Execute with padding all and bottom header and border position")
    func executeWithPaddingAllAndBottomHeaderAndBorderPosition() {
        // GIVEN
        let padding = CardPadding.allAndBottomHeader
        let headerPosition = CardHeaderPosition.border

        // WHEN
        let layout = self.useCase.execute(
            theme: self.theme,
            padding: padding,
            headerPosition: headerPosition
        )

        // THEN
        #expect(layout.padding == self.theme.layout.spacing.large)
        #expect(layout.headerVerticalPadding == self.theme.layout.spacing.small)
        #expect(layout.headerHorizontalPadding == self.theme.layout.spacing.large)
        #expect(layout.isHeaderBottonPadding == true)
    }

    @Test("Execute with padding none and banner position")
    func executeWithPaddingNoneAndBannerPosition() {
        // GIVEN
        let padding = CardPadding.none
        let headerPosition = CardHeaderPosition.banner

        // WHEN
        let layout = self.useCase.execute(
            theme: self.theme,
            padding: padding,
            headerPosition: headerPosition
        )

        // THEN
        #expect(layout.padding == .zero)
        #expect(layout.headerVerticalPadding == self.theme.layout.spacing.medium)
        #expect(layout.headerHorizontalPadding == self.theme.layout.spacing.medium)
        #expect(layout.isHeaderBottonPadding == false)
    }

    @Test("Execute with padding none and border position")
    func executeWithPaddingNoneAndBorderPosition() {
        // GIVEN
        let padding = CardPadding.none
        let headerPosition = CardHeaderPosition.border

        // WHEN
        let layout = self.useCase.execute(
            theme: self.theme,
            padding: padding,
            headerPosition: headerPosition
        )

        // THEN
        #expect(layout.padding == .zero)
        #expect(layout.headerVerticalPadding == self.theme.layout.spacing.small)
        #expect(layout.headerHorizontalPadding == self.theme.layout.spacing.large)
        #expect(layout.isHeaderBottonPadding == false)
    }
}
