//
//  StepperComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 25/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias StepperComponentView = ComponentViewable<StepperConfiguration, StepperImplementationView, StepperConfigurationView>

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
    @State private var isEditing: Bool = false

    // MARK: - Initialization

    init(configuration: Binding<StepperConfiguration>) {
        self.configuration = configuration
    }

    // MARK: - View

    var body: some View {
        self.createComponent()
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
                theme: self.configurationWrapped.theme.value,
                value: self.$floatValue,
                in: self.configurationWrapped.bounds(),
                step: self.configurationWrapped.step(),
                format: .currency(code: "EUR").locale(.init(identifier: "fr_FR")),
                decrementImage: .init(icon: self.configurationWrapped.decrementIcon),
                incrementImage: .init(icon: self.configurationWrapped.incrementIcon)
            )
            .demoProperties(self.configurationWrapped)

        case .percent:
            SparkStepper(
                theme: self.configurationWrapped.theme.value,
                value: self.$intValue,
                in: self.configurationWrapped.bounds().intRange,
                step: self.configurationWrapped.step().intValue,
                format: .percent,
                decrementImage: .init(icon: self.configurationWrapped.decrementIcon),
                incrementImage: .init(icon: self.configurationWrapped.incrementIcon)
            )
            .demoProperties(self.configurationWrapped)

        case .none:
            SparkStepper(
                theme: self.configurationWrapped.theme.value,
                value: self.$intValue,
                in: self.configurationWrapped.bounds().intRange,
                step: self.configurationWrapped.step().intValue,
                decrementImage: .init(icon: self.configurationWrapped.decrementIcon),
                incrementImage: .init(icon: self.configurationWrapped.incrementIcon)
            )
            .demoProperties(self.configurationWrapped)
        }
    }
}

// MARK: - Extension

private extension SparkStepper {

    func demoProperties(_ configuration: StepperConfiguration) -> some View {
        self.demoIncrementAccessibilityLabel(configuration)
            .demoDecrementAccessibilityLabel(configuration)
            .demoDisabled(configuration)
            .demoRightSpace(configuration)
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

// MARK: - Preview

struct StepperComponentView_Previews: PreviewProvider {
    static var previews: some View {
        StepperComponentView()
    }
}
