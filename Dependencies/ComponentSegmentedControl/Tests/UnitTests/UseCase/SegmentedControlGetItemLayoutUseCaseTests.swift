//
//  SegmentedControlGetItemLayoutUseCaseTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("SegmentedControl Get Item Layout Use Case Tests")
struct SegmentedControlGetItemLayoutUseCaseTests {

    // MARK: - Properties

    let sut: SegmentedControlGetItemLayoutUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = SegmentedControlGetItemLayoutUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns correct layout")
    func executeReturnsCorrectLayout() {
        // GIVEN / WHEN
        let layout = self.sut.execute(theme: self.theme)

        // THEN
        #expect(layout.padding == self.theme.layout.spacing.medium)
        #expect(layout.spacing == self.theme.layout.spacing.medium)
    }
}
