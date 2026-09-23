//
//  CheckboxGroupConfigurationSnapshotTests.swift
//  SparkComponentCheckboxSnapshotTests
//
//  Created by alican.aycil on 16.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
@testable import SparkComponentCheckbox
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct CheckboxGroupConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: CheckboxGroupScenarioSnapshotTests
    let intent: CheckboxIntent
    let alignment: CheckboxAlignment
    let axis: CheckboxGroupLayout
    let items: [any CheckboxGroupItemProtocol]
    let image: UIImage
    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.intent)",
            "\(self.alignment)",
            "\(self.axis)",
            "\(self.items.count)Items"
        ].joined(separator: "-")
    }
}
