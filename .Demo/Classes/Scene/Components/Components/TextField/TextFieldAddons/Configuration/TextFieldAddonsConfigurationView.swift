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

    typealias Configuration = TextFieldAddonsConfiguration
    typealias ComponentUIView = TextFieldAddonsUIView

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
                EnumConfigurationItemView(
                    name: "\(contentSide.name) view",
                    values: TextFieldSideViewContentType.allCases,
                    selectedValue: contentType
                )

                ToggleConfigurationItemView(
                    name: "is padding on \(contentSide.name) addons",
                    isOn: isPadding
                )
            }
        }
    }
}
