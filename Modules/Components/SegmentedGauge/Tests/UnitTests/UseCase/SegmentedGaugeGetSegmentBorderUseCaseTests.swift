//
//  SegmentedGaugeGetSegmentBorderUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

@Suite("SegmentedGauge Get Segment Border UseCase Tests")
struct SegmentedGaugeGetSegmentBorderUseCaseTests {

    // MARK: - Tests

    @Test("Execute returns correct border")
    func executeReturnsCorrectBorder() {
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
        #expect(result == expectedBorder)
    }
}
