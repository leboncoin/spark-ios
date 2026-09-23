//
//  TextFieldComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

// TODO: Maj le theme hors de l'init

import SwiftUI

// MARK: - View

typealias TextFieldComponentView = ComponentViewable<TextFieldConfiguration, TextFieldImplementationView, TextFieldConfigurationView, TextFieldExtraTools>

extension TextFieldComponentView {

    init() {
        self.init(style: .alone, styles: [.alone, .horizontalContent])
    }
}

// MARK: - Subview

struct TextFieldImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TextFieldConfiguration>
    @State private var text: String = ""
    @State private var value: Double = 0

    private var textForFormField: Binding<String>? // Only used by the FormField demo

    let numberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.generatesDecimalNumbers = true
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.groupingSize = 3
        return numberFormatter
    }()

    // MARK: - Initialization

    init(configuration: Binding<TextFieldConfiguration>) {
        self.configuration = configuration
        self.textForFormField = nil
    }

    // Only used by the FormField demo
    init(configuration: Binding<TextFieldConfiguration>, text: Binding<String>) {
        self.configuration = configuration
        self.textForFormField = text
    }

    // MARK: - View

    var body: some View {
        VStack {
            switch self.configurationWrapped.swiftUIContentType {
            case .text:
                SparkTextField(
                    LocalizedStringKey(self.configurationWrapped.placeholder),
                    text: self.textForFormField ?? self.$text,
                    theme: self.configurationWrapped.theme.value,
                    leftView: { self.leftView() },
                    rightView: { self.rightView() },
                    leftAddon: { self.leftAddon() },
                    rightAddon: { self.rightAddon() }
                )

            case .number:
                SparkTextField(
                    LocalizedStringKey(self.configurationWrapped.placeholder),
                    value: self.$value,
                    format: .number,
                    theme: self.configurationWrapped.theme.value,
                    leftView: { self.leftView() },
                    rightView: { self.rightView() },
                    leftAddon: { self.leftAddon() },
                    rightAddon: { self.rightAddon() }
                )

            case .formattedNumber:
                SparkTextField(
                    LocalizedStringKey(self.configurationWrapped.placeholder),
                    value: self.$value,
                    formatter: self.numberFormatter,
                    theme: self.configurationWrapped.theme.value,
                    leftView: { self.leftView() },
                    rightView: { self.rightView() },
                    leftAddon: { self.leftAddon() },
                    rightAddon: { self.rightAddon() }
                )

            case .currency:
                SparkTextField(
                    LocalizedStringKey(self.configurationWrapped.placeholder),
                    value: self.$value,
                    format: .currency(code: "EUR"),
                    theme: self.configurationWrapped.theme.value,
                    leftView: { self.leftView() },
                    rightView: { self.rightView() },
                    leftAddon: { self.leftAddon() },
                    rightAddon: { self.rightAddon() }
                )
            }
        }
        .sparkTextFieldIntent(self.configurationWrapped.intent)
        .sparkTextFieldReadOnly(self.configurationWrapped.isReadOnly)
        .sparkTextFieldClearMode(
            self.configurationWrapped.swiftUIClearButtonMode,
            customAction: self.configurationWrapped.swiftUIContentType.isText ? nil : {
                self.value = 0
            }
        )
        .sparkTextFieldSecureEntry(self.configurationWrapped.isSecure)
        .sparkTextFieldLeftAddonConfiguration(
            hasPadding: self.configurationWrapped.isLeftAddonPadding,
            hasSeparator: self.configurationWrapped.isLeftAddonSeparator
        )
        .sparkTextFieldRightAddonConfiguration(
            hasPadding: self.configurationWrapped.isRightAddonPadding,
            hasSeparator: self.configurationWrapped.isRightAddonSeparator
        )
        .demoDisabled(self.configurationWrapped)
        .demoAccessibilityLabel(self.configurationWrapped)
        .demoAccessibilityValue(self.configurationWrapped)
        .demoAccessibilityHint(self.configurationWrapped)
    }

    // MARK: - Subview

    @ViewBuilder
    func leftView() -> some View {
        TextFieldSideView(
            theme: self.configurationWrapped.theme,
            sideViewContent: self.configurationWrapped.leftViewContentType,
            side: .left
        )
    }

    @ViewBuilder
    func rightView() -> some View {
        TextFieldSideView(
            theme: self.configurationWrapped.theme,
            sideViewContent: self.configurationWrapped.rightViewContentType,
            side: .right
        )
    }

    @ViewBuilder
    func leftAddon() -> some View {
        TextFieldSideView(
            theme: self.configurationWrapped.theme,
            sideViewContent: self.configurationWrapped.leftAddonContentType,
            side: .left,
            isAddon: true
        )
    }

    @ViewBuilder
    func rightAddon() -> some View {
        TextFieldSideView(
            theme: self.configurationWrapped.theme,
            sideViewContent: self.configurationWrapped.rightAddonContentType,
            side: .right,
            isAddon: true
        )
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func demoAccessibilityLabel(_ configuration: TextFieldConfiguration) -> some View {
        if let value = configuration.accessibilityLabel.value.nilIfEmpty {
            self.sparkTextFieldAccessibilityLabel(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func demoAccessibilityValue(_ configuration: TextFieldConfiguration) -> some View {
        if let value = configuration.accessibilityValue.value.nilIfEmpty {
            self.sparkTextFieldAccessibilityValue(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func demoAccessibilityHint(_ configuration: TextFieldConfiguration) -> some View {
        if let value = configuration.accessibilityHint.value.nilIfEmpty {
            self.sparkTextFieldAccessibilityHint(value)
        } else {
            self
        }
    }
}
