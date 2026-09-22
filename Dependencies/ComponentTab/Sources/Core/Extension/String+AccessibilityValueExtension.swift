//
//  String+AccessibilityLabelExtension.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 10/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

extension String {

    // MARK: - Methods

    static func accessibilityLabel(
        index: Int,
        count: Int
    ) -> String {
        let stringKey = String(localized: "accessibility_value", bundle: .current)
        return String(
            format: stringKey,
            index + 1,
            count
        )
    }
}
