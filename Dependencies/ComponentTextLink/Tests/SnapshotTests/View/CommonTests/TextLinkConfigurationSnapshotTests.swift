//
//  TextLinkConfigurationSnapshotTests.swift
//  SparkComponentTextLinkSnapshotTests
//
//  Created by robin.lemaire on 28/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkComponentTextLinkTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct TextLinkConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: TextLinkScenarioSnapshotTests

    var alignment: TextLinkAlignment = .default
    var intent: TextLinkTestingIntent = .default
    var typography: TextLinkTypography = .default
    var variant: TextLinkVariant = .default
    var text: TextLinkText = .default
    var isImage = true
    var isRange = false
    var singleLine = false
    var textAlignment: TextLinkTextAlignment = .default

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.alignment)" + "Alignment",
            "\(self.intent)" + "Intent",
            "\(self.typography)" + "Typography",
            "\(self.variant)" + "Variant",
            "\(self.text)" + "Text",
            self.isRange ? "isHighlightRange" : nil,
            self.isImage ? "isImage" : nil,
            self.singleLine ? "singleline" : "multiline",
            "\(self.textAlignment)" + "TextAlignment"
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "textlink" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum TextLinkText: String, CaseIterable {
    case word
    case sentence

    static var `default` = Self.word

    var value: String {
        switch self {
        case .word: "Component"
        case .sentence: "My component\nwith many lines\nmany many lines"
        }
    }

    func highlightRange(isRange: Bool) -> NSRange? {
        guard isRange else { return nil }

        return switch self {
        case .word: .init(location: 0, length: 4)
        case .sentence: .init(location: 0, length: 12)
        }
    }
}

enum TextLinkTextAlignment: String, CaseIterable {
    case leading
    case trailing
    case center
    case `default`
}
