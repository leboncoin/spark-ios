//
//  RatingInputConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation

class RatingInputConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: RatingIntent = .random

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }
}
