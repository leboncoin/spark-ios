//
//  SegmentedGaugeGetSizesUseCaseTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentSegmentedGauge

@Suite("SegmentedGauge Get Sizes UseCase Tests")
struct SegmentedGaugeGetSizesUseCaseTests {

    // MARK: - Properties

    private let useCase = SegmentedGaugeGetSizesUseCase()

    // MARK: - Tests

    @Test("Execute small size returns correct sizes")
    func executeSmallSizeReturnsCorrectSizes() {
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
        #expect(result == expectedSizes)
    }

    @Test("Execute medium size returns correct sizes")
    func executeMediumSizeReturnsCorrectSizes() {
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
        #expect(result == expectedSizes)
    }
}
