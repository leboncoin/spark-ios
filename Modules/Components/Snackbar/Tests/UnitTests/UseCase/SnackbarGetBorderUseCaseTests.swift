//
//  SnackbarGetBorderUseCaseTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSnackbar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Snackbar Get Border Use Case Tests")
struct SnackbarGetBorderUseCaseTests {

    // MARK: - Properties

    let sut: SnackbarGetBorderUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = SnackbarGetBorderUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns expected border values")
    func executeReturnsExpectedBorderValues() {
        // GIVEN / WHEN
        let border = self.sut.execute(theme: self.theme)

        // THEN
        #expect(border.width == self.theme.border.width.small)
        #expect(border.radius == self.theme.border.radius.large)
    }
}
