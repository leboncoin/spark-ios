//
//  AccessibilityLargeContentTextEnvironmentValues.swift
//  SparkCommon
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

public extension EnvironmentValues {
    @Entry var accessibilityLargeContentText: String?
}

public extension View {

    /// Set the **accessibilityLargeContentText** on some Spark component.
    /// The text will be displayed on the **largeContent** view.
    ///
    /// The default value for this property is *nil*.
    func sparkAccessibilityLargeContentText(_ text: String) -> some View {
        self.environment(\.accessibilityLargeContentText, text)
    }
}
