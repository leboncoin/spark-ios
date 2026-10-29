//
//  SegmentedGaugeGetLevelsUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

@Suite("SegmentedGauge Get Levels UseCase Tests")
struct SegmentedGaugeGetLevelsUseCaseTests {

    // MARK: - Properties

    private let useCase = SegmentedGaugeGetLevelsUseCase()

    // MARK: - Three Segment Tests

    @Test("Execute three segment very high type returns level3")
    func executeThreeSegmentVeryHighTypeReturnsLevel3() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.veryHigh

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 3, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute three segment high type returns level3")
    func executeThreeSegmentHighTypeReturnsLevel3() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.high

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 3, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute three segment medium type returns level3")
    func executeThreeSegmentMediumTypeReturnsLevel3() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.medium

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 3, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute three segment low type returns level2")
    func executeThreeSegmentLowTypeReturnsLevel2() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.low

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 2, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute three segment very low type returns level1")
    func executeThreeSegmentVeryLowTypeReturnsLevel1() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.veryLow

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 1, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute three segment no data type returns level0")
    func executeThreeSegmentNoDataTypeReturnsLevel0() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.noData

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 0, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute three segment custom type valid level returns custom level")
    func executeThreeSegmentCustomTypeValidLevelReturnsCustomLevel() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: 2, colorToken: colorToken, dim: 1)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 2, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute three segment custom type level too high returns max level")
    func executeThreeSegmentCustomTypeLevelTooHighReturnsMaxLevel() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: 5, colorToken: colorToken, dim: 0.4)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 3, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute three segment custom type level too low returns zero")
    func executeThreeSegmentCustomTypeLevelTooLowReturnsZero() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: -1, colorToken: colorToken, dim: 0.1)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 0, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    // MARK: - Five Segment Tests

    @Test("Execute five segment very high type returns level5")
    func executeFiveSegmentVeryHighTypeReturnsLevel5() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.veryHigh

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 5, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute five segment high type returns level4")
    func executeFiveSegmentHighTypeReturnsLevel4() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.high

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 4, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute five segment medium type returns level3")
    func executeFiveSegmentMediumTypeReturnsLevel3() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.medium

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 3, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute five segment low type returns level2")
    func executeFiveSegmentLowTypeReturnsLevel2() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.low

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 2, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute five segment very low type returns level1")
    func executeFiveSegmentVeryLowTypeReturnsLevel1() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.veryLow

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 1, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute five segment no data type returns level0")
    func executeFiveSegmentNoDataTypeReturnsLevel0() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.noData

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 0, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute five segment custom type valid level returns custom level")
    func executeFiveSegmentCustomTypeValidLevelReturnsCustomLevel() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: 4, colorToken: colorToken, dim: 0.4)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 4, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute five segment custom type level too high returns max level")
    func executeFiveSegmentCustomTypeLevelTooHighReturnsMaxLevel() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: 8, colorToken: colorToken, dim: 0.4)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 5, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }

    @Test("Execute five segment custom type level too low returns zero")
    func executeFiveSegmentCustomTypeLevelTooLowReturnsZero() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: -2, colorToken: colorToken, dim: 0.4)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 0, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        #expect(result == expectedLevels)
    }
}
