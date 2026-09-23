//
//  RatingInputConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class RatingInputConfiguration: ComponentConfiguration {

    // MARK: - UIKit Properties Only

    var uiKitRating: Double = 0

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
        self.accessibilityValue.showConfiguration = true
    }

    // MARK: - Getter

    func getInfoValue(from value: Double) -> String {
        "Current Rating: " + (NumberFormatter.shared.string(for: value) ?? "")
    }
}

// MARK: - Extension

private extension NumberFormatter {

    static let shared: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}
