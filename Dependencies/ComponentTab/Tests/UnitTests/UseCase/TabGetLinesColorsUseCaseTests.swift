//
//  TabGetLinesColorsUseCaseTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Tab Get Lines Colors Use Case Tests")
struct TabGetLinesColorsUseCaseTests {

    // MARK: - Properties

    let sut: TabGetLinesColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = TabGetLinesColorsUseCase()
    }

    // MARK: - Tests

    @Test("Intent main")
    func intentMain() throws {
        // GIVEN / WHEN
        let colors = sut.execute(theme: self.theme, intent: .main)

        // THEN
        let expectedColors = TabLinesColors(
            colorToken: self.theme.colors.base.outline,
            selectedColorToken: self.theme.colors.main.main
        )

        #expect(colors == expectedColors)
    }

    @Test("Intent support")
    func intentSupport() throws {
        // GIVEN / WHEN
        let colors = sut.execute(theme: self.theme, intent: .support)

        // THEN
        let expectedColors = TabLinesColors(
            colorToken: self.theme.colors.base.outline,
            selectedColorToken: self.theme.colors.support.support
        )

        #expect(colors == expectedColors)
    }
}
