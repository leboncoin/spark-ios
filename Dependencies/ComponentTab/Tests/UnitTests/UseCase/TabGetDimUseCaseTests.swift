//
//  TabGetDimUseCaseTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Tab Get Dim Use Case Tests")
struct TabGetDimUseCaseTests {

    // MARK: - Properties

    let sut: TabGetDimUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = TabGetDimUseCase()
    }

    // MARK: - Tests

    @Test("Is enabled true")
    func isEnabledTrue() throws {
        // GIVEN / WHEN
        let dim = sut.execute(theme: self.theme, isEnabled: true)

        // THEN
        #expect(dim == self.theme.dims.none)
    }

    @Test("Is enabled false")
    func isEnabledFalse() throws {
        // GIVEN / WHEN
        let dim = sut.execute(theme: self.theme, isEnabled: false)

        // THEN
        #expect(dim == self.theme.dims.dim3)
    }
}
