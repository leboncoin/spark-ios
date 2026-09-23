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

    var intent: BadgeIntent = .default
    var size: BadgeSize = .default
    var isValue: Bool = Bool.random()
    var value: Int = Int.random(in: 1...100)
    var unit: String = ""
    var isBorder: Bool = true
    var isAttached: Bool = false
    var position: BadgePosition = .random

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.size = .random
        self.isValue = .random()
        self.isBorder = .random()
    }
}
