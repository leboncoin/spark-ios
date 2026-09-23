//
//  SegmentedGaugeGetLevelsUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

final class SegmentedGaugeGetLevelsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = SegmentedGaugeGetLevelsUseCase()

    // MARK: - Three Segment Tests

    func test_execute_threeSegment_veryHighType_returnsLevel3() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.veryHigh

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 3, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_threeSegment_highType_returnsLevel3() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.high

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 3, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_threeSegment_mediumType_returnsLevel3() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.medium

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 3, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_threeSegment_lowType_returnsLevel2() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.low

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 2, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_threeSegment_veryLowType_returnsLevel1() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.veryLow

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 1, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_threeSegment_noDataType_returnsLevel0() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let type = SegmentedGaugeType.noData

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 0, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_threeSegment_customType_validLevel_returnsCustomLevel() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: 2, colorToken: colorToken, dim: 1)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 2, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_threeSegment_customType_levelTooHigh_returnsMaxLevel() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: 5, colorToken: colorToken, dim: 0.4)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 3, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_threeSegment_customType_levelTooLow_returnsZero() {
        // GIVEN
        let segments = SegmentedGaugeSegments.three
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: -1, colorToken: colorToken, dim: 0.1)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 0, levels: 3)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    // MARK: - Five Segment Tests

    func test_execute_fiveSegment_veryHighType_returnsLevel5() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.veryHigh

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 5, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_fiveSegment_highType_returnsLevel4() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.high

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 4, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_fiveSegment_mediumType_returnsLevel3() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.medium

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 3, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_fiveSegment_lowType_returnsLevel2() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.low

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 2, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_fiveSegment_veryLowType_returnsLevel1() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.veryLow

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 1, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_fiveSegment_noDataType_returnsLevel0() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let type = SegmentedGaugeType.noData

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 0, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_fiveSegment_customType_validLevel_returnsCustomLevel() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: 4, colorToken: colorToken, dim: 0.4)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 4, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_fiveSegment_customType_levelTooHigh_returnsMaxLevel() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: 8, colorToken: colorToken, dim: 0.4)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 5, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }

    func test_execute_fiveSegment_customType_levelTooLow_returnsZero() {
        // GIVEN
        let segments = SegmentedGaugeSegments.five
        let colorToken = ColorTokenGeneratedMock.blue()
        let type = SegmentedGaugeType.custom(level: -2, colorToken: colorToken, dim: 0.4)

        let expectedLevels = SegmentedGaugeLevels(currentLevel: 0, levels: 5)

        // WHEN
        let result = self.useCase.execute(segments: segments, type: type)

        // THEN
        XCTAssertEqual(result, expectedLevels)
    }
}
