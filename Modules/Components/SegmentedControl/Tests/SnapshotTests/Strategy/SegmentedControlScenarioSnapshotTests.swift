//
//  SegmentedControlScenarioSnapshotTests.swift
//  SparkComponentSegmentedControlSnapshotTests
//
//  Created by robin.lemaire on 25/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum SegmentedControlScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [SegmentedControlConfigurationSnapshotTests] {
        return switch self {
        case .test1: self.test1()
        case .test2: self.test2()
        case .test3: self.test3()
        case .test4: self.test4()
        case .documentation: self.documentation()
        }
    }

    // MARK: - Scenarios

    /// **Test 1**
    ///
    /// Description: To test all items count.
    ///
    private func test1() -> [SegmentedControlConfigurationSnapshotTests] {
        let items = SegmentedControlItems.allCases

        return items.map { item in
            .init(
                scenario: self,
                items: item
            )
        }
    }

    /// **Test 2**
    ///
    /// Description: To test all content types.
    ///
    private func test2() -> [SegmentedControlConfigurationSnapshotTests] {
        let contentTypes = SegmentedControlContentType.allCases

        return contentTypes.map { contentType in
            .init(
                scenario: self,
                contentType: contentType
            )
        }
    }

    /// **Test 3**
    ///
    /// Description: To test a11y sizes.
    ///
    private func test3() -> [SegmentedControlConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                sizes: Constants.Sizes.all
            )
        ]
    }

    /// **Test 4**
    ///
    /// Description: To test modes.
    ///
    private func test4() -> [SegmentedControlConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                modes: Constants.Modes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [SegmentedControlConfigurationSnapshotTests] {
        var items: [SegmentedControlConfigurationSnapshotTests] = []

        // All content types with documentationName
        let contentTypes = SegmentedControlContentType.allCases
        items.append(contentsOf: contentTypes.map { contentType in
            SegmentedControlConfigurationSnapshotTests(
                scenario: self,
                contentType: contentType,
                documentationName: contentType.documentationName
            )
        })

        // Some items with documentationName
        let segmentItems = SegmentedControlItems.allCases.filter { $0.documentationName != nil }
        items.append(contentsOf: segmentItems.map { item in
            SegmentedControlConfigurationSnapshotTests(
                scenario: self,
                items: item,
                documentationName: item.documentationName
            )
        })

        return items
    }
}
