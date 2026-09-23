//
//  SegmentedGaugeGetLayoutUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

final class SegmentedGaugeGetLayoutUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = SegmentedGaugeGetLayoutUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute_withHorizontalAlignment_returnsMediumSubContentSpacing() {
        // GIVEN
        let alignment = SegmentedGaugeAlignment.horizontal

        let expectedLayout = SegmentedGaugeLayout(
            contentSpacing: self.theme.layout.spacing.small,
            subContentSpacing: self.theme.layout.spacing.medium,
            segmentsSpacing: self.theme.layout.spacing.small
        )

        // WHEN
        let result = self.useCase.execute(theme: self.theme, alignment: alignment)

        // THEN
        XCTAssertEqual(result, expectedLayout)
    }

    func test_execute_withVerticalAlignment_returnsSmallSubContentSpacing() {
        // GIVEN
        let alignment = SegmentedGaugeAlignment.vertical

        let expectedLayout = SegmentedGaugeLayout(
            contentSpacing: self.theme.layout.spacing.small,
            subContentSpacing: self.theme.layout.spacing.small,
            segmentsSpacing: self.theme.layout.spacing.small
        )

        // WHEN
        let result = self.useCase.execute(theme: self.theme, alignment: alignment)

        // THEN
        XCTAssertEqual(result, expectedLayout)
    }
}
