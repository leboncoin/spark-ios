//
//  BadgeConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class BadgeConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: BadgeIntentType = .random
    var size: BadgeSize = .random
    var value: Int = Int.random(in: 1...100)
    var format: BadgeFormat = .default
    var overflowValue = 99
    var customText = "My custom text"
    var isBorderVisible: Bool = .random()

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }
}
