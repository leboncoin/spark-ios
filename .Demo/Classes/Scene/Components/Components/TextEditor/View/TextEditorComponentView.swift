//
//  TextEditorComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias TextEditorComponentView = ComponentViewable<TextEditorConfiguration, TextEditorImplementationView, TextEditorConfigurationView>

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

    // MARK: - View

    var body: some View {
        TextEditorView(
            self.configurationWrapped.placeholder,
            text: self.$text,
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent
        )
        .demoDisabled(self.configurationWrapped)
        .demoAccessibilityLabel(self.configurationWrapped)
        .demoFrame(self.configurationWrapped)
    }
}

struct TextEditorConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<TextEditorConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: TextEditorImplementationView.self,
            itemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: TextEditorIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                TextFieldConfigurationView(
                    name: "placeholder",
                    text: self.configuration.placeholder
                )
            }
        )
    }
}

// MARK: - Preview

struct TextEditorComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorComponentView()
    }
}
