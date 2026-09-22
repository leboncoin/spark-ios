//
//  View+ColorTokenExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

public extension View {

    /// Set a **background** color on View from a Spark **ColorToken**.
    /// - Parameters:
    ///   - color: the color token.
    func background(_ color: (any ColorToken)?) -> some View {
        self.background(color?.color)
    }

    /// Set a **foregroundStyle** color on View from a Spark **ColorToken**.
    /// - Parameters:
    ///   - color: the color token.
    func foregroundStyle(_ color: any ColorToken) -> some View {
        self.foregroundStyle(color.color)
    }

    /// Set a **overlay** color on View from a Spark **ColorToken**.
    /// - Parameters:
    ///   - color: the color token.
    func overlay(_ color: (any ColorToken)?) -> some View {
        self.overlay(color?.color)
    }

    /// Set a **tint** color on View from a Spark **ColorToken**.
    /// - Parameters:
    ///   - color: the color token.
    func tint(_ color: (any ColorToken)?) -> some View {
        self.tint(color?.color)
    }
}
