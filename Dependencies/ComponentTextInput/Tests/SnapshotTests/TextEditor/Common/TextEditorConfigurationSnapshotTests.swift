//
//  TextEditorConfigurationSnapshotTests.swift
//  SparkTextEditorSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
import XCTest

struct TextEditorConfigurationSnapshotTests {

    // MARK: - Type Alias

    private typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    let scenario: TextEditorScenarioSnapshotTests

    let intent: TextEditorIntent

    let state: TextInputState
    let content: TextInputContentResilience
    let placeholder: TextInputPlaceholder
    let height: TextEditorHeight
    let isFocused: Bool

    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Initialization

    init(
        scenario: TextEditorScenarioSnapshotTests,
        intent: TextEditorIntent,
        state: TextInputState,
        content: TextInputContentResilience,
        placeholder: TextInputPlaceholder,
        height: TextEditorHeight,
        isFocused: Bool,
        modes: [ComponentSnapshotTestMode] = Constants.Modes.default,
        sizes: [UIContentSizeCategory] = Constants.Sizes.default
    ) {
        self.scenario = scenario
        self.intent = intent
        self.state = state
        self.content = content
        self.placeholder = placeholder
        self.height = height
        self.isFocused = isFocused
        self.modes = modes
        self.sizes = sizes
    }

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.intent)",
            "\(self.state)" + "State",
            "\(self.content)" + "Content",
            "\(self.placeholder)" + "Placeholder",
            "\(self.height)" + "Height",
            self.isFocused ? "isFocused" : nil
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }
}

// MARK: - Enum

enum TextEditorHeight: String, CaseIterable {
    case flexible
    case fixed

    var value: CGFloat? {
        switch self {
        case .flexible: nil
        case .fixed: TextEditorSnapshotConstants.fixedHeight
        }
    }

    var isFixed: Bool {
        switch self {
        case .flexible: false
        case .fixed: true
        }
    }

    var isScrollEnabled: Bool {
        switch self {
        case .flexible: true
        case .fixed: false
        }
    }
}
