//
//  String+AccessibilityValueExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

extension String {

    // MARK: - Methods

    static func accessibilityValue(isSelected: Bool) -> String {
        return String(
            localized: isSelected ? "accessibility_value_selected" : "accessibility_value_not_selected",
            bundle: .current
        )
    }
}
