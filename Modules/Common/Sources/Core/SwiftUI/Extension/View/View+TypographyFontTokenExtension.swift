//
//  View+TypographyFontTokenExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

public extension View {

    /// Set a **font**  on View from a Spark **TypographyFontToken**.
    /// - Parameters:
    ///   - typography: the typography token.
    func font(_ typography: (any TypographyFontToken)?) -> some View {
        self.font(typography?.font)
    }
}
