//
//  SegmentedGaugeGetLabelsStyleUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

final class SegmentedGaugeGetLabelsStyleUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = SegmentedGaugeGetLabelsStyleUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute_returnsCorrectLabelsStyle() {
        // GIVEN
        let expectedStyle = SegmentedGaugeLabelsStyle(
            titleTypography: self.theme.typography.subhead,
            descriptionTypography: self.theme.typography.body2,
            color: self.theme.colors.base.onSurface
        )

        // WHEN
        let result = self.useCase.execute(theme: self.theme)

        // THEN
        XCTAssertEqual(result, expectedStyle)
    }
}
