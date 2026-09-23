//
//  SegmentedGaugeScenarioSnapshotTests.swift
//  SparkComponentSegmentedGaugeSnapshotTests
//
//  Created by robin.lemaire on 29/30/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkComponentSegmentedGaugeTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum SegmentedGaugeScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5

    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [SegmentedGaugeConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
        case .test5:
            return self.test5()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: Test all alignments
    ///
    /// Content:
    ///  - alignment: all
    ///  - content: default
    ///  - withMarker: default
    ///  - segments: default
    ///  - size: default
    ///  - type: default
    ///  - mode: default
    ///  - size: all
    private func test1() -> [SegmentedGaugeConfigurationSnapshotTests] {
        let alignments = SegmentedGaugeAlignment.allCases

        return alignments.map { alignment in
                .init(
                    scenario: self,
                    alignment: alignment,
                    sizes: Constants.Sizes.all
                )
        }
    }

    /// Test 2
    ///
    /// Description: Test all segments and all withMarker
    ///
    /// Content:
    ///  - alignment: default
    ///  - content: default
    ///  - withMarker: all
    ///  - segments: all
    ///  - size: default
    ///  - type: default
    ///  - mode: default
    ///  - size: default
    private func test2() -> [SegmentedGaugeConfigurationSnapshotTests] {
        let segments = SegmentedGaugeSegments.allCases
        let withMarkers = Bool.allCases

        return segments.flatMap { segments in
            withMarkers.map { withMarker in
                    .init(
                        scenario: self,
                        withMarker: withMarker,
                        segments: segments
                    )
            }
        }
    }

    /// Test 3
    ///
    /// Description: Test all sizes
    ///
    /// Content:
    ///  - alignment: default
    ///  - content: default
    ///  - withMarker: default
    ///  - segments: default
    ///  - size: all
    ///  - type: default
    ///  - mode: default
    ///  - size: default
    private func test3() -> [SegmentedGaugeConfigurationSnapshotTests] {
        let sizes = SegmentedGaugeSize.allCases

        return sizes.map { size in
                .init(
                    scenario: self,
                    size: size,
                    sizes: Constants.Sizes.all
                )
        }
    }

    /// Test 4
    ///
    /// Description: Test all type and withMarker and all modes
    ///
    /// Content:
    ///  - alignment: default
    ///  - content: default
    ///  - withMarker: true
    ///  - segments: all
    ///  - size: default
    ///  - type: all
    ///  - mode: all
    ///  - size: default
    private func test4() -> [SegmentedGaugeConfigurationSnapshotTests] {
        let types = SegmentedGaugeTestingType.allCases

        return types.map { type in
                .init(
                    scenario: self,
                    withMarker: true,
                    type: type,
                    modes: Constants.Modes.all
                )
        }
    }

    /// Test 5
    ///
    /// Description: Test all segments and all withMarker
    ///
    /// Content:
    ///  - alignment: default
    ///  - content: all
    ///  - withMarker: default
    ///  - segments: default
    ///  - size: default
    ///  - type: default
    ///  - mode: default
    ///  - size: default
    private func test5() -> [SegmentedGaugeConfigurationSnapshotTests] {
        let titles = SegmentedGaugeTitle.allCases
        let descriptions = SegmentedGaugeDescription.allCases

        return titles.flatMap { title in
            descriptions.map { description in
                    .init(
                        scenario: self,
                        title: title,
                        description: description
                    )
            }
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [SegmentedGaugeConfigurationSnapshotTests] {
        var items: [SegmentedGaugeConfigurationSnapshotTests] = []

        // All content
        items.append(.init(
            scenario: self,
            withMarker: false,
            title: .text,
            description: .text,
            documentationName: "all"
        ))

        // All label content
        items.append(.init(
            scenario: self,
            withMarker: false,
            title: .other,
            description: .other,
            documentationName: "all_label"
        ))

        // Description only
        items.append(.init(
            scenario: self,
            withMarker: false,
            title: .withoutText,
            description: .text,
            documentationName: "description"
        ))

        // Description label only
        items.append(.init(
            scenario: self,
            withMarker: false,
            title: .withoutText,
            description: .other,
            documentationName: "description_label"
        ))

        // Segments
        for segments in SegmentedGaugeSegments.allCases {
            items.append(.init(
                scenario: self,
                withMarker: false,
                segments: segments,
                documentationName: "segments_\(segments)"
            ))
        }

        // Size
        for size in SegmentedGaugeSize.allCases {
            items.append(.init(
                scenario: self,
                size: size,
                documentationName: "size_\(size)"
            ))
        }

        // Marker
        items.append(.init(
            scenario: self,
            withMarker: true,
            documentationName: "marker"
        ))

        return items
    }
}
