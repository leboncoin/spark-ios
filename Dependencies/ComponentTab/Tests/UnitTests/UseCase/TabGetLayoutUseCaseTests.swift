//
//  TabGetLayoutUseCaseTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Tab Get Layout Use Case Tests")
struct TabGetLayoutUseCaseTests {

    // MARK: - Properties

    let sut: TabGetLayoutUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = TabGetLayoutUseCase()
    }

    // MARK: - Tests

    @Test("Execute")
    func execute() throws {
        // GIVEN / WHEN
        let layout = sut.execute(theme: self.theme)

        // THEN
        let expectedLayout = TabLayout(
            verticalPadding: self.theme.layout.spacing.medium,
            horizontalPadding: self.theme.layout.spacing.large,
            spacing: self.theme.layout.spacing.medium
        )

        #expect(layout == expectedLayout)
    }
}
