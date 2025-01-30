//
//  TextFieldConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation
import SwiftUI

class TextFieldConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: TextFieldIntent = .random
    var placeholder: String = "My placeholder"
    var isSecure: Bool = false
    var isReadOnly = false
    var leftViewContentType: TextFieldSideViewContentType = .random
    var rightViewContentType: TextFieldSideViewContentType = .random

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }
}
