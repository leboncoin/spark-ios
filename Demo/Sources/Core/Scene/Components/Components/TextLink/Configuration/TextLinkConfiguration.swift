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

    var intent: TextLinkDemoIntent = .default
    var intentCustomColorToken: ColorTokens = .random
    var variant: TextLinkVariant = .default
    var typography: TextLinkTypography = .default
    var alignment: TextLinkAlignment = .default
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
        self.uiKitControlType.cases = ComponentControlType.classic

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Getter

    func getText() -> String {
        self.isLongText ? Constants.Long.text : self.text
    }

    func getTextHighlightRange() -> NSRange? {
        self.isLongText ? Constants.Long.textHighlightRange : nil
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.variant = .random
        self.typography = .body1
        self.alignment = .random
        self.icon = .optionalRandom
        self.swiftUITextAlignment = .random
        self.uiKitTextAlignment = .random
        self.uiKitLineBreakMode = .random
    }
}
