//
//  FormfieldConfigurationSnapshotTests.swift
//  SparkCoreSnapshotTests
//
//  Created by alican.aycil on 08.04.24.
//  Copyright © 2024 Adevinta. All rights reserved.
//

import UIKit

@testable import SparkCore

struct FormfieldConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: FormfieldScenarioSnapshotTests
    let feedbackState: FormFieldFeedbackState
    let component: FormfieldComponentType
    let label: String?
    let helperMessage: String?
    let isRequired: Bool
    let isEnabled: Bool
    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.feedbackState)",
            "IsRequired:\(self.isRequired)",
            "IsEnabled:\(self.isRequired)",
            "\(self.component.rawValue)"
        ].joined(separator: "-")
    }
}

enum FormfieldComponentType: String, CaseIterable {
    case singleCheckbox
    case checkboxGroup
    case singleRadioButton
    case radioButtonGroup
}
