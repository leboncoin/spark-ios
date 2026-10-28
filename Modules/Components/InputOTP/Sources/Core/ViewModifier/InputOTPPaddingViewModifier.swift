//
//  InputOTPPaddingViewModifier.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct InputOTPPaddingViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content.sparkPadding(self.theme.layout.padding)
    }
}

extension View {

    func inputOTPPadding() -> some View {
        self.modifier(InputOTPPaddingViewModifier())
    }
}
