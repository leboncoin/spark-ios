//
//  IsEnabledModifier.swift
//  SparkCommon
//
//  Created by Michael Zimmermann on 03.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI

@_spi(SI_SPI) public struct IsEnabledModifier: ViewModifier {
    public let isEnabled: Bool
    public let action: (Bool) -> Void

    public func body(content: Content) -> some View {
        DispatchQueue.main.async {
            self.action(self.isEnabled)
        }

        return content.disabled(!self.isEnabled)
    }
}

@_spi(SI_SPI) public struct IsEnabledEnvironmentModifier: EnvironmentalModifier {
    public let action: (Bool) -> Void

    public func resolve(in environment: EnvironmentValues) -> IsEnabledModifier {
        return IsEnabledModifier(isEnabled: environment.isEnabled, action: action)
    }
}

@_spi(SI_SPI) public extension View {
    func isEnabledChanged(_ action: @escaping (Bool) -> Void) -> some View {
        self.modifier(IsEnabledEnvironmentModifier(action: action))
    }
}
