//
//  TagComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 14/04/2023.
//  Copyright © 2023 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias TagComponentView = ComponentViewable<TagConfiguration, TagImplementationView, TagConfigurationView>

// MARK: - Subview

struct TagImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TagConfiguration>

    // MARK: - View

    var body: some View {
        TagView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            variant: self.configurationWrapped.variant
        )
        .demoText(self.configurationWrapped)
        .demoIcon(self.configurationWrapped)
        .demoAccessibilityLabel(self.configurationWrapped)
        .demoBackground(self.configurationWrapped)
    }
}

struct TagConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<TagConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: TagImplementationView.self,
            mainItemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: TagIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "variant",
                    values: TagVariant.allCases,
                    selectedValue: self.configuration.variant
                )

                OptionalEnumConfigurationView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.icon
                )

                TextFieldConfigurationView(
                    name: "text",
                    text: self.configuration.text
                )

                ToggleConfigurationView(
                    name: "is attributed text",
                    isOn: self.configuration.isAttributedText
                )
            }
        )
    }
}

// MARK: - Extension

private extension TagView {

    func demoIcon(_ configuration: TagConfiguration) -> Self {
        if let icon = configuration.icon {
            return self.iconImage(Image(icon: icon))
        } else {
            return self
        }
    }

    func demoText(_ configuration: TagConfiguration) -> Self {
        let text = configuration.text
        if text.isEmpty {
            return self.text(nil)
        } else if configuration.isAttributedText {
            return self.attributedText(text.demoAttributedString)
        } else {
            return self.text(text)
        }
    }

    func demoAccessibilityLabel(_ configuration: TagConfiguration) -> some View {
        let label = configuration.accessibilityLabel.value
        return self.accessibility(
            identifier: "Tag Identifier",
            label: label.isEmpty ? nil : label
        )
    }
}

// MARK: - Preview

struct TagComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TagComponentView()
    }
}
