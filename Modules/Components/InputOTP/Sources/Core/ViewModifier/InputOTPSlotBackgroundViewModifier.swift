//
//  InputOTPSlotBackgroundViewModifier.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct InputOTPSlotBackgroundViewModifier: ViewModifier {

    // MARK: - Properties

    let value: String?
    let onError: Bool
    let isFocus: Bool

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .foregroundStyle(self.theme.colors.slotBackground(
                value: self.value,
                onError: self.onError,
                isFocus: self.isFocus
            ))
            .sparkBorder(
                width: self.theme.border.slotWidth(onError: self.onError, isFocus: self.isFocus),
                radius: self.theme.border.slotRadius,
                colorToken: self.theme.colors.slotBorder(onError: self.onError)
            )
            .sparkFrame(
                width: self.theme.size.slotWidth,
                height: self.theme.size.slotHeight
            )
    }
}

extension View {

    func inputOTPSlotBackground(value: String?, onError: Bool, isFocus: Bool) -> some View {
        self.modifier(InputOTPSlotBackgroundViewModifier(value: value, onError: onError, isFocus: isFocus))
    }
}
