//
//  SegmentedGaugeGetLayoutUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

@Suite("SegmentedGauge Get Layout UseCase Tests")
struct SegmentedGaugeGetLayoutUseCaseTests {

    // MARK: - Properties

    private let useCase = SegmentedGaugeGetLayoutUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute with horizontal alignment returns medium sub content spacing")
    func executeWithHorizontalAlignmentReturnsMediumSubContentSpacing() {
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
        #expect(result == expectedLayout)
    }

    @Test("Execute with vertical alignment returns small sub content spacing")
    func executeWithVerticalAlignmentReturnsSmallSubContentSpacing() {
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
        #expect(result == expectedLayout)
    }
}
