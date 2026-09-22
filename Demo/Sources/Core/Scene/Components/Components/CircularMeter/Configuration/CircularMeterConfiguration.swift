//
//  CircularMeterConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

class CircularMeterConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: CircularMeterIntent = .default
    var size: CircularMeterSize = .default
    var value: Double = 0.33
    var displayType: CircularMeterDisplayType = .default
    var isCustomContent: Bool = false
    var valueText = "33%"
    var valueSecondText = "!"
    var contentText = "Label"
    var contentSecondText = "!"
    var icon: Iconography = .random

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Getter

    override func isInvertedBackground() -> Bool {
        false
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.size = .random
        self.value = Double.random(in: 0.0...1.0)
        self.displayType = .random
        self.icon = .random
    }
}
