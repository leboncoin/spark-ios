//
//  CheckboxGroupComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias CheckboxGroupComponentView = ComponentViewable<CheckboxGroupConfiguration, CheckboxGroupImplementationView, CheckboxGroupConfView>

extension CheckboxGroupComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct CheckboxGroupImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<CheckboxGroupConfiguration>
    var showInfo: Bool = true
    @State private var items = [any CheckboxGroupItemProtocol]()

    // MARK: - Initialization

    init(configuration: Binding<CheckboxGroupConfiguration>) {
        self.configuration = configuration
    }

    // Only used by the FormField demo
    init(configuration: Binding<CheckboxGroupConfiguration>, showInfo: Bool) {
        self.configuration = configuration
        self.showInfo = showInfo
    }

    // MARK: - View

    var body: some View {
        VStack {
            CheckboxGroupView(
                title: "",
                checkedImage: .init(icon: self.configurationWrapped.checkedIcon),
                items: self.$items,
                layout: self.configurationWrapped.layout,
                alignment: self.configurationWrapped.alignment,
                theme: self.configurationWrapped.theme.value,
                intent: self.configurationWrapped.intent
            )
            .demoDisabled(self.configurationWrapped)
            .onAppear() {
                self.items = self.configurationWrapped.items.map {
                    $0.toSpark(isSwiftUI: true)
                }
            }
            .onChange(of: self.configurationWrapped.items) { items in
                self.items = items.map { $0.toSpark(isSwiftUI: true) }
            }

            if self.showInfo {
                Text(self.selectedItemsText())
                    .demoComponentInfoBackground()
            }
        }
    }

    // MARK: - Getter

    func selectedItemsText() -> String {
        var text: String = ""
        let texts: [String] = self.items.enumerated()
            .map { index, checkbox in
                let line: String = index == (self.items.count - 1) ? "" : " | "
                return "\(index + 1) \(checkbox.selectionState)" + line
            }
        texts.forEach { text += $0 }
        return text
    }
}

struct CheckboxGroupConfView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<CheckboxGroupConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: CheckboxGroupImplementationView.self,
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

                EnumConfigurationView(
                    name: "layout",
                    values: CheckboxGroupLayout.allCases,
                    selectedValue: self.configuration.layout
                )

                EnumConfigurationView(
                    name: "checked icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.checkedIcon
                )
            },
            otherSectionItemsView: {
                Section("Items") {
                    StepperConfigurationView(
                        name: "no. of items",
                        value: self.configuration.numberOfItems,
                        bounds: 2...4
                    )

                    ForEach(self.configuration.items, id: \.id) { item in
                        ToggleConfigurationView(
                            name: "Item \(item.id) is long text",
                            isOn: item.isLongText
                        )

                        ToggleConfigurationView(
                            name: "Item \(item.id) is enabled",
                            isOn: item.isEnabled
                        )
                    }
                }
            }
        )
    }
}

// MARK: - Preview

struct CheckboxGroupComponentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxGroupComponentView()
    }
}
