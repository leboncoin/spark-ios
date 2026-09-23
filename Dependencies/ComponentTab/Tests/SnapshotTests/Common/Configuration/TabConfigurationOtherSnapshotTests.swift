//
//  TabConfigurationOtherSnapshotTests.swift
//  SparkComponentTabSnapshotTests
//
//  Created by robin.lemaire on 09/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentTab
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

// Used only for UIKit
struct TabConfigurationOtherSnapshotTests {

    // MARK: - Properties

    let scenario: TabScenarioOtherSnapshotTests

    var mainConfiguration: TabConfigurationSnapshotTests = .init(scenario: .test1)
    var operation: TabUIOperation
    var contentType: TabUIOperationContentType = .default
    var insertPosition: TabUIInsertPosition = .default
    var removePosition: TabUIRemovePosition = .default

    // MARK: - Name

    var name: String {
        var components: [String?] = [
            "\(self.operation)" + "Operation",
        ]

        // Specific operation details
        switch self.operation {
        case .addSegment:
            components.append("\(self.contentType)" + "ContentType")
        case .insertSegment:
            components.append("\(self.insertPosition)" + "Position")
            components.append("\(self.contentType)" + "ContentType")
        case .removeSegment:
            components.append("\(self.removePosition)" + "Position")
        }

        return components
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return "other" + self.scenario.rawValue.capitalized
    }
}

// MARK: - Enums

enum TabUIOperation: String, CaseIterable {
    case addSegment
    case insertSegment
    case removeSegment
}

enum TabUIOperationContentType: String, CaseIterable {
    case title
    case attributedTitle
    case image
    case model

    static var `default` = Self.title
}

enum TabUIInsertPosition: String, CaseIterable {
    case beginning
    case middle
    case end
    case beforeSelected
    case afterSelected

    static var `default` = Self.middle
}

enum TabUIRemovePosition: String, CaseIterable {
    case beginning
    case middle
    case end
    case selected
    case lastSelected
    case beforeSelected

    static var `default` = Self.middle
}
