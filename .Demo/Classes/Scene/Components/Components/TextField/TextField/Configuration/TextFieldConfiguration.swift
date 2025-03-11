//
//  TextFieldConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
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

    // MARK: - UIKit Properties Only

    var uiKitLeftViewMode: UITextField.ViewMode = .random
    var uiKitRightViewMode: UITextField.ViewMode = .random
    var uiKitClearButtonMode: UITextField.ViewMode = .random

    // MARK: - Initialization

    required init() {
        super.init()

        self.uiKitControlType.value = .action

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }
}

// MARK: - Extension

extension UITextField.ViewMode: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public static var allCases: [Self] = [
        .never,
        .whileEditing,
        .unlessEditing,
        .always
    ]

    public var description: String {
        switch self {
        case .never: "Never"
        case .whileEditing: "While Editing"
        case .unlessEditing: "Unless Editing"
        case .always: "Always"
        @unknown default: ""
        }
    }
}
