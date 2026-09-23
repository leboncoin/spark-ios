//
//  SegmentedGaugeGetSegmentBorderUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import Foundation
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

final class SegmentedGaugeGetSegmentBorderUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_returnsCorrectBorder() {
        // GIVEN
        let useCase = SegmentedGaugeGetSegmentBorderUseCase()
        let theme = ThemeGeneratedMock.mocked()

        let expectedBorder = SegmentedGaugeSegmentBorder(
            width: theme.border.width.small,
            radius: theme.border.radius.full
        )

        // WHEN
        let result = useCase.execute(theme: theme)

        // THEN
        XCTAssertEqual(result, expectedBorder)
    }
}
