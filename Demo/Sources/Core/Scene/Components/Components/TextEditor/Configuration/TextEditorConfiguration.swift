//
//  TextEditorConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

class TextEditorConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: TextEditorIntent = .default
    var placeholder = "My placeholder"

    // MARK: - SwiftUI Properties Only

    var swiftUIIsReadOnly: Bool = false

    // MARK: - UIKit Properties Only

    var uiKitIsEditable: Bool = false
    var uiKitIsScrollEnabled: Bool = true

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.height.showConfiguration = true
        self.height.maxText = "80" // Default value

        self.accessibilityLabel.showConfiguration = true
        self.accessibilityValue.showConfiguration = true
        self.accessibilityHint.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.swiftUIIsReadOnly = .random()
        self.uiKitIsEditable = .random()
        self.uiKitIsScrollEnabled = .random()
    }
}
