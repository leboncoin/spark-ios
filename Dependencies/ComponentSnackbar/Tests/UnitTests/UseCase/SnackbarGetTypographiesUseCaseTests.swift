//
//  SnackbarGetTypographiesUseCaseTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSnackbar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Snackbar Get Typographies Use Case Tests")
struct SnackbarGetTypographiesUseCaseTests {

    // MARK: - Properties

    let sut: SnackbarGetTypographiesUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = SnackbarGetTypographiesUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns expected typographies values")
    func executeReturnsExpectedTypographiesValues() {
        // GIVEN / WHEN
        let typographies = self.sut.execute(theme: self.theme)

        // THEN
        #expect(typographies.titleFontToken.equals(self.theme.typography.body1Highlight))
        #expect(typographies.descriptionFontToken.equals(self.theme.typography.body2))
    }
}
