//
//  RadioButtonConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class RadioButtonConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: RadioButtonIntent = .random
    var labelAlignment: RadioButtonLabelAlignment = .random
    var text = "My RadioButton"

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedText: Bool = .random()

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true

        self.isEnabled.showConfiguration = true

        self.uiKitIsSelected.showConfiguration = true
        self.uiKitIsSelected.value = false
    }

    // MARK: - Getter

    func getInfoValue(from selectedID: Int?) -> String {
        if let selectedID {
            return "Selected ID : \(selectedID)"
        } else {
            return "No selection"
        }

    }
}
