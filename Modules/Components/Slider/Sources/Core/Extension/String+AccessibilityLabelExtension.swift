//
//  String+AccessibilityLabelExtension.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 10/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

extension String {

    // MARK: - Methods

    static func accessibilityLabel(
        min: String,
        max: String
    ) -> String {
        let stringKey = String(localized: "accessibility_label_range_values", bundle: .current)
        return String(
            format: stringKey,
            min,
            max
        )
    }
}
