//
//  RadioButtonComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias RadioButtonComponentView = ComponentViewable<RadioButtonConfiguration, RadioButtonImplementationView, RadioButtonConfView>

extension RadioButtonComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct RadioButtonImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<RadioButtonConfiguration>
    @State private var selectedID: Int? = Bool.random() ? 1 : nil

    // MARK: - View

    var body: some View {
        VStack {
            RadioButtonGroupView(
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent,
                selectedID: self.$selectedID,
                items: self.configurationWrapped.items.map {
                    RadioButtonItem(id: $0.id, label: $0.text)
                },
                labelAlignment: self.configurationWrapped.labelAlignment,
                groupLayout: self.configurationWrapped.groupLayout
            )
            .demoDisabled(self.configurationWrapped)

            Group {
                if let selectedID {
                    Text("SelectedID: \(selectedID)")
                } else {
                    Text("No selection")
                }
            }
            .font(.footnote)
        }
    }
}

struct RadioButtonConfView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<RadioButtonConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: RadioButtonImplementationView.self,
            itemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: RadioButtonIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "label alignment",
                    values: RadioButtonLabelAlignment.allCases,
                    selectedValue: self.configuration.labelAlignment
                )

                EnumConfigurationView(
                    name: "group layout",
                    values: RadioButtonGroupLayout.allCases,
                    selectedValue: self.configuration.groupLayout
                )

                Divider()

                StepperConfigurationView(
                    name: "no. of items",
                    value: self.configuration.numberOfItems,
                    bounds: 2...5
                )

                ForEach(self.configuration.items, id: \.id) { item in
                    TextFieldConfigurationView(
                        name: "Item \(item.id) text",
                        text: item.text
                    )
                }

                Divider()
            }
        )
    }
}

// MARK: - Extension

extension RadioButtonGroupLayout: @retroactive CaseIterable {

    public static var allCases: [RadioButtonGroupLayout] {
        [.horizontal, .vertical]
    }
}

// MARK: - Preview

struct RadioButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonComponentView()
    }
}
