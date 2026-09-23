//
//  SegmentedControlGetColorsUseCaseTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("SegmentedControl Get Colors Use Case Tests")
struct SegmentedControlGetColorsUseCaseTests {

    // MARK: - Properties

    let sut: SegmentedControlGetColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = SegmentedControlGetColorsUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns correct colors")
    func executeReturnsCorrectColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme)

        // THEN
        #expect(colors.backgroundColorToken.equals(self.theme.colors.base.surface))
        #expect(colors.borderColorToken.equals(self.theme.colors.base.outline))
        #expect(colors.separatorColorToken.equals(self.theme.colors.base.outline.opacity(self.theme.dims.dim3)))
        #expect(colors.selectedItemBackgroundColorToken.equals(self.theme.colors.support.supportContainer))
        #expect(colors.selectedItemBorderColorToken.equals(self.theme.colors.support.support))
        #expect(colors.accessibilitySelectedTintColorToken.equals(self.theme.colors.support.onSupport))
        #expect(colors.accessibilitySelectedBackgroundColorToken.equals(self.theme.colors.support.support))
    }
}
