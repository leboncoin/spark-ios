//
//  TextFieldAddonsComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias TextFieldAddonsComponentView = ComponentViewable<TextFieldAddonsConfiguration, TextFieldAddonsImplementationView, TextFieldAddonsConfigurationView>

extension TextFieldAddonsComponentView {

    init() {
        self.init(style: .alone, styles: [.alone, .horizontalContent])
    }
}

// MARK: - Subview

struct TextFieldAddonsImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TextFieldAddonsConfiguration>
    @State private var text: String = ""

    // MARK: - View

    var body: some View {
        TextFieldAddons(
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
            },
            leftAddon: {
                let content = TextFieldSideView(
                    theme: self.configurationWrapped.theme,
                    sideViewContent: self.configurationWrapped.leftAddonContentType,
                    side: .left,
                    isAddon: true
                )

                return TextFieldAddon(withPadding: self.configurationWrapped.isLeftAddonPadding) {
                    content
                }
            },
            rightAddon: {
                let content = TextFieldSideView(
                    theme: self.configurationWrapped.theme,
                    sideViewContent: self.configurationWrapped.rightAddonContentType,
                    side: .right,
                    isAddon: true
                )

                return TextFieldAddon(withPadding: self.configurationWrapped.isRightAddonPadding) {
                    content
                }
            }
        )
        .demoDisabled(self.configurationWrapped)
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

struct TextFieldAddonsConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<TextFieldAddonsConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: TextFieldAddonsImplementationView.self,
            mainItemsView: {
                TextFieldCommonConfigurationView(configuration: self.configuration)

                EnumConfigurationView(
                    name: "left addons",
                    values: TextFieldSideViewContentType.allCases,
                    selectedValue: self.configuration.leftAddonContentType
                )

                ToggleConfigurationView(
                    name: "is padding on left addons",
                    isOn: self.configuration.isLeftAddonPadding
                )

                EnumConfigurationView(
                    name: "right addons",
                    values: TextFieldSideViewContentType.allCases,
                    selectedValue: self.configuration.rightAddonContentType
                )

                ToggleConfigurationView(
                    name: "is padding on right addons",
                    isOn: self.configuration.isRightAddonPadding
                )
            }
        )
    }
}

// MARK: - Preview

struct TextFieldAddonsComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldAddonsComponentView()
    }
}
