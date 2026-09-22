//
//  SegmentedControlGetItemColorsUseCaseTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("SegmentedControl Get Item Colors Use Case Tests")
struct SegmentedControlGetItemColorsUseCaseTests {

    // MARK: - Properties

    let sut: SegmentedControlGetItemColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = SegmentedControlGetItemColorsUseCase()
    }

    // MARK: - Tests

    @Test("Execute when pressed returns correct colors")
    func executeWhenPressedReturnsCorrectColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, isPressed: true, isSelected: false)

        // THEN
        #expect(colors.backgroundColorToken.equals(self.theme.colors.states.supportContainerPressed))
        #expect(colors.contentColorToken.equals(self.theme.colors.support.onSupportContainer))
    }

    @Test("Execute when not pressed returns correct colors")
    func executeWhenNotPressedReturnsCorrectColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, isPressed: false, isSelected: false)

        // THEN
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.contentColorToken.equals(self.theme.colors.support.onSupportContainer))
    }

    @Test("Execute when selected pressed returns clear background")
    func executeWhenSelectedPressedReturnsClearBackground() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, isPressed: false, isSelected: true)

        // THEN
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.contentColorToken.equals(self.theme.colors.support.onSupportContainer))
    }

    @Test("Execute when selected pressed takes priority over pressed")
    func executeWhenSelectedPressedTakesPriorityOverPressed() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, isPressed: true, isSelected: true)

        // THEN
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.contentColorToken.equals(self.theme.colors.support.onSupportContainer))
    }
}
