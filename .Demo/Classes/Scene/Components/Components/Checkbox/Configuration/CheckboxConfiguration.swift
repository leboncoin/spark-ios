//
//  CheckboxConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class CheckboxConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: CheckboxIntent = .random
    var alignment: CheckboxAlignment = .random
    var text = "My Checkbox"
    var checkedIcon: Iconography = .random
    var isIndeterminate: Bool = .random()

    // MARK: - UIKit Properties Only

    var uiKitSelectionState: CheckboxSelectionState = .unselected
    var uiKitIsAttributedText: Bool = .random()

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
        self.isEnabled.showConfiguration = true
    }

    // MARK: - Getter

    func getInfoValue(from selectionState: CheckboxSelectionState) -> String {
        return "Selection state : \(selectionState)"
    }
}
