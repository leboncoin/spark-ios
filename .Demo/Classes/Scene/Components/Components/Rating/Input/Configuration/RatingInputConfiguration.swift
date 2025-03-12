//
//  RatingInputConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class RatingInputConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: RatingIntent = .random

    // MARK: - UIKit Properties Only

    var uiKitRating: CGFloat = CGFloat.random(in: 1...5)

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Getter

    func getInfoValue(from value: CGFloat) -> String {
        "Current Rating: \(String(format: "%1.f", value))"
    }
}
