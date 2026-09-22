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

    var intent: TextFieldIntent = .default
    var placeholder: String = "My placeholder"
    var isSecure: Bool = false
    var isReadOnly = false
    var leftViewContentType: TextFieldSideViewContentType = .random
    var rightViewContentType: TextFieldSideViewContentType = .random

    var leftAddonContentType: TextFieldSideViewContentType = .random
    var isLeftAddonPadding: Bool = .random()
    var isLeftAddonSeparator: Bool = false
    var rightAddonContentType: TextFieldSideViewContentType = .random
    var isRightAddonPadding: Bool = .random()
    var isRightAddonSeparator: Bool = false

    // MARK: - SwiftUI Properties Only

    var swiftUIContentType: TextFieldContentType = .text
    var swiftUIClearButtonMode: TextFieldClearMode = .random

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
        self.accessibilityValue.showConfiguration = true
        self.accessibilityHint.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.leftViewContentType = .random
        self.rightViewContentType = .random
        self.leftAddonContentType = .random
        self.isLeftAddonPadding = .random()
        self.rightAddonContentType = .random
        self.isRightAddonPadding = .random()
        self.swiftUIClearButtonMode = .random
        self.uiKitLeftViewMode = .random
        self.uiKitRightViewMode = .random
        self.uiKitClearButtonMode = .random
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
