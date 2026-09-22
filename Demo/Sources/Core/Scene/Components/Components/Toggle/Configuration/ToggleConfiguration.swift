//
//  ToggleConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class ToggleConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var text = "My Toggle"

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false
    var swiftUISecondText = "is amazing"

    // MARK: - UIKit Properties Only

    var uiKitIsOn: Bool = true
    var uiKitIsAttributedText = false
    var uiKitIsAnimated: Bool = true

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.swiftUIWidth.showConfiguration = true

        self.uiKitControlType.showConfiguration = true
        self.uiKitControlType.cases = ComponentControlType.classic
        self.uiKitControlType.value = nil

        self.accessibilityLabel.showConfiguration = true
    }
}
