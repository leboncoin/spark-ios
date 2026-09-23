//
//  SegmentedControlGetDimUseCaseTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("SegmentedControl Get Dim Use Case Tests")
struct SegmentedControlGetDimUseCaseTests {

    // MARK: - Properties

    let sut: SegmentedControlGetDimUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = SegmentedControlGetDimUseCase()
    }

    // MARK: - Tests

    @Test("Execute when enabled returns none")
    func executeWhenEnabledReturnsNone() {
        // GIVEN / WHEN
        let dim = self.sut.execute(theme: self.theme, isEnabled: true)

        // THEN
        #expect(dim == self.theme.dims.none)
    }

    @Test("Execute when disabled returns dim3")
    func executeWhenDisabledReturnsDim3() {
        // GIVEN / WHEN
        let dim = self.sut.execute(theme: self.theme, isEnabled: false)

        // THEN
        #expect(dim == self.theme.dims.dim3)
    }
}
