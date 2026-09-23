//
//  CheckboxConfigurationSnapshotTests.swift
//  SparkComponentCheckboxSnapshotTests
//
//  Created by alican.aycil on 16.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
@testable import SparkComponentCheckbox
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct CheckboxConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: CheckboxScenarioSnapshotTests
    let intent: CheckboxIntent
    let selectionState: CheckboxSelectionState
    let state: CheckboxState
    let alignment: CheckboxAlignment
    let textType: TextType
    let image: UIImage
    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.intent)",
            "\(self.selectionState)",
            "\(self.state)",
            "\(self.alignment)",
            "\(self.textType)"
        ].joined(separator: "-")
    }
}

enum CheckboxState: CaseIterable {
    case enabled
    case disabled
    case pressed
}

enum TextType: CaseIterable {
    case normal
    case long

    var value: String {
        switch self {
        case .normal:
            "Hello World"
        case .long:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        }
    }
}
