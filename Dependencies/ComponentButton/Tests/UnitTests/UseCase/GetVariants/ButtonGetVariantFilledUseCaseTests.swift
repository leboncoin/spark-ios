//
//  ButtonGetVariantFilledUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Variant Filled Use Case Tests")
struct ButtonGetVariantFilledUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetVariantFilledUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = ButtonGetVariantFilledUseCase()
    }

    // MARK: - Tests

    @Test("Intent accent - not pressed")
    func intentAccentNotPressed() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .accent, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.accent.onAccent))
        #expect(colors.backgroundColor.equals(self.theme.colors.accent.accent))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent accent - pressed")
    func intentAccentPressed() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .accent, isPressed: true)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.accent.onAccent))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.accentPressed))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent ai - not pressed")
    func intentAINotPressed() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .ai, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.ai.onAI))
        #expect(colors.backgroundColor.equals(self.theme.colors.ai.ai))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent ai - pressed")
    func intentAIPressed() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .ai, isPressed: true)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.ai.onAI))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.aiPressed))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent main - not pressed")
    func intentMainNotPressed() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .main, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.main.onMain))
        #expect(colors.backgroundColor.equals(self.theme.colors.main.main))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent main - pressed")
    func intentMainPressed() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .main, isPressed: true)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.main.onMain))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.mainPressed))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }
}
