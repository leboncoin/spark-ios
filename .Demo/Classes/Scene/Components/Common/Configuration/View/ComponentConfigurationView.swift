//
//  ComponentConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ComponentConfigurationView<
    Configuration: ComponentConfiguration,
    ComponentView: View,
    ConfigurationItemsView: View,
    OtherConfigurationItemsView: View,
    OtherAccessibilityItemsView: View
>: View {

    // MARK: - Properties

    @Environment(\.dismiss) var dismiss
    @Binding private var configuration: Configuration
    @State private var dynamicTypeSize = DynamicTypeSize.large
    @State var colorScheme: ColorScheme = .light

    private let componentView: () -> ComponentView
    private var mainItemsView: () -> ConfigurationItemsView
    private var otherSectionItemsView: (() -> OtherConfigurationItemsView)?
    private var otherAccessibilityItemsView: (() -> OtherAccessibilityItemsView)?

    private let framework: Framework

    // MARK: - Initialization

    init(
        configuration: Binding<Configuration>,
        framework: Framework,
        @ViewBuilder componentView: @escaping () -> ComponentView,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView
    ) where OtherConfigurationItemsView == EmptyView, OtherAccessibilityItemsView == EmptyView {
        self._configuration = configuration
        self.framework = framework
        self.componentView = componentView
        self.mainItemsView = mainItemsView
    }

    init(
        configuration: Binding<Configuration>,
        framework: Framework,
        @ViewBuilder componentView: @escaping () -> ComponentView,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView,
        @ViewBuilder otherSectionItemsView: @escaping () -> OtherConfigurationItemsView
    ) where OtherAccessibilityItemsView == EmptyView {
        self._configuration = configuration
        self.framework = framework
        self.componentView = componentView
        self.mainItemsView = mainItemsView
        self.otherSectionItemsView = otherSectionItemsView
    }

    init(
        configuration: Binding<Configuration>,
        framework: Framework,
        @ViewBuilder componentView: @escaping () -> ComponentView,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView,
        @ViewBuilder otherAccessibilityItemsView: @escaping () -> OtherAccessibilityItemsView
    ) where OtherConfigurationItemsView == EmptyView {
        self._configuration = configuration
        self.framework = framework
        self.componentView = componentView
        self.mainItemsView = mainItemsView
        self.otherAccessibilityItemsView = otherAccessibilityItemsView
    }

    init(
        configuration: Binding<Configuration>,
        framework: Framework,
        @ViewBuilder componentView: @escaping () -> ComponentView,
        @ViewBuilder mainItemsView: @escaping () -> ConfigurationItemsView,
        @ViewBuilder otherSectionItemsView: @escaping () -> OtherConfigurationItemsView,
        @ViewBuilder otherAccessibilityItemsView: @escaping () -> OtherAccessibilityItemsView
    ) {
        self._configuration = configuration
        self.framework = framework
        self.componentView = componentView
        self.mainItemsView = mainItemsView
        self.otherSectionItemsView = otherSectionItemsView
        self.otherAccessibilityItemsView = otherAccessibilityItemsView
    }

    // MARK: - View

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: .medium) {
                // Component
                self.componentView()
                    .dynamicTypeSize(self.dynamicTypeSize)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, .xLarge)

                List {
                    // *****
                    // Component properties
                    Section("Properties") {
                        ThemeConfigurationItemView(
                            name: "theme",
                            values: DemoThemes.shared.themes,
                            selectedValue: self.$configuration.theme
                        )

                        self.mainItemsView()

                        if self.configuration.isEnabled.showConfiguration {
                            ToggleConfigurationItemView(
                                name: "is enabled",
                                isOn: self.$configuration.isEnabled.value
                            )
                        }

                        if self.framework.isUIKit && self.configuration.uiKitIsSelected.showConfiguration {
                            ToggleConfigurationItemView(
                                name: "is selected",
                                isOn: self.$configuration.uiKitIsSelected.value
                            )
                        }

                        if self.framework.isUIKit && self.configuration.uiKitControlType.showConfiguration {
                            OptionalEnumConfigurationItemView(
                                name: "control type",
                                values: ComponentControlType.allCases,
                                selectedValue: self.$configuration.uiKitControlType.value
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
            .environment(\.colorScheme, self.colorScheme)
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
                    TextFieldConfigurationItemView(
                        name: "Label",
                        text: self.$configuration.accessibilityLabel.value
                    )
                }

                if isAccessibilityValue {
                    TextFieldConfigurationItemView(
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
            framework.isSwiftUI ? self.$configuration.swiftUIWidth : nil,
            self.$configuration.height
        ].compactMap { $0 }

        if configurations.contains(where: { $0.showConfiguration.wrappedValue }) {
            ForEach(configurations, id: \.id) { $item in
                if item.showConfiguration {
                    Section(item.name) {
                        TextFieldConfigurationItemView(
                            name: item.name,
                            text: $item.text,
                            keyboardType: .numberPad
                        )

                        TextFieldConfigurationItemView(
                            name: "min",
                            text: $item.minText,
                            keyboardType: .numberPad
                        )

                        HStack {
                            TextFieldConfigurationItemView(
                                name: "max",
                                text: $item.maxText,
                                keyboardType: .numberPad
                            )

                            if self.framework.isSwiftUI {
                                Divider()
                                    .frame(height: 16)

                                ToggleConfigurationItemView(
                                    name: "is ∞",
                                    isOn: $item.infinite
                                )
                            }
                        }
                    }
                }
            }
        }

        if self.framework.isSwiftUI, self.$configuration.wrappedValue.swiftUIIsMinWidth.showConfiguration {
            Section("Width") {
                ToggleConfigurationItemView(
                    name: "Takes minimun space",
                    isOn: self.$configuration.swiftUIIsMinWidth.value
                )
            }
        }
    }

    @ViewBuilder
    private func createGlobalSettingsSection() -> some View {
        Section("Global Settings") {
            DynamicTypeConfigurationItemView(selectedValue: self.$dynamicTypeSize)
            ColorSchemeConfigurationItemView(selectedValue: self.$colorScheme)
        }
    }
}
