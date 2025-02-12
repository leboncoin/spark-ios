//
//  TextFieldConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct TextFieldConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = TextFieldConfiguration
    typealias ComponentUIView = TextFieldUIView

    // MARK: - Properties

    var configuration: Binding<Configuration>
    var componentImplementationViewRepresentable: ComponentImplementationRepresentable? = nil

    // MARK: - Initialization

    init(configuration: Binding<Configuration>) {
        self.configuration = configuration
    }

    init(
        configuration: Binding<Configuration>,
        componentImplementationViewRepresentable: ComponentImplementationRepresentable
    ) {
        self.configuration = configuration
        self.componentImplementationViewRepresentable = componentImplementationViewRepresentable
    }

    // MARK: - View

    var body: some View {
        if let componentImplementationViewRepresentable {
            ComponentConfigurationView(
                configuration: self.configuration,
                componentView: componentImplementationViewRepresentable,
                mainItemsView: { self.itemsView() },
                otherSectionItemsView:  { self.otherSectionItemsView() }
            )
        } else {
            ComponentConfigurationView(
                configuration: self.configuration,
                componentViewType: TextFieldImplementationView.self,
                mainItemsView: { self.itemsView() },
                otherSectionItemsView:  { self.otherSectionItemsView() }
            )
        }
    }

    @ViewBuilder
    private func itemsView() -> some View {
        TextFieldCommonConfigurationView(
            configuration: self.configuration,
            framework: self.framework
        )
    }

    @ViewBuilder
    private func otherSectionItemsView() -> some View {
        TextFieldCommonContentSideConfigurationView(
            configuration: self.configuration,
            framework: self.framework
        )
    }
}
