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

    var intent: SpinnerIntent = .random
    var spinnerSize: SpinnerSize = .random

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }
}
