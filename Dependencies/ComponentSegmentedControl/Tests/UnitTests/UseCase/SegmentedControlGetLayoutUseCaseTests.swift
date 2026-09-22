//
//  SegmentedControlGetLayoutUseCaseTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("SegmentedControl Get Layout Use Case Tests")
struct SegmentedControlGetLayoutUseCaseTests {

    // MARK: - Properties

    let sut: SegmentedControlGetLayoutUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = SegmentedControlGetLayoutUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns correct layout")
    func executeReturnsCorrectLayout() {
        // GIVEN / WHEN
        let layout = self.sut.execute(theme: self.theme)

        // THEN
        #expect(layout.padding == self.theme.layout.spacing.small)
        #expect(layout.spacing == self.theme.layout.spacing.small)
        #expect(layout.accessibilityHorizontalPadding == self.theme.layout.spacing.large)
        #expect(layout.accessibilityVerticalPadding == self.theme.layout.spacing.medium)
    }
}
