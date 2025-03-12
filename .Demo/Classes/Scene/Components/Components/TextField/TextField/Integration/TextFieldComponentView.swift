//
//  TextFieldComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias TextFieldComponentView = ComponentViewable<TextFieldConfiguration, TextFieldImplementationView, TextFieldConfigurationView>

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

    private var textForFormField: Binding<String>? // Only used by the FormField demo

    // MARK: - Initialization

    init(configuration: Binding<TextFieldConfiguration>) {
        self.configuration = configuration
        self.textForFormField = nil
    }

    // Only used by the FormField demo
    init(configuration: Binding<TextFieldConfiguration>, textForFormField: Binding<String>) {
        self.configuration = configuration
        self.textForFormField = textForFormField
    }

    // MARK: - View

    var body: some View {
        TextFieldView(
            LocalizedStringKey(self.configurationWrapped.placeholder),
            text: self.textForFormField ?? self.$text,
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            type: TextFieldViewTypeHelper.getType(from: self.configurationWrapped),
            isReadOnly: self.configurationWrapped.isReadOnly,
            leftView: {
                TextFieldSideView(
                    theme: self.configurationWrapped.theme,
                    sideViewContent: self.configurationWrapped.leftViewContentType,
                    side: .left
                )
            },
            rightView: {
                TextFieldSideView(
                    theme: self.configurationWrapped.theme,
                    sideViewContent: self.configurationWrapped.rightViewContentType,
                    side: .right
                )
            }
        )
        .demoDisabled(self.configurationWrapped)
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

// MARK: - Preview

struct TextFieldComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldComponentView()
    }
}
