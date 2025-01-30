//
//  ChipComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ChipComponentView = ComponentViewable<ChipConfiguration, ChipImplementationView, ChipConfigurationView>

// MARK: - Subview

struct ChipImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<ChipConfiguration>
    @State private var showAlertAction = false

    // MARK: - View

    var body: some View {
        EmptyView()
        ChipView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            variant: self.configurationWrapped.variant,
            alignment: self.configurationWrapped.alignment,
            icon: .init(icon: self.configurationWrapped.icon),
            title: self.configurationWrapped.text,
            action: self.configurationWrapped.withAction ? { self.showAlertAction = true} : nil
        )
        .component(self.configurationWrapped.withExtraComponent ? self.component() : nil)
        .selected(self.configurationWrapped.isSelected)
        .demoDisabled(self.configurationWrapped)
        .demoBackground(self.configurationWrapped)
        .demoAccessibilityLabel(self.configurationWrapped)
        .alert("Chip Pressed", isPresented: self.$showAlertAction) {
            Button("OK", role: .cancel) { }
        }
    }

    private func component() -> AnyView {
        return AnyView(
            BadgeImplementationView(configuration: self.configuration.badgeConfiguration)
        )
    }
}

struct ChipConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<ChipConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: ChipImplementationView.self,
            itemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: ChipIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "variant",
                    values: ChipVariant.allCases,
                    selectedValue: self.configuration.variant
                )

                EnumConfigurationView(
                    name: "alignment",
                    values: ChipAlignment.allCases,
                    selectedValue: self.configuration.alignment
                )

                TextFieldConfigurationView(
                    name: "text",
                    text: self.configuration.text
                )

                OptionalEnumConfigurationView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.icon
                )

                ToggleConfigurationView(
                    name: "with action",
                    isOn: self.configuration.withAction
                )

                ToggleConfigurationView(
                    name: "with extra component (badge)",
                    isOn: self.configuration.withExtraComponent
                )

                ToggleConfigurationView(
                    name: "is selected",
                    isOn: self.configuration.isSelected
                )
            }
        )
    }
}

// MARK: - Preview

struct ChipComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ChipComponentView()
    }
}
