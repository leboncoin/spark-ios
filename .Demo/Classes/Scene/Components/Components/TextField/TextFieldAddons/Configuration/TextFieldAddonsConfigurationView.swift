//
//  TextFieldAddonsConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct TextFieldAddonsConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias ComponentUIView = TextFieldAddonsUIView

    // MARK: - Properties

    var configuration: Binding<TextFieldAddonsConfiguration>
    var uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TextFieldAddonsUIView, TextFieldAddonsConfiguration>? = nil

    // MARK: - Initialization

    init(configuration: Binding<TextFieldAddonsConfiguration>) {
        self.configuration = configuration
    }

    init(
        configuration: Binding<TextFieldAddonsConfiguration>,
        uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<TextFieldAddonsUIView, TextFieldAddonsConfiguration>
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
                componentViewType: TextFieldAddonsImplementationView.self,
                mainItemsView: { self.itemsView() },
                otherSectionItemsView:  { self.otherSectionItemsView() }
            )
        }
    }

    @ViewBuilder
    private func itemsView() -> some View {
        TextFieldCommonConfigurationView(configuration: self.configuration, framework: self.framework)
    }

    @ViewBuilder
    private func otherSectionItemsView() -> some View {
        // Left & Right View
        TextFieldCommonContentSideConfigurationView(
            configuration: self.configuration,
            framework: self.framework
        )

        // Left & Right Addons
        ForEach(TextFieldContentSide.allCases, id: \.self) { contentSide in
            let contentType = switch contentSide {
            case .left: self.configuration.leftAddonContentType
            case .right: self.configuration.rightAddonContentType
            }

            let isPadding = switch contentSide {
            case .left: self.configuration.isLeftAddonPadding
            case .right: self.configuration.isRightAddonPadding
            }

            Section("\(contentSide.name) Addon") {
                EnumConfigurationView(
                    name: "\(contentSide.name) view",
                    values: TextFieldSideViewContentType.allCases,
                    selectedValue: contentType
                )

                ToggleConfigurationView(
                    name: "is padding on \(contentSide.name) addons",
                    isOn: isPadding
                )
            }
        }
    }
}
