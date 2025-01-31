//
//  TextLinkComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 23/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// TODO: To fix :
// Check to migrate sizeCategory in TextLink to dynamicTypeSize.

// MARK: - View

typealias TextLinkComponentView = ComponentViewable<TextLinkConfiguration, TextLinkImplementationView, TextLinkConfigurationView>

// MARK: - Subview

struct TextLinkImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TextLinkConfiguration>
    @State private var showAlertAction = false

    // MARK: - View

    var body: some View {
        TextLinkView(
            theme: self.configuration.wrappedValue.theme.value,
            text: self.configuration.wrappedValue.getText(),
            textHighlightRange: self.configuration.wrappedValue.getTextHighlightRange(),
            intent: self.configuration.wrappedValue.intent,
            typography: self.configuration.wrappedValue.typography,
            variant: self.configuration.wrappedValue.variant,
            image: .init(icon: self.configuration.wrappedValue.icon),
            alignment: self.configuration.wrappedValue.alignment,
            action: {
                self.showAlertAction = true
            }
        )
        .multilineTextAlignment(self.configuration.wrappedValue.textAlignment)
        .lineLimit(self.configuration.wrappedValue.numberOfLine > 0 ? self.configuration.wrappedValue.numberOfLine : nil)
        .demoAccessibilityLabel(self.configuration.wrappedValue)
        .demoAccessibilityValue(self.configuration.wrappedValue)
        .alertAction("TextLink tap", showAlert: self.$showAlertAction)
    }
}

struct TextLinkConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<TextLinkConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: TextLinkImplementationView.self,
            mainItemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: TextLinkIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "variant",
                    values: TextLinkVariant.allCases,
                    selectedValue: self.configuration.variant
                )

                EnumConfigurationView(
                    name: "typography",
                    values: TextLinkTypography.allCases,
                    selectedValue: self.configuration.typography
                )

                OptionalEnumConfigurationView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.icon
                )

                ToggleConfigurationView(
                    name: "is long text",
                    isOn: self.configuration.isLongText
                )

                TextFieldConfigurationView(
                    name: "text",
                    text: self.configuration.text
                )

                EnumConfigurationView(
                    name: "alignment (content)",
                    values: TextLinkAlignment.allCases,
                    selectedValue: self.configuration.alignment
                )

                EnumConfigurationView(
                    name: "alignment (text)",
                    values: TextAlignment.allCases,
                    selectedValue: self.configuration.textAlignment
                )

                StepperConfigurationView(
                    name: "number of line",
                    value: self.configuration.numberOfLine,
                    bounds: 0...10,
                    step: 1
                )
            }
        )
    }
}

// MARK: - Preview

struct TextLinkComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TextLinkComponentView()
    }
}
