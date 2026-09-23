//
//  ProgressBarConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class ProgressBarConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: ProgressBarIntent = .default
    var shape: ProgressBarShape = .default
    var value: Int = Int.random(in: 0...10) * 10
    var step: Int = 10

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
        self.accessibilityValue.showConfiguration = true
    }

    // MARK: - Getter

    func cgFloatValue() -> CGFloat {
        CGFloat(self.value) / 100
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.shape = .random
    }
}
