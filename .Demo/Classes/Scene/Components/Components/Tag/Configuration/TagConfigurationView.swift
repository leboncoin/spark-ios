//
//  TagConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct TagConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias
    
    typealias ComponentUIView = TagUIView

    // MARK: - Properties

    var configuration: Binding<TagConfiguration>
    var uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TagUIView, TagConfiguration>? = nil

    // MARK: - Initialization

    init(configuration: Binding<TagConfiguration>) {
        self.configuration = configuration
    }

    init(
        configuration: Binding<TagConfiguration>,
        uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TagUIView, TagConfiguration>
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
                componentViewType: TagImplementationView.self,
                mainItemsView: { self.itemsView() }
            )
        }
    }

    @ViewBuilder
    private func itemsView() -> some View {
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
}
