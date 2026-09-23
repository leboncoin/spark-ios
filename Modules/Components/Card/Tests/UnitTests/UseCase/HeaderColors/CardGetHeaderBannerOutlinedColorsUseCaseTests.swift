//
//  CardGetHeaderBannerOutlinedColorsUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 15/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Card Get Header Banner Outlined Colors Use Case Tests")
struct CardGetHeaderBannerOutlinedColorsUseCaseTests {

    // MARK: - Properties

    let sut: CardGetHeaderBannerOutlinedColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = CardGetHeaderBannerOutlinedColorsUseCase()
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

    @Test("Execute with info intent")
    func executeWithInfoIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .info)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.info))
        #expect(colors.foreground.equals(self.theme.colors.feedback.onInfo))
    }

    @Test("Execute with main intent")
    func executeWithMainIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .main)

        // THEN
        #expect(colors.background.equals(self.theme.colors.main.main))
        #expect(colors.foreground.equals(self.theme.colors.main.onMain))
    }

    @Test("Execute with neutral intent")
    func executeWithNeutralIntent() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .neutral)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.neutral))
        #expect(colors.foreground.equals(self.theme.colors.feedback.onNeutral))
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
