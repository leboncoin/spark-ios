//
//  CardGetHeaderTintedColorsUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 15/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Card Get Header Tinted Colors Use Case Tests")
struct CardGetHeaderTintedColorsUseCaseTests {

    // MARK: - Properties

    let sut: CardGetHeaderTintedColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = CardGetHeaderTintedColorsUseCase()
    }

    // MARK: - Tests

    @Test("Execute with accent intent")
    func executeWithAccentIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .accent)

        // THEN
        #expect(colors.background.equals(self.theme.colors.accent.accent))
        #expect(colors.foreground.equals(self.theme.colors.accent.onAccent))
    }

    @Test("Execute with alert intent")
    func executeWithAlertIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .alert)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.alert))
        #expect(colors.foreground.equals(self.theme.colors.feedback.onAlert))
    }

    @Test("Execute with main intent")
    func executeWithMainIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .main)

        // THEN
        #expect(colors.background.equals(self.theme.colors.main.main))
        #expect(colors.foreground.equals(self.theme.colors.main.onMain))
    }

    @Test("Execute with support intent")
    func executeWithSupportIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .support)

        // THEN
        #expect(colors.background.equals(self.theme.colors.support.support))
        #expect(colors.foreground.equals(self.theme.colors.support.onSupport))
    }

    @Test("Execute with surface intent")
    func executeWithSurfaceIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .surface)

        // THEN
        #expect(colors.background.equals(self.theme.colors.base.surfaceInverse))
        #expect(colors.foreground.equals(self.theme.colors.base.onSurfaceInverse))
    }
}
