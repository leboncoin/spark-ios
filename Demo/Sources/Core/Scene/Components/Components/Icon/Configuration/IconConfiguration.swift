//
//  IconConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class IconConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: IconDemoIntent = .default
    var intentCustomColorToken: ColorTokens = .random
    var size: IconDemoSize = .default
    var sizeCustomValue = 10
    var icon: Iconography = .random

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.intentCustomColorToken = .random
        self.size = .random
        self.icon = .random
    }
}
