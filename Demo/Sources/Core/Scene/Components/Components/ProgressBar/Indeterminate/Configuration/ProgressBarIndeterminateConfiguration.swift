//
//  ProgressBarIndeterminateConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class ProgressBarIndeterminateConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: ProgressBarIntent = .default
    var shape: ProgressBarShape = .default
    var isAnimating: Bool = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.shape = .random
    }
}
