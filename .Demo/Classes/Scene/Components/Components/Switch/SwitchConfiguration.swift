//
//  SwitchConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation

class SwitchConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: SwitchIntent = .random
    var alignment: SwitchAlignment = .random
    var text = "My Switch"
    var isAttributedText = false
    var hasImages: Bool = .random()

    // MARK: - Initialization

    required init() {
        super.init()

        self.width.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }
}
