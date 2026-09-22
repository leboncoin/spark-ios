//
//  SegmentedGaugeGetSizesUseCase.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedGaugeGetSizesUseCaseable {
    func execute(size: SegmentedGaugeSize) -> SegmentedGaugeSizes
}

final class SegmentedGaugeGetSizesUseCase: SegmentedGaugeGetSizesUseCaseable {

    // MARK: - Methods

    func execute(size: SegmentedGaugeSize) -> SegmentedGaugeSizes {
        return switch size {
        case .small:
                .init(
                    segmentSize: .init(width: 24, height: 8),
                    markerInnerSize: 6,
                    markerOuterSize: 12
                )

        case .medium:
                .init(
                    segmentSize: .init(width: 34, height: 12),
                    markerInnerSize: 8,
                    markerOuterSize: 16
                )
        }
    }
}
