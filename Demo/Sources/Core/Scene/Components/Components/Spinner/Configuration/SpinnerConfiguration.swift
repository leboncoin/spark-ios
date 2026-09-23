//
//  SpinnerConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class SpinnerConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: SpinnerDemoIntent = .default
    var intentCustomColorToken: ColorTokens = .random
    var size: SpinnerSize = .default

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.size = .random
    }
}
