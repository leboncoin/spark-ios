//
//  SwitchConfigurationSnapshotTests.swift
//  SparkComponentSwitchSnapshotTests
//
//  Created by robin.lemaire on 09/10/2024.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentSwitch
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
import XCTest

struct SwitchConfigurationSnapshotTests {

    // MARK: - Type Alias

    typealias SwitchAttributedStringEither = Either<NSAttributedString, AttributedString>
    private typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    let scenario: SwitchScenarioSnapshotTests

    let intent: SwitchIntent
    let value: SwitchValue
    let status: SwitchStatus
    let alignment: SwitchAlignment
    let isIcon: Bool
    let content: SwitchContentResilience

    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Initialization

    init(
        scenario: SwitchScenarioSnapshotTests,
        intent: SwitchIntent,
        value: SwitchValue,
        status: SwitchStatus,
        alignment: SwitchAlignment,
        isIcon: Bool,
        content: SwitchContentResilience,
        modes: [ComponentSnapshotTestMode] = Constants.Modes.default,
        sizes: [UIContentSizeCategory] = Constants.Sizes.default
    ) {
        self.scenario = scenario
        self.intent = intent
        self.value = value
        self.status = status
        self.alignment = alignment
        self.isIcon = isIcon
        self.content = content
        self.modes = modes
        self.sizes = sizes
    }

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(intent)",
            "\(value)" + "Value",
            "\(status)" + "Status",
            "\(alignment)" + "Alignment",
            isIcon ? "withIcon" : "withoutIcon",
            "\(content)" + "Content"
        ].joined(separator: "-")
    }
}

// MARK: - Enum

enum SwitchValue: String, CaseIterable {
    case activated
    case deactivated

    var isOn: Bool {
        switch self {
        case .activated: true
        case .deactivated: false
        }
    }
}

enum SwitchStatus: String, CaseIterable {
    case enabled
    case disabled

    var isEnabled: Bool {
        switch self {
        case .enabled: true
        case .disabled: false
        }
    }
}

enum SwitchContentResilience: String, CaseIterable {
    case withoutLabel
    case shortLabel
    case multilineLabel
    case attributedLabel

    var text: String? {
        switch self {
        case .withoutLabel: nil
        case .shortLabel: "My switch"
        case .multilineLabel: "My switch. Lorem ipsum dolor.\nConsectetur adipiscing elit.\nProin vel metus pretium."
        case .attributedLabel: nil
        }
    }

    func attributedLabel(isSwiftUIComponent: Bool) -> SwitchConfigurationSnapshotTests.SwitchAttributedStringEither? {
        switch self {
        case .attributedLabel:
            let text = "My Attributed Switch"
            return isSwiftUIComponent ? .right(AttributedString(text)) : .left(.init(string: text))
        default: return nil
        }
    }
}
