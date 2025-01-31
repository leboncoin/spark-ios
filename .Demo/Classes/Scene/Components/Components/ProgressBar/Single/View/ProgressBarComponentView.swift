//
//  ProgressBarComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ProgressBarComponentView = ComponentViewable<ProgressBarConfiguration, ProgressBarImplementationView, ProgressBarConfigurationView>

extension ProgressBarComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct ProgressBarImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<ProgressBarConfiguration>

    // MARK: - View

    var body: some View {
        ProgressBarView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            shape: self.configurationWrapped.shape,
            value: CGFloat(self.configurationWrapped.value) / 100
        )
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

struct ProgressBarConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<ProgressBarConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: ProgressBarImplementationView.self,
            mainItemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: ProgressBarIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "shape",
                    values: ProgressBarShape.allCases,
                    selectedValue: self.configuration.shape
                )

                StepperConfigurationView(
                    name: "value",
                    value: self.configuration.value,
                    bounds: 0...100,
                    step: self.configuration.step.wrappedValue
                )

                StepperConfigurationView(
                    name: "stepper",
                    value: self.configuration.step,
                    bounds: 0...100,
                    step: 1
                )
            }
        )
    }
}

// MARK: - Preview

struct ProgressBarComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarComponentView()
    }
}
