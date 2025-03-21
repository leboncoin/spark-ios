//
//  TextLinkConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 23/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

class TextLinkConfiguration: ComponentConfiguration {

    // MARK: - Constants

    enum Constants {
        enum Long {
            static let text = "By validating, I accept the terms and conditions and certify that my first and last names are the same as my civil state."
            static let textHighlightRange = NSRange(location: 28, length: 20)
        }
    }

    // MARK: - Properties

    var intent: TextLinkIntent = .random
    var variant: TextLinkVariant = .random
    var typography: TextLinkTypography = .body1
    var alignment: TextLinkAlignment = .random
    var numberOfLine = 0
    var text = "My TextLink"
    var isLongText = false
    var icon: Iconography? = .optionalRandom

    // MARK: - SwiftUI Properties Only

    var swiftUITextAlignment: TextAlignment = .random

    // MARK: - UIKit Properties Only

    var uiKitTextAlignment: NSTextAlignment = .random
    var uiKitLineBreakMode: NSLineBreakMode = .random

    // MARK: - Initialization

    required init() {
        super.init()

        self.uiKitControlType.showConfiguration = true

        self.accessibilityLabel.showConfiguration = true
        self.accessibilityValue.showConfiguration = true
    }

    // MARK: - Getter

    func getText() -> String {
        self.isLongText ? Constants.Long.text : self.text
    }

    func getTextHighlightRange() -> NSRange? {
        self.isLongText ? Constants.Long.textHighlightRange : nil
    }
}
