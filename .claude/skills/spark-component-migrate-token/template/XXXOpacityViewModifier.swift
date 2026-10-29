//
//  XXXOpacityViewModifier.swift
//  SparkComponentXXX
//
//  Created by {Firstname Lastname} on DD/MM/YYYY.
//  Copyright © YYYY Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct XXXOpacityViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled

    // MARK: - View

    func body(content: Content) -> some View {
        content.opacity(self.theme.opacity.value(isEnabled: self.isEnabled))
    }
}

extension View {

    func xxxOpacity() -> some View {
        self.modifier(XXXOpacityViewModifier())
    }
}
