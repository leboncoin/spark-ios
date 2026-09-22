//
//  StepperComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 25/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias StepperComponentView = ComponentViewable<StepperConfiguration, StepperImplementationView, StepperConfigurationView, StepperExtraTools>

extension StepperComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct StepperImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<StepperConfiguration>
    @State private var floatValue: Float = 0
    @State private var intValue: Int = 0
    private var intValueForFormField: Binding<Int>? // Only used by the FormField demo
    @State private var isEditing: Bool = false

    // MARK: - Initialization

    init(configuration: Binding<StepperConfiguration>) {
        self.configuration = configuration
        self.intValueForFormField = nil
    }

    // Only used by the FormField demo
    init(configuration: Binding<StepperConfiguration>, value: Binding<Int>) {
        self.configuration = configuration
        self.intValueForFormField = value
    }

    // MARK: - View

    var body: some View {
        self.createComponent()
            .sparkTheme(self.configurationWrapped.theme.value)
            .onAppear() {
                self.floatValue = Float(self.configurationWrapped.valueString) ?? 0
                self.intValue = Int(self.configurationWrapped.valueString) ?? 0
            }
            .onChange(of: self.configurationWrapped.valueString) { newValue in
                self.floatValue = Float(newValue) ?? 0
                self.intValue = Int(newValue) ?? 0
            }
    }

    @ViewBuilder
    func createComponent() -> some View {
        switch self.configurationWrapped.format {
        case .currency:
            SparkStepper(
                value: self.$floatValue,
                in: self.configurationWrapped.bounds(),
                step: self.configurationWrapped.step(),
                format: .currency(code: "EUR").locale(.init(identifier: "fr_FR"))
            )
            .demoProperties(self.configurationWrapped)

        case .percent:
            SparkStepper(
                value: self.$intValue,
                in: self.configurationWrapped.bounds().intRange,
                step: self.configurationWrapped.step().intValue,
                format: .percent
            )
            .demoProperties(self.configurationWrapped)

        case .none:
            SparkStepper(
                value: self.intValueForFormField ?? self.$intValue,
                in: self.configurationWrapped.bounds().intRange,
                step: self.configurationWrapped.step().intValue
            )
            .demoProperties(self.configurationWrapped)
        }
    }
}

// MARK: - Extension

private extension SparkStepper {

    func demoProperties(_ configuration: StepperConfiguration) -> some View {
        self
            .demoContextAccessibilityLabel(configuration)
            .demoIncrementAccessibilityLabel(configuration)
            .demoDecrementAccessibilityLabel(configuration)
            .demoDisabled(configuration)
            .demoRightSpace(configuration)
    }

    func demoContextAccessibilityLabel(_ configuration: StepperConfiguration) -> Self {
        let context = configuration.contextAccessibilityLabel
        if !context.isEmpty {
            return self.contextAccessibilityLabel(context)
        } else {
            return self
        }
    }

    func demoIncrementAccessibilityLabel(_ configuration: StepperConfiguration) -> Self {
        let label = configuration.incrementAccessibilityLabel
        if !label.isEmpty {
            return self.incrementAccessibilityLabel(label)
        } else {
            return self
        }
    }

    func demoDecrementAccessibilityLabel(_ configuration: StepperConfiguration) -> Self {
        let label = configuration.decrementAccessibilityLabel
        if !label.isEmpty {
            return self.decrementAccessibilityLabel(label)
        } else {
            return self
        }
    }
}
