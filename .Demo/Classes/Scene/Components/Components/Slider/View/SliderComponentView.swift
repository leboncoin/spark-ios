//
//  SliderComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SliderComponentView = ComponentViewable<SliderConfiguration, SliderImplementationView, SliderConfView>

extension SliderComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct SliderImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SliderConfiguration>
    @State private var value: Float = 0
    @State private var isEditing: Bool = false

    // MARK: - View

    var body: some View {
        VStack {
            SparkCore.Slider(
                theme: self.configurationWrapped.theme.value,
                shape: self.configurationWrapped.shape,
                intent: self.configurationWrapped.intent,
                value: self.$value,
                in: self.configurationWrapped.bounds(),
                step: self.configurationWrapped.step(),
                onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                })
            .demoDisabled(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
            .onAppear() {
                self.value = Float(self.configurationWrapped.valueString) ?? 0
            }
            .onChange(of: self.configurationWrapped.valueString) { newValue in
                self.value = Float(newValue) ?? 0
            }

            HStack {
                Text("Value \(String(format: "%.2f", self.value))")
                Divider()
                    .frame(height: 10)
                Text("Is Editing: \(self.isEditing)")
            }
            .demoComponentInfoBackground()
        }
    }
}

struct SliderConfView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<SliderConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: SliderImplementationView.self,
            mainItemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: SliderIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "shape",
                    values: SliderShape.allCases,
                    selectedValue: self.configuration.shape
                )

                TextFieldConfigurationView(
                    name: "value",
                    text: self.configuration.valueString,
                    keyboardType: .numberPad
                )

                TextFieldConfigurationView(
                    name: "step",
                    text: self.configuration.stepString,
                    keyboardType: .numberPad
                )

                HStack {
                    TextFieldConfigurationView(
                        name: "bounds",
                        placeholder: "min",
                        text: self.configuration.lowerBoundString,
                        keyboardType: .numberPad
                    )
                    
                    TextField(
                        name: "max",
                        text: self.configuration.upperBoundString,
                        keyboardType: .numberPad
                    )
                }
            }
        )
    }
}

// MARK: - Preview

struct SliderComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SliderComponentView()
    }
}
