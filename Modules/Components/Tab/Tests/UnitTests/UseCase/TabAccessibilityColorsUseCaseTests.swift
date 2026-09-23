//
//  TabAccessibilityColorsUseCaseTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Tab Accessibility Colors Use Case Tests")
struct TabAccessibilityColorsUseCaseTests {

    // MARK: - Properties

    let sut: TabAccessibilityColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = TabAccessibilityColorsUseCase()
    }

    // MARK: - Tests

    @Test("Execute intent main")
    func executeIntentMain() throws {
        // GIVEN / WHEN
        let colors = sut.execute(theme: self.theme, intent: .main)

        // THEN
        #expect(colors.selectedTintColorToken.equals(self.theme.colors.main.onMain))
        #expect(colors.selectedBackgroundColorToken.equals(self.theme.colors.main.main))
    }

    @Test("Execute intent support")
    func executeIntentSupport() throws {
        // GIVEN / WHEN
        let colors = sut.execute(theme: self.theme, intent: .support)

        // THEN
        #expect(colors.selectedTintColorToken.equals(self.theme.colors.support.onSupport))
        #expect(colors.selectedBackgroundColorToken.equals(self.theme.colors.support.support))
    }
}
