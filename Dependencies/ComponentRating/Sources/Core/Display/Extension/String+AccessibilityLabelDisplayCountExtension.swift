//
//  String+AccessibilityLabelDisplayCountExtension.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 10/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension String {

    // MARK: - Methods

    static func accessibilityLabelDisplayCount(text: String?) -> String? {
        guard let text else {
            return nil
        }

        let stringKey = String(localized: "accessiiblity_label_display_count", bundle: .current)
        return String(
            format: stringKey,
            text
        )
    }
}
