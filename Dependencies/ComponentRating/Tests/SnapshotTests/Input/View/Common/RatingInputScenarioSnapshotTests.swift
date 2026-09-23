//
//  RatingInputScenarioSnapshotTests.swift
//  SparkComponentRatingInputSnapshotTests
//
//  Created by robin.lemaire on 12/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentRating
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import UIKit
import SwiftUI

enum RatingInputScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case documentation

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration() -> [RatingInputConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test enabled/disabled & light/dark
    ///
    /// Content:
    ///  - enabled: all
    ///  - value : default
    ///  - mode : default
    ///  - size : default
    private func test1() -> [RatingInputConfigurationSnapshotTests] {
        let areDisabled = Bool.allCases

        return areDisabled.map { isDisabled in
                .init(
                    scenario: self,
                    isDisabled: isDisabled
                )
        }
    }

    /// Test 2
    ///
    /// Description: To test all values
    ///
    /// Content:
    ///  - enabled: default
    ///  - value : all
    ///  - mode : default
    ///  - size : default
    private func test2() -> [RatingInputConfigurationSnapshotTests] {
        let values = RatingValues.inputAllCases

        return values.map { value in
                .init(
                    scenario: self,
                    value: value
                )
        }
    }

    /// Test 3
    ///
    /// Description: To light/dark
    ///
    /// Content:
    ///  - enabled: default
    ///  - value : default
    ///  - mode : all
    ///  - size : default
    private func test3() -> [RatingInputConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                modes: Constants.Modes.all
            )
        ]
    }

    /// Test 4
    ///
    /// Description: To all a11y sizes
    ///
    /// Content:
    ///  - enabled: default
    ///  - value : default
    ///  - mode : default
    ///  - size : all
    private func test4() -> [RatingInputConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                sizes: Constants.Sizes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [RatingInputConfigurationSnapshotTests] {
        var items: [RatingInputConfigurationSnapshotTests] = []

        // Default
        items.append(.init(
            scenario: self,
            documentationName: "default"
        ))

        // Disabled
        items.append(.init(
            scenario: self,
            isDisabled: true,
            documentationName: "disabled"
        ))

        return items
    }
}
