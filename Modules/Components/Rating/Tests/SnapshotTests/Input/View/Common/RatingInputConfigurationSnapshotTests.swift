//
//  RatingInputConfigurationSnapshotTests.swift
//  SparkComponentRatingInputTests
//
//  Created by robin.lemaire on 12/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentRating
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import XCTest

struct RatingInputConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: RatingInputScenarioSnapshotTests

    var isDisabled: Bool = false
    var value: RatingValues = .default

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "ValueIs" + self.value.formattedValue,
            self.isDisabled ? "isDisabled" : nil
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "rating_input_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}
