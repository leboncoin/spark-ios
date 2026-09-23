//
//  TextFieldAccessibilitySort.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 25/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

enum TextFieldAccessibilitySort: Double {
    case textField = 6
    case leftAddon = 5
    case leftView = 4
    case clearButton = 3
    case rightView = 2
    case rightAddon = 1
}

// MARK: - View

internal extension View {

    func accessibilitySort(_ sort: TextFieldAccessibilitySort) -> some View {
        self.accessibilitySortPriority(sort.rawValue)
    }
}
