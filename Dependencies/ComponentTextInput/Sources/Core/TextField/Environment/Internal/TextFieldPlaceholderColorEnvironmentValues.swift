//
//  TextFieldPlaceholderColorEnvironmentValues.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 04/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

extension EnvironmentValues {
    @Entry var textFieldPlaceholderColor: Color? = .clear
}

extension View {

    func placeholderColor(_ token: (any ColorToken)?) -> some View {
        self.environment(\.textFieldPlaceholderColor, token?.color)
    }
}
