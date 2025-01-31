//
//  CheckboxConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation

class CheckboxConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: CheckboxIntent = .random
    var alignment: CheckboxAlignment = .random
    var text = "My Checkbox"
    var checkedIcon: Iconography = .random
    var isIndeterminate: Bool = .random()

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }
}
