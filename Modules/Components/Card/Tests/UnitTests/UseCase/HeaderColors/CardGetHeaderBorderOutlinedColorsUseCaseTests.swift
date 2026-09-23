//
//  CardGetHeaderBorderOutlinedColorsUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 15/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Card Get Header Border Outlined Colors Use Case Tests")
struct CardGetHeaderBorderOutlinedColorsUseCaseTests {

    // MARK: - Properties

    let sut: CardGetHeaderBorderOutlinedColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = CardGetHeaderBorderOutlinedColorsUseCase()
    }

    // MARK: - Tests

    @Test("Execute with accent intent")
    func executeWithAccentIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .accent)

        // THEN
        #expect(colors.background.equals(self.theme.colors.base.surface))
        #expect(colors.foreground.equals(self.theme.colors.base.surface))
    }

    @Test("Execute with alert intent")
    func executeWithAlertIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .alert)

        // THEN
        #expect(colors.background.equals(self.theme.colors.base.surface))
        #expect(colors.foreground.equals(self.theme.colors.feedback.alert))
    }

    @Test("Execute with main intent")
    func executeWithMainIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .main)

        // THEN
        #expect(colors.background.equals(self.theme.colors.base.surface))
        #expect(colors.foreground.equals(self.theme.colors.main.main))
    }

    @Test("Execute with support intent")
    func executeWithSupportIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .support)

        // THEN
        #expect(colors.background.equals(self.theme.colors.base.surface))
        #expect(colors.foreground.equals(self.theme.colors.support.support))
    }

    @Test("Execute with surface intent")
    func executeWithSurfaceIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .surface)

        // THEN
        #expect(colors.background.equals(self.theme.colors.base.surface))
        #expect(colors.foreground.equals(self.theme.colors.base.onSurface))
    }
}
