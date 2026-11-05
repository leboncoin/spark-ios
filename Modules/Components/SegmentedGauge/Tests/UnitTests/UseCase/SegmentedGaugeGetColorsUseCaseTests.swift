//
//  SegmentedGaugeGetColorsUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

@Suite("SegmentedGauge Get Colors UseCase Tests")
struct SegmentedGaugeGetColorsUseCaseTests {

    // MARK: - Properties

    private let useCase = SegmentedGaugeGetColorsUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute with very high or high type returns success colors")
    func executeWithVeryHighOrHighTypeReturnsSuccessColors() {
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

    @Test("Execute with medium three segments returns success colors")
    func executeWithMediumThreeSegmentsReturnsSuccessColors() {
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

    @Test("Execute with medium five segments returns neutral colors")
    func executeWithMediumFiveSegmentsReturnsNeutralColors() {
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

    @Test("Execute with low type returns alert colors")
    func executeWithLowTypeReturnsAlertColors() {
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

    @Test("Execute with very low type returns error colors")
    func executeWithVeryLowTypeReturnsErrorColors() {
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

    @Test("Execute with no data type returns surface colors")
    func executeWithNoDataTypeReturnsSurfaceColors() {
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

    @Test("Execute with custom type returns provided color")
    func executeWithCustomTypeReturnsProvidedColor() {
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

    @Test("Execute with custom type and positive dim returns provided opacity")
    func executeWithCustomTypeAndPositiveDimReturnsProvidedOpacity() {
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
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        #expect(result == expectedColors, sourceLocation: sourceLocation)
        #expect(result.plainSegmentOpacity == expectedOpacity, sourceLocation: sourceLocation)
    }
}
