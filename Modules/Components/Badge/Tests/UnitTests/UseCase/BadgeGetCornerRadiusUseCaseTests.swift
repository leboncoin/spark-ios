//
//  BadgeGetCornerRadiusUseCaseTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Badge Get Corner Radius UseCase Tests")
struct BadgeGetCornerRadiusUseCaseTests {

    // MARK: - Properties

    private let sut: BadgeGetCornerRadiusUseCase
    private let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.sut = BadgeGetCornerRadiusUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    @Test("Execute")
    func execute() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        #expect(result == self.theme.border.radius.full)
    }
}
