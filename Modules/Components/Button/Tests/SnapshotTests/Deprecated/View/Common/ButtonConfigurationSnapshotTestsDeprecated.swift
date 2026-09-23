//
//  ButtonConfigurationSnapshotTestsDeprecated.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// MARK: - Deprecated

/// This file is deprecated and should not be used for new tests.

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
import XCTest

struct ButtonConfigurationSnapshotTestsDeprecated {

    // MARK: - Type Alias

    private typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    let scenario: ButtonScenarioSnapshotTestsDeprecated

    let appearance: ButtonAppearance?
    let intent: ButtonIntent
    let alignment: ButtonAlignment
    let shape: ButtonShape
    let size: ButtonSize
    let variant: ButtonVariant

    let content: ButtonContentTypeDeprecated
    let state: ControlState

    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Initialization

    init(
        scenario: ButtonScenarioSnapshotTestsDeprecated,
        appearance: ButtonAppearance? = nil,
        intent: ButtonIntent = .main,
        alignment: ButtonAlignment = .leadingImage,
        shape: ButtonShape = .default,
        size: ButtonSize = .medium,
        variant: ButtonVariant = .filled,
        content: ButtonContentTypeDeprecated = .title("My Title"),
        state: ControlState = .normal,
        modes: [ComponentSnapshotTestMode] = Constants.Modes.default,
        sizes: [UIContentSizeCategory] = Constants.Sizes.default
    ) {
        self.scenario = scenario
        self.appearance = appearance
        self.intent = intent
        self.alignment = alignment
        self.shape = shape
        self.size = size
        self.variant = variant
        self.content = content
        self.state = state
        self.modes = modes
        self.sizes = sizes
    }

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            self.appearance.map { "\($0)" + "Appearance" },
            "\(self.intent)",
            "\(self.alignment)" + "Alignment",
            "\(self.shape)" + "Shape",
            "\(self.size)" + "Size",
            "\(self.variant)" + "Variant",
            "\(self.content.name)" + "Content",
            "\(self.state)" + "State"
        ].compactMap { $0 }.joined(separator: "-")
    }
}

// MARK: - Enum

enum ButtonContentTypeDeprecated {
    case title(_ value: String)
    case attributedTitle(_ value: AttributedStringEither)
    case titleAndImage(_ value: String, _ image: ImageEither)
    case attributedTitleAndImage(_ value: AttributedStringEither, _ image: ImageEither)

    // MARK: - Properties

    var name: String {
        switch self {
        case .title:
            return "title"
        case .attributedTitle:
            return "attributedTitle"
        case .titleAndImage:
            return "titleAndImage"
        case .attributedTitleAndImage:
            return "attributedTitleAndImage"
        }
    }

    // MARK: - All Cases

    static func allCases(attributedTitle: AttributedStringEither, image: ImageEither) -> [Self] {
        let title = "My title"
        return [
            .title(title),
            .attributedTitle(attributedTitle),
            .titleAndImage(title, image),
            .attributedTitleAndImage(attributedTitle, image)
        ]
    }
}
