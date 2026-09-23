//
//  ButtonGetTitleFontTokenUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Font Token Use Case Tests")
struct ButtonGetTitleFontTokenUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetTitleFontTokenUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = ButtonGetTitleFontTokenUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns callout font token")
    func executeReturnsCalloutFontToken() throws {
        // GIVEN / WHEN
        let fontToken = self.sut.execute(theme: self.theme)

        // THEN
        #expect(fontToken.equals(self.theme.typography.callout))
    }
}
