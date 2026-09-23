//
//  TabGetSizesUseCaseTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Tab Get Sizes Use Case Tests")
struct TabGetSizesUseCaseTests {

    // MARK: - Properties

    let sut: TabGetSizesUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = TabGetSizesUseCase()
    }

    // MARK: - Tests

    @Test("Size xSmall")
    func sizeXSmall() throws {
        // GIVEN / WHEN
        let sizes = sut.execute(theme: self.theme, size: .xSmall)

        let expectedSizes = TabSizes(height: 34, iconHeight: 12)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size small")
    func sizeSmall() throws {
        // GIVEN / WHEN
        let sizes = sut.execute(theme: self.theme, size: .small)

        let expectedSizes = TabSizes(height: 36, iconHeight: 14)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size medium")
    func sizeMedium() throws {
        // GIVEN / WHEN
        let sizes = sut.execute(theme: self.theme, size: .medium)

        let expectedSizes = TabSizes(height: 40, iconHeight: 16)

        // THEN
        #expect(sizes == expectedSizes)
    }
}
