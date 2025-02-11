//
//  TextFieldConfigView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct TextFieldConfigView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias ComponentUIView = TextFieldUIView

    // MARK: - Properties

    var configuration: Binding<TextFieldConfiguration>
    var uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TextFieldUIView, TextFieldConfiguration>? = nil

    // MARK: - Initialization

    init(configuration: Binding<TextFieldConfiguration>) {
        self.configuration = configuration
    }

    init(
        configuration: Binding<TextFieldConfiguration>,
        uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TextFieldUIView, TextFieldConfiguration>
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
