//
//  ComponentConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct ComponentConfigurationView<
    Configuration: ComponentConfiguration,
    ComponentView: ComponentImplementationViewable<Configuration>,
    ConfigurationItemsView: View,
    OtherConfigurationItemsView: View,
    OtherAccessibilityItemsView: View
>: View {

    // MARK: - Properties

    @Environment(\.dismiss) var dismiss
    @Binding private var configuration: Configuration
    @State private var dynamicTypeSize = DynamicTypeSize.large
    @State private var colorScheme: ColorScheme = .light

    private var mainItemsView: () -> ConfigurationItemsView
    private var otherSectionItemsView: (() -> OtherConfigurationItemsView)?
    private var otherAccessibilityItemsView: (() -> OtherAccessibilityItemsView)?

    private var componentView: ComponentView

    // MARK: - Initialization (Used by SwiftUI)

    init(
        configuration: Binding<Configuration>,
        componentViewType: ComponentView.Type,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView
    ) where OtherConfigurationItemsView == EmptyView, OtherAccessibilityItemsView == EmptyView {
        self._configuration = configuration
        self.componentView = ComponentView(configuration: configuration)
        self.mainItemsView = mainItemsView
    }

    init(
        configuration: Binding<Configuration>,
        componentViewType: ComponentView.Type,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView,
        @ViewBuilder otherSectionItemsView: @escaping () -> OtherConfigurationItemsView
    ) where OtherAccessibilityItemsView == EmptyView{
        self._configuration = configuration
        self.componentView = ComponentView(configuration: configuration)
        self.mainItemsView = mainItemsView
        self.otherSectionItemsView = otherSectionItemsView
    }

    init(
        configuration: Binding<Configuration>,
        componentViewType: ComponentView.Type,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView,
        @ViewBuilder otherAccessibilityItemsView: @escaping () -> OtherAccessibilityItemsView
    ) where OtherConfigurationItemsView == EmptyView {
        self._configuration = configuration
        self.componentView = ComponentView(configuration: configuration)
        self.mainItemsView = mainItemsView
        self.otherAccessibilityItemsView = otherAccessibilityItemsView
    }

    init(
        configuration: Binding<Configuration>,
        componentViewType: ComponentView.Type,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView,
        @ViewBuilder otherSectionItemsView: @escaping () -> OtherConfigurationItemsView,
        @ViewBuilder otherAccessibilityItemsView: @escaping () -> OtherAccessibilityItemsView
    ) {
        self._configuration = configuration
        self.componentView = ComponentView(configuration: configuration)
        self.mainItemsView = mainItemsView
        self.otherSectionItemsView = otherSectionItemsView
        self.otherAccessibilityItemsView = otherAccessibilityItemsView
    }

    // MARK: - Initialization (Used by UIKit)

    init(
        configuration: Binding<Configuration>,
        componentView: ComponentView,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView
    ) where OtherConfigurationItemsView == EmptyView, OtherAccessibilityItemsView == EmptyView {
        self._configuration = configuration
        self.mainItemsView = mainItemsView
        self.componentView = componentView
    }

    init(
        configuration: Binding<Configuration>,
        componentView: ComponentView,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView,
        @ViewBuilder otherSectionItemsView: @escaping () -> OtherConfigurationItemsView
    ) where OtherAccessibilityItemsView == EmptyView{
        self._configuration = configuration
        self.mainItemsView = mainItemsView
        self.otherSectionItemsView = otherSectionItemsView
        self.componentView = ComponentView(configuration: configuration)
    }

    init(
        configuration: Binding<Configuration>,
        componentView: ComponentView,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView,
        @ViewBuilder otherAccessibilityItemsView: @escaping () -> OtherAccessibilityItemsView
    ) where OtherConfigurationItemsView == EmptyView {
        self._configuration = configuration
        self.mainItemsView = mainItemsView
        self.otherAccessibilityItemsView = otherAccessibilityItemsView
        self.componentView = ComponentView(configuration: configuration)
    }

    init(
        configuration: Binding<Configuration>,
        componentView: ComponentView,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView,
        @ViewBuilder otherSectionItemsView: @escaping () -> OtherConfigurationItemsView,
        @ViewBuilder otherAccessibilityItemsView: @escaping () -> OtherAccessibilityItemsView
    ) {
        self._configuration = configuration
        self.mainItemsView = mainItemsView
        self.otherSectionItemsView = otherSectionItemsView
        self.otherAccessibilityItemsView = otherAccessibilityItemsView
        self.componentView = ComponentView(configuration: configuration)
    }

    // MARK: - View

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: .medium) {

                // Component
                self.componentView
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
    private func createAccessibilitySection() -> some View {
        let isAccessibilityLabel = self.configuration.accessibilityLabel.showConfiguration
        let isAccessibilityValue = self.configuration.accessibilityValue.showConfiguration
        let isOtherAccessibilityItemsView = self.otherAccessibilityItemsView != nil

        if isAccessibilityLabel || isAccessibilityValue || isOtherAccessibilityItemsView {
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

                self.otherAccessibilityItemsView?()
            }
        }
    }

    @ViewBuilder
    private func createSizeSection() -> some View {
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
    private func createGlobalSettingsSection() -> some View {
        Section("Global Settings") {
            DynamicTypeConfigurationView(selectedValue: self.$dynamicTypeSize)
            ColorSchemeConfigurationView(selectedValue: self.$colorScheme)
        }
    }
}
