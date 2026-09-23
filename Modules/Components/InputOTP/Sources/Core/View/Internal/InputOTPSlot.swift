//
//  InputOTPSlot.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

struct InputOTPSlot: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    private let value: String?
    private let onError: Bool
    private let isFocus: Bool
    private let typographies: InputOTPTypographies

    @StateObject private var viewModel = InputOTPSlotViewModel()

    // MARK: - Initialization

    init(
        value: String?,
        onError: Bool,
        isFocus: Bool,
        typographies: InputOTPTypographies
    ) {
        self.value = value
        self.onError = onError
        self.isFocus = isFocus
        self.typographies = typographies
    }

    // MARK: - View

    var body: some View {
        ZStack {
            Rectangle()
                .fill(self.viewModel.colors.backgroundColorToken)
                .sparkBorder(
                    width: self.viewModel.border.width,
                    radius: self.viewModel.border.radius,
                    colorToken: self.viewModel.colors.borderColorToken
                )
                .sparkFrame(
                    width: InputOTPConstants.Size.width,
                    height: InputOTPConstants.Size.height
                )

            Text(self.viewModel.content)
                .font(self.typographies.contentFontToken)
                .foregroundStyle(self.viewModel.colors.contentColorToken)
        }
        .onAppear {
            self.viewModel.setup(
                theme: self.theme.value,
                value: self.value,
                onError: self.onError,
                isFocus: self.isFocus
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.value) { value in
            self.viewModel.value = value
        }
        .onChange(of: self.onError) { onError in
            self.viewModel.onError = onError
        }
        .onChange(of: self.isFocus) { isFocus in
            self.viewModel.isFocus = isFocus
        }
    }
}
