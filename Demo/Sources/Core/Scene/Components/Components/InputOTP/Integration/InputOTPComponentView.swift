//
//  InputOTPComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 09/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkComponentInputOTP

// MARK: - View

typealias InputOTPComponentView = ComponentViewable<
    InputOTPConfiguration,
    InputOTPImplementationView,
    InputOTPConfigurationView,
    InputOTPExtraTools
>

extension InputOTPComponentView {
    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct InputOTPImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<InputOTPConfiguration>
    @State private var value: String = ""
    @State private var showCompletionAlert: Bool = false

    // MARK: - Initialization

    init(configuration: Binding<InputOTPConfiguration>) {
        self.configuration = configuration
    }

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkInputOTPDigits(self.configurationWrapped.digits)
            .sparkInputOTPCodeType(self.configurationWrapped.codeType)
            .sparkInputOTPOnError(self.configurationWrapped.onError)
            .demoDisabled(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
            .alert("Completion", isPresented: self.$showCompletionAlert) {
                Button("OK") {
                    self.showCompletionAlert = false
                }
            } message: {
                Text("OTP code completed: \(self.value)")
            }
    }

    @ViewBuilder
    private func component() -> some View {
        if self.configurationWrapped.isCompletion {
            SparkInputOTP(value: self.$value) { completedValue in
                self.showCompletionAlert = true
            }
        } else {
            SparkInputOTP(value: self.$value)
        }
    }
}
