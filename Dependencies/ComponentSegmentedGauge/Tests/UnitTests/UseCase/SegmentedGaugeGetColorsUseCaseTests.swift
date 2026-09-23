//
//  SegmentedGaugeGetColorsUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import Foundation
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

final class SegmentedGaugeGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = SegmentedGaugeGetColorsUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute_withVeryHighOrHighType_returnsSuccessColors() {
        // GIVEN
        let types: [SegmentedGaugeType] = [.veryHigh, .high]
        let expectedColors = self.expectedColors(
            plainColor: self.theme.colors.feedback.success
        )

        // WHEN - THEN
        for type in types {
            for segments in SegmentedGaugeSegments.allCases {
                let result = self.useCase.execute(
                    theme: self.theme,
                    type: type,
                    segments: segments
                )

                self.assert(result, equals: expectedColors, expectedOpacity: 1)
            }
        }
    }

    func test_execute_withMediumThreeSegments_returnsSuccessColors() {
        // GIVEN
        let expectedColors = self.expectedColors(
            plainColor: self.theme.colors.feedback.success
        )

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            type: .medium,
            segments: .three
        )

        // THEN
        self.assert(result, equals: expectedColors, expectedOpacity: 1)
    }

    func test_execute_withMediumFiveSegments_returnsNeutralColors() {
        // GIVEN
        let expectedColors = self.expectedColors(
            plainColor: self.theme.colors.feedback.neutral
        )

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            type: .medium,
            segments: .five
        )

        // THEN
        self.assert(result, equals: expectedColors, expectedOpacity: 1)
    }

    func test_execute_withLowType_returnsAlertColors() {
        // GIVEN
        let expectedColors = self.expectedColors(
            plainColor: self.theme.colors.feedback.alert
        )

        // WHEN - THEN
        for segments in SegmentedGaugeSegments.allCases {
            let result = self.useCase.execute(
                theme: self.theme,
                type: .low,
                segments: segments
            )

            self.assert(result, equals: expectedColors, expectedOpacity: 1)
        }
    }

    func test_execute_withVeryLowType_returnsErrorColors() {
        // GIVEN
        let expectedColors = self.expectedColors(
            plainColor: self.theme.colors.feedback.error
        )

        // WHEN - THEN
        for segments in SegmentedGaugeSegments.allCases {
            let result = self.useCase.execute(
                theme: self.theme,
                type: .veryLow,
                segments: segments
            )

            self.assert(result, equals: expectedColors, expectedOpacity: 1)
        }
    }

    func test_execute_withNoDataType_returnsSurfaceColors() {
        // GIVEN
        let expectedColors = self.expectedColors(
            plainColor: self.theme.colors.base.surface
        )

        // WHEN - THEN
        for segments in SegmentedGaugeSegments.allCases {
            let result = self.useCase.execute(
                theme: self.theme,
                type: .noData,
                segments: segments
            )

            self.assert(result, equals: expectedColors, expectedOpacity: 1)
        }
    }

    func test_execute_withCustomType_returnsProvidedColor() {
        // GIVEN
        let customColor = ColorTokenGeneratedMock.blue()
        let expectedColors = self.expectedColors(plainColor: customColor)
        let type = SegmentedGaugeType.custom(
            level: 2,
            colorToken: customColor,
            dim: 0
        )

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            type: type,
            segments: .five
        )

        // THEN
        self.assert(result, equals: expectedColors, expectedOpacity: 1)
    }

    func test_execute_withCustomTypeAndPositiveDim_returnsProvidedOpacity() {
        // GIVEN
        let customColor = ColorTokenGeneratedMock.orange()
        let dim: CGFloat = 0.4
        let expectedColors = self.expectedColors(
            plainColor: customColor,
            plainOpacity: dim
        )
        let type = SegmentedGaugeType.custom(
            level: 1,
            colorToken: customColor,
            dim: dim
        )

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            type: type,
            segments: .three
        )

        // THEN
        self.assert(result, equals: expectedColors, expectedOpacity: dim)
    }

    // MARK: - Helpers

    private func expectedColors(
        plainColor: any ColorToken,
        plainOpacity: CGFloat = 1.0
    ) -> SegmentedGaugeColors {
        return SegmentedGaugeColors(
            plainSegmentBackground: plainColor,
            otherSegmentBackground: self.theme.colors.base.surface,
            plainSegmentBorder: plainColor,
            otherSegmentBorder: self.theme.colors.base.outline,
            markerOuterBackground: plainColor,
            markerInnerBackground: self.theme.colors.base.surface,
            plainSegmentOpacity: plainOpacity
        )
    }

    private func assert(
        _ result: SegmentedGaugeColors,
        equals expectedColors: SegmentedGaugeColors,
        expectedOpacity: CGFloat,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(result, expectedColors, file: file, line: line)
        XCTAssertEqual(result.plainSegmentOpacity, expectedOpacity, file: file, line: line)
    }
}
