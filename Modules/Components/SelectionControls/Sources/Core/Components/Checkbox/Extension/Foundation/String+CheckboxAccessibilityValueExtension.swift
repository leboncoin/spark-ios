//
//  String+CheckboxAccessibilityValueExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

extension String {

    // MARK: - Methods

    static func accessibilityValue(selectionState: CheckboxSelectionState) -> String {
        guard selectionState != .indeterminate else {
            return String(
                localized: "accessibility_value_indeterminate",
                bundle: .current
            )
        }

        return self.accessibilityValue(isSelected: selectionState == .selected)
    }
}
