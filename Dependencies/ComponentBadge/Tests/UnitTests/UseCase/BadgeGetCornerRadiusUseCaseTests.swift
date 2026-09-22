//
//  BadgeGetCornerRadiusUseCaseTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class BadgeGetCornerRadiusUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: BadgeGetCornerRadiusUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = BadgeGetCornerRadiusUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme)

        // THEN
        XCTAssertEqual(result, self.theme.border.radius.full)
    }
}
