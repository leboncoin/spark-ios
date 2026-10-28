//
//  InputOTPOpacityViewModifier.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct InputOTPOpacityViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled

    // MARK: - View

    func body(content: Content) -> some View {
        content.opacity(self.theme.opacity.value(isEnabled: self.isEnabled))
    }
}

extension View {

    func inputOTPOpacity() -> some View {
        self.modifier(InputOTPOpacityViewModifier())
    }
}
