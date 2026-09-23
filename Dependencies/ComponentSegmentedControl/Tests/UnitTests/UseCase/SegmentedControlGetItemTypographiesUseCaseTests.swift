//
//  SegmentedControlGetItemTypographiesUseCaseTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("SegmentedControl Get Item Typographies Use Case Tests")
struct SegmentedControlGetItemTypographiesUseCaseTests {

    // MARK: - Properties

    let sut: SegmentedControlGetItemTypographiesUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = SegmentedControlGetItemTypographiesUseCase()
    }

    // MARK: - Tests

    @Test("Execute when selected returns body1Highlight")
    func executeWhenSelectedReturnsBody1Highlight() {
        // GIVEN / WHEN
        let typographies = self.sut.execute(theme: self.theme, isSelected: true)

        // THEN
        #expect(typographies.textFontToken.equals(self.theme.typography.body1Highlight))
    }

    @Test("Execute when not selected returns body1")
    func executeWhenNotSelectedReturnsBody1() {
        // GIVEN / WHEN
        let typographies = self.sut.execute(theme: self.theme, isSelected: false)

        // THEN
        #expect(typographies.textFontToken.equals(self.theme.typography.body1))
    }
}
