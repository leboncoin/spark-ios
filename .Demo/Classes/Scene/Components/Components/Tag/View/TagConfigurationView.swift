//
//  TagConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct TagConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<TagConfiguration>
    var uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TagUIView, TagConfiguration>? = nil

    // MARK: - Initialization

    init(configuration: Binding<TagConfiguration>) {
        self.configuration = configuration
    }

    init(configuration: Binding<TagConfiguration>, uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TagUIView, TagConfiguration>) {
        self.configuration = configuration
        self.uiKitComponentImplementationView = uiKitComponentImplementationView
    }

    // MARK: - View

    var body: some View {
        // TODO: gérer SwiftUI (componentViewType) et UIKit (componentView)
        ComponentConfigurationView(
            configuration: self.configuration,
            componentView: self.uiKitComponentImplementationView!,
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
