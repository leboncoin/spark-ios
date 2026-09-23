//
//  TabGetContentColorsUseCaseTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Tab Get Content Colors Use Case Tests")
struct TabGetContentColorsUseCaseTests {

    // MARK: - Properties

    let sut: TabGetContentColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = TabGetContentColorsUseCase()
    }

    // MARK: - Tests

    @Test("Is pressed false")
    func isPressedFalse() throws {
        // GIVEN / WHEN
        let colors = sut.execute(theme: self.theme, intent: .default, isSelected: true, isPressed: false)

        // THEN
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
    }

    @Test("Is pressed true")
    func isPressedTrue() throws {
        // GIVEN / WHEN
        let colors = sut.execute(theme: self.theme, intent: .default, isSelected: true, isPressed: true)

        // THEN
        #expect(colors.backgroundColorToken.equals(self.theme.colors.states.surfacePressed))
    }

    @Test("Is selected false")
    func isSelectedFalse() throws {
        // GIVEN / WHEN
        let colors = sut.execute(theme: self.theme, intent: .default, isSelected: false, isPressed: false)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.base.onSurface))
    }

    @Test("Is selected true intent main")
    func isSelectedTrueIntentMain() throws {
        // GIVEN / WHEN
        let colors = sut.execute(theme: self.theme, intent: .main, isSelected: true, isPressed: false)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.main.main))
    }

    @Test("Is selected true intent support")
    func isSelectedTrueIntentSupport() throws {
        // GIVEN / WHEN
        let colors = sut.execute(theme: self.theme, intent: .support, isSelected: true, isPressed: false)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.support.support))
    }
}
