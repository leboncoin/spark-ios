//
//  CheckboxComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias CheckboxComponentView = ComponentViewable<CheckboxConfiguration, CheckboxImplementationView, CheckboxConfigurationView>

// MARK: - Subview

struct CheckboxImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<CheckboxConfiguration>
    @State private var selectionState: CheckboxSelectionState = .unselected

    // MARK: - View

    var body: some View {
        VStack {
            CheckboxView(
                text: self.configurationWrapped.text,
                checkedImage: .init(icon: self.configurationWrapped.checkedIcon),
                alignment: self.configurationWrapped.alignment,
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                selectionState: self.configurationWrapped.isIndeterminate ? .constant(.indeterminate) : self.$selectionState
            )
            .demoDisabled(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)

            Text("Selection state : \(self.selectionState)")
                .demoComponentInfoBackground()
        }
    }
}

struct CheckboxConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<CheckboxConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: CheckboxImplementationView.self,
            mainItemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: CheckboxIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "alignment",
                    values: CheckboxAlignment.allCases,
                    selectedValue: self.configuration.alignment
                )

                TextFieldConfigurationView(
                    name: "text",
                    text: self.configuration.text
                )

                EnumConfigurationView(
                    name: "checked icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.checkedIcon
                )

                ToggleConfigurationView(
                    name: "is indeterminate",
                    isOn: self.configuration.isIndeterminate
                )
            }
        )
    }
}

// MARK: - Preview

struct CheckboxComponentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxComponentView()
    }
}
