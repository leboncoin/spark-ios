//
//  String+AccessibilityValueExtension.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 09/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension String {

    // MARK: - Methods

    static func accessibilityValue(
        rating: Double,
        numberOfStars: Int
    ) -> String {
        let stringKey = String(localized: "accessibility_value", bundle: .current)
        return String(
            format: stringKey,
            NumberFormatter.shared.string(for: rating) ?? "\(rating)",
            numberOfStars
        )
    }
}
