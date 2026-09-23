//
//  View+ButtonPressedStyleExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 29/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

extension View {

    @ViewBuilder
    func buttonPressedStyle(_ value: Binding<Bool>) -> some View {
        self.buttonStyle(PressedButtonStyle(isPressed: value))
    }
}
