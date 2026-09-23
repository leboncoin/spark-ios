//
//  RatingDisplayConfigurationSnapshotTests.swift
//  SparkComponentRatingDisplayTests
//
//  Created by robin.lemaire on 12/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentRating
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import XCTest

struct RatingDisplayConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: RatingDisplayScenarioSnapshotTests

    var size: RatingDisplaySize = .default
    var stars: RatingDisplayStars = .default
    var content: RatingDisplayContent = .default
    var contentType: RatingDisplayContentType = .default
    var value: RatingValues = .default

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.stars)" + "Stars",
            "\(self.size)" + "Size",
            "ValueIs" + self.value.formattedValue,
            "\(self.content)" + "Content",
            "\(self.contentType)" + "ContentType"
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "rating_display_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum RatingDisplayContent: String, CaseIterable {
    case none
    case value
    case valueAndCount
    case valueAndAdditional
    case allValues

    static var `default` = Self.none

    var documentationName: String? {
        switch self {
        case .none: nil
        case .value: nil
        case .valueAndCount: "value_and_count"
        case .valueAndAdditional: "value_and_additional"
        case .allValues: "all"
        }
    }
}

enum RatingDisplayContentType: String, CaseIterable {
    case text
    case custom

    static var `default` = Self.text

    var documentationName: String {
        switch self {
        case .text: "text"
        case .custom: "label"
        }
    }
}
