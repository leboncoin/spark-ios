//
//  SnackbarGetLayoutUseCaseTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSnackbar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Snackbar Get Layout Use Case Tests")
struct SnackbarGetLayoutUseCaseTests {

    // MARK: - Properties

    let sut: SnackbarGetLayoutUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = SnackbarGetLayoutUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns expected layout values")
    func executeReturnsExpectedLayoutValues() {
        // GIVEN / WHEN
        let layout = self.sut.execute(theme: self.theme)

        // THEN
        #expect(layout.presentationPadding == self.theme.layout.spacing.large)
        #expect(layout.leadingPadding == self.theme.layout.spacing.large)
        #expect(layout.trailingPadding == self.theme.layout.spacing.medium)
        #expect(layout.horizontalSpacing == self.theme.layout.spacing.medium)
        #expect(layout.verticalPadding == self.theme.layout.spacing.medium)
        #expect(layout.verticalSpacing == self.theme.layout.spacing.medium)
        #expect(layout.verticalSubSpacing == self.theme.layout.spacing.small)
    }
}
