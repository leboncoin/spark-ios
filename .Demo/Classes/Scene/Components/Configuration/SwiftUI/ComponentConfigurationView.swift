//
//  ComponentConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// TODO: rajouter OtherAccessibilityItemsView: View

struct ComponentConfigurationView<
    Configuration: ComponentConfiguration,
    ComponentView: ComponentImplementationViewable<Configuration>,
    ConfigurationItemsView: View,
    OtherConfigurationItemsView: View
>: View {

    // MARK: - Properties

    @Environment(\.dismiss) var dismiss
    @Binding var configuration: Configuration
    @State private var dynamicTypeSize = DynamicTypeSize.large
    @State private var colorScheme: ColorScheme = .light

    var mainItemsView: () -> ConfigurationItemsView
    var otherSectionItemsView: (() -> OtherConfigurationItemsView)?

    // MARK: - Initialization

    init(
        configuration: Binding<Configuration>,
        componentViewType: ComponentView.Type,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView
    ) where OtherConfigurationItemsView == EmptyView {
        self._configuration = configuration
        self.mainItemsView = mainItemsView
    }

    init(
        configuration: Binding<Configuration>,
        componentViewType: ComponentView.Type,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView,
        @ViewBuilder otherSectionItemsView: @escaping () -> OtherConfigurationItemsView
    ) {
        self._configuration = configuration
        self.mainItemsView = mainItemsView
        self.otherSectionItemsView = otherSectionItemsView
    }

    // MARK: - View

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: .medium) {

                // Component
                ComponentView(configuration: self.$configuration)
                    .dynamicTypeSize(self.dynamicTypeSize)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, .xLarge)

                List {
                    // *****
                    // Component properties
                    Section("Properties") {
                        ThemeConfigurationView(
                            name: "theme",
                            values: DemoThemes.shared.themes,
                            selectedValue: self.$configuration.theme
                        )

                        self.mainItemsView()

                        if self.configuration.isEnabled.showConfiguration {
                            ToggleConfigurationView(
                                name: "is enabled",
                                isOn: self.$configuration.isEnabled.value
                            )
                        }
                    }

                    self.otherSectionItemsView?()
                    // *****

                    // Accessibility properties
                    self.createAccessibilitySection()

                    // Size properties
                    self.createSizeSection()

                    // Settings properties (just for sheet)
                    self.createGlobalSettingsSection()

                    Section {
                        Button("Dismiss") {
                            self.dismiss()
                        }
                    }
                }
                .listStyle(.automatic)
                .scrollIndicators(.hidden)
            }
            .padding(.top, .large)
            .frame(maxWidth: .infinity)
            .background(Color(.systemGroupedBackground))
            .preferredColorScheme(self.colorScheme)
        }
    }

    // MARK: - Builder

    @ViewBuilder
    func createAccessibilitySection() -> some View {
        let isAccessibilityLabel = self.configuration.accessibilityLabel.showConfiguration
        let isAccessibilityValue = self.configuration.accessibilityValue.showConfiguration

        if isAccessibilityLabel || isAccessibilityValue {
            Section("Accessibility") {
                if isAccessibilityLabel {
                    TextFieldConfigurationView(
                        name: "Label",
                        text: self.$configuration.accessibilityLabel.value
                    )
                }

                if isAccessibilityValue {
                    TextFieldConfigurationView(
                        name: "Value",
                        text: self.$configuration.accessibilityValue.value
                    )
                }
            }
        }
    }

    @ViewBuilder
    func createSizeSection() -> some View {
        let configurations = [
            self.$configuration.width,
            self.$configuration.height
        ]

        if configurations.contains(where: { $0.showConfiguration.wrappedValue }) {
            ForEach(configurations, id: \.id) { $item in
                if item.showConfiguration {
                    Section(item.name) {
                        TextFieldConfigurationView(
                            name: item.name,
                            text: $item.text,
                            keyboardType: .numberPad
                        )

                        TextFieldConfigurationView(
                            name: "min",
                            text: $item.minText,
                            keyboardType: .numberPad
                        )

                        HStack {
                            TextFieldConfigurationView(
                                name: "max",
                                text: $item.maxText,
                                keyboardType: .numberPad
                            )

                            Divider()
                                .frame(height: 16)

                            ToggleConfigurationView(
                                name: "is ∞",
                                isOn: $item.infinite
                            )
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    func createGlobalSettingsSection() -> some View {
        Section("Global Settings") {
            DynamicTypeConfigurationView(selectedValue: self.$dynamicTypeSize)
            ColorSchemeConfigurationView(selectedValue: self.$colorScheme)
        }
    }
}
