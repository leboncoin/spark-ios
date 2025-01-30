//
//  TextFieldComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias TextFieldComponentView = ComponentViewable<TextFieldConfiguration, TextFieldImplementationView, TextFieldConfigView>

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

    // MARK: - View

    var body: some View {
        TextFieldView(
            LocalizedStringKey(self.configurationWrapped.placeholder),
            text: self.$text,
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

struct TextFieldConfigView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<TextFieldConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: TextFieldImplementationView.self,
            itemsView: {
                TextFieldCommonConfigurationView(configuration: self.configuration)
            }
        )
    }
}

// MARK: - Preview

struct TextFieldComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldComponentView()
    }
}
