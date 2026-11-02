//
//  InputOTPSlot.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

struct InputOTPSlot: View {

    // MARK: - Properties

    private let value: String?
    private let onError: Bool
    private let isFocus: Bool

    // MARK: - Initialization

    init(
        value: String?,
        onError: Bool,
        isFocus: Bool
    ) {
        self.value = value
        self.onError = onError
        self.isFocus = isFocus
    }

    // MARK: - View

    var body: some View {
        ZStack {
            Rectangle()
                .inputOTPSlotBackground(
                    value: self.value,
                    onError: self.onError,
                    isFocus: self.isFocus
                )

            Text(self.value.slotContent(isFocus: self.isFocus))
                .inputOTPSlotContent(
                    value: self.value,
                    onError: self.onError,
                    isFocus: self.isFocus
                )
                .optionalBlink(
                    isEnabled: self.isCursorDisplayed,
                    duration: InputOTPConstants.slotAnimationDuration
                )
        }
    }

    // MARK: - Getter

    private var isCursorDisplayed: Bool {
        self.isFocus && (self.value?.isEmpty ?? true)
    }
}
