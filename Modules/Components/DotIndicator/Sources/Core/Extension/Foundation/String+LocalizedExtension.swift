//
//  String+LocalizedExtension.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension String {

    // MARK: - Accessibility Value

    static func accessibilityDotIndicatorValue(
        currentPage: Int,
        numberOfPages: Int
    ) -> String {
        return String(
            format: String(key: "accessibility_dot_indicator_value"),
            currentPage + 1,
            numberOfPages
        )
    }
}

// MARK: - Extension

private extension String {

    init(key: LocalizationValue) {
        self.init(localized: key, bundle: .current)
    }
}
