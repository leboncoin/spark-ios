//
//  TextLinkConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct TextLinkConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias ComponentUIView = TextLinkUIView

    // MARK: - Properties

    var configuration: Binding<TextLinkConfiguration>
    var uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TextLinkUIView, TextLinkConfiguration>? = nil

    // MARK: - Initialization

    init(configuration: Binding<TextLinkConfiguration>) {
        self.configuration = configuration
    }
    
    init(
        configuration: Binding<TextLinkConfiguration>,
        uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TextLinkUIView, TextLinkConfiguration>
    ) {
        self.configuration = configuration
        self.uiKitComponentImplementationView = uiKitComponentImplementationView
    }

    // MARK: - View

    var body: some View {
        if let uiKitComponentImplementationView {
            ComponentConfigurationView(
                configuration: self.configuration,
                componentView: uiKitComponentImplementationView,
                mainItemsView: { self.itemsView() }
            )
        } else {
            ComponentConfigurationView(
                configuration: self.configuration,
                componentViewType: TextLinkImplementationView.self,
                mainItemsView: { self.itemsView() }
            )
        }
    }

    @ViewBuilder
    private func itemsView() -> some View {
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

        if !self.configuration.wrappedValue.isLongText {
            TextFieldConfigurationView(
                name: "text",
                text: self.configuration.text
            )
        }

        EnumConfigurationView(
            name: "alignment (content)",
            values: TextLinkAlignment.allCases,
            selectedValue: self.configuration.alignment
        )

        if self.framework.isUIKit {
            EnumConfigurationView(
                name: "alignment (text)",
                values: NSTextAlignment.allCases,
                selectedValue: self.configuration.uiKitTextAlignment
            )
        } else {
            EnumConfigurationView(
                name: "alignment (text)",
                values: TextAlignment.allCases,
                selectedValue: self.configuration.swiftUITextAlignment
            )
        }

        StepperConfigurationView(
            name: "number of line",
            value: self.configuration.numberOfLine,
            bounds: 0...10,
            step: 1
        )

        if self.framework.isUIKit {
            EnumConfigurationView(
                name: "line break mode",
                values: NSLineBreakMode.allCases,
                selectedValue: self.configuration.uiKitLineBreakMode
            )
        }
    }
}
