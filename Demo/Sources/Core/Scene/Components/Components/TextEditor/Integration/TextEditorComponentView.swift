//
//  TextEditorComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: Maj le theme hors de l'init

// MARK: - View

typealias TextEditorComponentView = ComponentViewable<TextEditorConfiguration, TextEditorImplementationView, TextEditorConfigurationView, TextEditorExtraTools>

extension TextEditorComponentView {

    init() {
        self.init(style: .alone, styles: [.alone, .horizontalContent])
    }
}

// MARK: - Subview

struct TextEditorImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TextEditorConfiguration>
    @State private var text: String = ""

    private var textForFormField: Binding<String>? // Only used by the FormField demo

    // MARK: - Initialization

    init(configuration: Binding<TextEditorConfiguration>) {
        self.configuration = configuration
        self.textForFormField = nil
    }

    // Only used by the FormField demo
    init(configuration: Binding<TextEditorConfiguration>, text: Binding<String>) {
        self.configuration = configuration
        self.textForFormField = text
    }

    // MARK: - View

    var body: some View {
        SparkTextEditor(
            self.configurationWrapped.placeholder,
            text: self.textForFormField ?? self.$text,
            theme: self.configurationWrapped.theme.value
        )
        .sparkTextEditorIntent(self.configurationWrapped.intent)
        .sparkTextEditorReadOnly(self.configurationWrapped.swiftUIIsReadOnly)
        .demoDisabled(self.configurationWrapped)
        .demoAccessibilityLabel(self.configurationWrapped)
        .demoAccessibilityValue(self.configurationWrapped)
        .demoAccessibilityHint(self.configurationWrapped)
        .demoFrame(self.configurationWrapped)
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func demoAccessibilityLabel(_ configuration: TextEditorConfiguration) -> some View {
        if let value = configuration.accessibilityLabel.value.nilIfEmpty {
            self.sparkTextEditorAccessibilityLabel(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func demoAccessibilityValue(_ configuration: TextEditorConfiguration) -> some View {
        if let value = configuration.accessibilityValue.value.nilIfEmpty {
            self.sparkTextEditorAccessibilityValue(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func demoAccessibilityHint(_ configuration: TextEditorConfiguration) -> some View {
        if let value = configuration.accessibilityHint.value.nilIfEmpty {
            self.sparkTextEditorAccessibilityHint(value)
        } else {
            self
        }
    }
}
