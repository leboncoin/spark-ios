//
//  View+AccessibilityExtension.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 01/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    @ViewBuilder
    func accessibilityOptionalLabel(_ value: String?) -> some View {
        if let value {
            self.accessibilityLabel(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func accessibilityOptionalHint(_ value: String?) -> some View {
        if let value {
            self.accessibilityHint(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func accessibilityOptionalValue(_ value: String?) -> some View {
        if let value {
            self.accessibilityValue(value)
        } else {
            self
        }
    }
}
