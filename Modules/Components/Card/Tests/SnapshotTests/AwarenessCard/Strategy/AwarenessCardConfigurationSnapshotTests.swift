//
//  AwarenessCardConfigurationSnapshotTests.swift
//  SparkComponentCardSnapshotTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct AwarenessCardConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: AwarenessCardScenarioSnapshotTests

    var intent: CardIntent = .default
    var content: AwarenessCardCardContent = .default
    var contentType: AwarenessCardCardContentType = .default
    var isIcon: Bool = true
    var isAction: Bool = true

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.intent)" + "Intent",
            "\(self.content)" + "Content",
            "\(self.contentType)" + "ContentType",
            self.isIcon ? "withIcon" : nil,
            self.isAction ? "withAction" : nil
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "awareness_card_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum AwarenessCardCardContent: String, CaseIterable {
    case title
    case description
    case all

    static var `default` = Self.all
}

enum AwarenessCardCardContentType: String, CaseIterable {
    case native
    case custom

    static var `default` = Self.native
}
