//
//  InputOTPSlotContentViewModifier.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct InputOTPSlotContentViewModifier: ViewModifier {

    // MARK: - Properties

    let value: String?
    let onError: Bool
    let isFocus: Bool

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .font(self.theme.typography.content)
            .foregroundStyle(self.theme.colors.slotContent(
                value: self.value,
                onError: self.onError,
                isFocus: self.isFocus
            ))
    }
}

extension View {

    func inputOTPSlotContent(value: String?, onError: Bool, isFocus: Bool) -> some View {
        self.modifier(InputOTPSlotContentViewModifier(value: value, onError: onError, isFocus: isFocus))
    }
}
