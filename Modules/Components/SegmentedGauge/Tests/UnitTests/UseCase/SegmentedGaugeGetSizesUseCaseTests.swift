//
//  SegmentedGaugeGetSizesUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import Foundation
@testable import SparkComponentSegmentedGauge

final class SegmentedGaugeGetSizesUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = SegmentedGaugeGetSizesUseCase()

    // MARK: - Tests

    func test_execute_smallSize_returnsCorrectSizes() {
        // GIVEN
        let size = SegmentedGaugeSize.small
        let expectedSizes = SegmentedGaugeSizes(
            segmentSize: CGSize(width: 24, height: 8),
            markerInnerSize: 6,
            markerOuterSize: 12
        )

        // WHEN
        let result = useCase.execute(size: size)

        // THEN
        XCTAssertEqual(result, expectedSizes)
    }

    func test_execute_mediumSize_returnsCorrectSizes() {
        // GIVEN
        let size = SegmentedGaugeSize.medium
        let expectedSizes = SegmentedGaugeSizes(
            segmentSize: CGSize(width: 34, height: 12),
            markerInnerSize: 8,
            markerOuterSize: 16
        )

        // WHEN
        let result = useCase.execute(size: size)

        // THEN
        XCTAssertEqual(result, expectedSizes)
    }
}
