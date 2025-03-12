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

    var intent: IconIntent = .random
    var size: IconSize = .random
    var icon: Iconography = .random

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }
}
