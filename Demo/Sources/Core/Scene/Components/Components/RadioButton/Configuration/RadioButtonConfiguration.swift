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

    var intent: RadioButtonIntent = .default
    var text = "My RadioButton"
    var isAnimated: Bool = true

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false
    var swiftUISecondText = "is amazing"

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedText = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true

        self.isEnabled.showConfiguration = true

        self.uiKitIsSelected.showConfiguration = true
        self.uiKitIsSelected.value = false

        self.uiKitControlType.showConfiguration = true
        self.uiKitControlType.cases = ComponentControlType.classic
        self.uiKitControlType.value = nil

        self.swiftUIWidth.showConfiguration = true
    }

    // MARK: - Getter

    func getInfoValue(from selectedID: Int?) -> String {
        if let selectedID {
            return "Selected ID : \(selectedID)"
        } else {
            return "No selection"
        }
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
    }
}
