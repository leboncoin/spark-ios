//
//  BadgeGetSizesUseCaseTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 24/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class BadgeGetSizesUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: BadgeGetSizesUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = BadgeGetSizesUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Small Size Tests

    func test_execute_when_small_without_border_without_value() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .small,
            isBorder: false,
            value: nil
        )

        // THEN
        XCTAssertEqual(result.content, 8)
        XCTAssertEqual(result.border, .zero)
        XCTAssertEqual(result.horizontalSpacing, self.theme.layout.spacing.small)
        XCTAssertEqual(result.attachHorizontalSpacing, self.theme.layout.spacing.small)
    }

    func test_execute_when_small_with_border_without_value() {
        // GIVEN
        let expectedBorder = self.theme.border.width.medium

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .small,
            isBorder: true,
            value: nil
        )

        // THEN
        XCTAssertEqual(result.content, 8 + expectedBorder * 2)
        XCTAssertEqual(result.border, expectedBorder)
        XCTAssertEqual(result.horizontalSpacing, self.theme.layout.spacing.small + expectedBorder)
        XCTAssertEqual(result.attachHorizontalSpacing, self.theme.layout.spacing.small)
    }

    func test_execute_when_small_with_border_with_value() {
        // GIVEN
        let expectedBorder = self.theme.border.width.medium

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .small,
            isBorder: true,
            value: 10
        )

        // THEN
        XCTAssertEqual(result.content, 16 + expectedBorder * 2)
        XCTAssertEqual(result.border, expectedBorder)
        XCTAssertEqual(result.horizontalSpacing, self.theme.layout.spacing.small + expectedBorder)
        XCTAssertEqual(result.attachHorizontalSpacing, self.theme.layout.spacing.small)
    }

    // MARK: - Small Size Tests

    func test_execute_when_medium_without_border_without_value() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .medium,
            isBorder: false,
            value: nil
        )

        // THEN
        XCTAssertEqual(result.content, 16)
        XCTAssertEqual(result.border, .zero)
        XCTAssertEqual(result.horizontalSpacing, self.theme.layout.spacing.medium)
        XCTAssertEqual(result.attachHorizontalSpacing, self.theme.layout.spacing.small)
    }

    func test_execute_when_medium_with_border_without_value() {
        // GIVEN
        let expectedBorder = self.theme.border.width.medium

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .medium,
            isBorder: true,
            value: nil
        )

        // THEN
        XCTAssertEqual(result.content, 16 + expectedBorder * 2)
        XCTAssertEqual(result.border, expectedBorder)
        XCTAssertEqual(result.horizontalSpacing, self.theme.layout.spacing.medium + expectedBorder)
        XCTAssertEqual(result.attachHorizontalSpacing, self.theme.layout.spacing.small)
    }

    func test_execute_when_medium_with_border_with_value() {
        // GIVEN
        let expectedBorder = self.theme.border.width.medium

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            size: .medium,
            isBorder: true,
            value: 5
        )

        // THEN
        XCTAssertEqual(result.content, 24 + expectedBorder * 2)
        XCTAssertEqual(result.border, expectedBorder)
        XCTAssertEqual(result.horizontalSpacing, self.theme.layout.spacing.medium + expectedBorder)
    }
}
