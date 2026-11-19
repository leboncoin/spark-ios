//
//  PopoverToken+LayoutTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentPopover
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct PopoverTokenLayoutTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: PopoverToken.Layout {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Horizontal padding should return spacing xLarge")
    func horizontalPaddingShouldReturnSpacingXLarge() {
        #expect(self.token.horizontalPadding == self.theme.layout.spacing.xLarge)
    }

    @Test("Vertical padding should return spacing large")
    func verticalPaddingShouldReturnSpacingLarge() {
        #expect(self.token.verticalPadding == self.theme.layout.spacing.large)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(PopoverToken.Layout(theme: self.theme) == PopoverToken.Layout(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(PopoverToken.Layout(theme: self.theme) != PopoverToken.Layout(theme: ThemeGeneratedMock.mocked2()))
    }
}
