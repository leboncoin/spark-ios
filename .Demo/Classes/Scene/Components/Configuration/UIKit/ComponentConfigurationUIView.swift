//
//  ComponentConfigurationUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

// TODO: remove this class, add on ComponentConfigurationView the implementationViewRepresentable init

struct ComponentConfigurationUIView<
    ComponentView: UIView,
    Configuration: ComponentConfiguration
>: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<Configuration>
    private var implementationViewRepresentable: ComponentImplementationUIViewRepresentable<ComponentView, Configuration>

    // MARK: - Initialization

    init(configuration: Binding<Configuration>) {
        fatalError("Init without component is not authorized")
    }

    init(
        configuration: Binding<Configuration>,
        implementationViewRepresentable: ComponentImplementationUIViewRepresentable<ComponentView, Configuration>
    ) {
        self.configuration = configuration
        self.implementationViewRepresentable = implementationViewRepresentable
    }

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentView: self.implementationViewRepresentable,
            mainItemsView: {
//                EnumConfigurationView(
//                    name: "intent",
//                    values: TagIntent.allCases,
//                    selectedValue: self.configuration.intent
//                )
//
//                EnumConfigurationView(
//                    name: "variant",
//                    values: TagVariant.allCases,
//                    selectedValue: self.configuration.variant
//                )
//
//                OptionalEnumConfigurationView(
//                    name: "icon",
//                    values: Iconography.allCases,
//                    selectedValue: self.configuration.icon
//                )
//
//                TextFieldConfigurationView(
//                    name: "text",
//                    text: self.configuration.text
//                )
//
//                ToggleConfigurationView(
//                    name: "is attributed text",
//                    isOn: self.configuration.isAttributedText
//                )
            }
        )
    }
}
