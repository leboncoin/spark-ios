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

    var intent: TextEditorIntent = .random
    var placeholder = "My placeholder"

    // MARK: - UIKit Properties Only

    var uiKitIsEditable: Bool = .random()
    var uiKitIsScrollEnabled: Bool = .random()

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.height.showConfiguration = true
        self.height.maxText = "80" // Default value
        self.accessibilityLabel.showConfiguration = true
    }
}
