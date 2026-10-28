//
//  InputOTPSeparatorViewModifier.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct InputOTPSeparatorViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .foregroundStyle(self.theme.colors.separator)
            .sparkFrame(
                width: self.theme.size.separatorWidth,
                height: self.theme.size.separatorHeight
            )
    }
}

extension View {

    func inputOTPSeparator() -> some View {
        self.modifier(InputOTPSeparatorViewModifier())
    }
}
