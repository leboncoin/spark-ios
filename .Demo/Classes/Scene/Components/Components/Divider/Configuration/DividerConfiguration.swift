//
//  DividerConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class DividerConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: DividerIntent = .random
    var axis: DividerAxis = .random
    var alignment: DividerAlignment = .random
    var text: String = "Divider"

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }
}
