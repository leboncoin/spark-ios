//
//  ButtonConfigurationSnapshotTests.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 17/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct ButtonConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: ButtonScenarioSnapshotTests

    var appearance: ButtonAppearance?
    var intent: ButtonIntent = .default
    var variant: ButtonVariant = .default
    var shape: ButtonShape = .default
    var size: ButtonSize = .default
    var alignment: ButtonAlignment = .default
    var titleType: ButtonContentType = .default
    var iconType: ButtonContentType = .default
    var contentVisibility: ButtonContentVisibility = .default
    var removeStyles: Bool = false
    var isInfiniteWidth: Bool = false
    var isDisabled: Bool = false

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        let styles = if let appearance {
            ["\(appearance)" + "Appearance"]
        } else {
            [
                "\(self.intent)" + "Intent",
                "\(self.variant)" + "Variant"
            ]
        }

        let parts: [String] = styles + [
            "\(self.shape)" + "Shape",
            "\(self.size)" + "Size",
            "\(self.alignment)" + "Alignment",
            self.iconType.name(for: "Icon"),
            self.titleType.name(for: "Title"),
            "\(self.contentVisibility)" + "contentVisibility",
            self.removeStyles ? "withoutStyles" : nil,
            self.isInfiniteWidth ? "infiniteWidth" : nil,
            self.isDisabled ? "disabled" : nil
        ].compactMap { $0 }

        return parts
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "button_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum ButtonContentType: String, CaseIterable {
    case native
    case custom
    case none

    static var `default` = Self.native

    func name(for value: String) -> String? {
        switch self {
        case .native: value
        case .custom: value + "Custom"
        case .none: nil
        }
    }
}
