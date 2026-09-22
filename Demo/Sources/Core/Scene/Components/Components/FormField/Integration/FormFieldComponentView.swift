//
//  FormFieldComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias FormFieldComponentView = ComponentViewable<FormFieldConfiguration, FormFieldImplementationView, FormFieldConfigurationView, FormFieldExtraTools>

extension FormFieldComponentView {

    init() {
        self.init(style: .alone, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct FormFieldImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<FormFieldConfiguration>
    @State private var checkboxSelectionIDs: [Int] = .init()
    @State private var radioButtonSelectedID: Int?
    @State private var stepperValue: Int = 50
    @State private var text: String = ""

    // MARK: - View

    var body: some View {
        FormFieldView(self.configurationWrapped, component: {
            switch self.configurationWrapped.componentType {
            case .checkbox:
                CheckboxGroupImplementationView(
                    configuration: self.configuration.checkboxGroupConfiguration,
                    selectedIDs: self.$checkboxSelectionIDs,
                    showInfo: false
                )
            case .radioButton:
                RadioGroupImplementationView(
                    configuration: self.configuration.radioButtonConfiguration,
                    selectedID: self.$radioButtonSelectedID,
                    showInfo: false
                )
            case .stepper:
                StepperImplementationView(
                    configuration: self.configuration.stepperConfiguration,
                    value: self.$stepperValue
                )
            case .textEditor:
                TextEditorImplementationView(
                    configuration: self.configuration.textEditorConfiguration,
                    text: self.$text
                )
            case .textField:
                TextFieldImplementationView(
                    configuration: self.configuration.textFieldConfiguration,
                    text: self.$text
                )
            }
        })
        .counterIfPossible(
            on: self.text,
            for: self.configurationWrapped
        )
        .demoClearButton(self.configurationWrapped) {
            self.checkboxSelectionIDs = []
            self.radioButtonSelectedID = nil
            self.stepperValue = Int(self.configurationWrapped.stepperConfiguration.lowerBoundString) ?? 0
            self.text = ""
        }
        .demoTitleAccessibilityLabel(self.configurationWrapped)
        .demoClearButtonAccessibilityLabel(self.configurationWrapped)
        .demoHelperAccessibilityLabel(self.configurationWrapped)
        .demoSecondaryHelperAccessibilityLabel(self.configurationWrapped)
        .demoSecondaryHelperAccessibilityValue(self.configurationWrapped)
        .demoDisabled(self.configurationWrapped)
        .layoutPriority(1)
    }
}

// MARK: - Extension

private extension FormFieldView {

    init(
        _ configuration: FormFieldConfiguration,
         @ViewBuilder component: @escaping () -> Component
    ) {
        self.init(
            theme: configuration.theme.value,
            feedbackState: configuration.feedbackState,
            title: configuration.title.nilIfEmpty,
            helper: configuration.helper.nilIfEmpty,
            helperImage: .init(icon: configuration.helperIcon),
            isRequired: configuration.isRequired,
            component: component
        )
    }

    func demoClearButton(_ configuration: FormFieldConfiguration, action: @escaping () -> Void) -> Self {
        let icon = configuration.clearButtonIcon
        return if let icon {
            self.clearButton(
                title: configuration.clearButtonTitle.nilIfEmpty,
                icon: .init(icon: icon),
                action: action
            )
        } else {
            self
        }
    }

    func demoTitleAccessibilityLabel(_ configuration: FormFieldConfiguration) -> Self {
        let label = configuration.titleAccessibilityLabel
        return if !label.isEmpty {
            self.titleAccessibilityLabel(label)
        } else {
            self
        }
    }

    func demoClearButtonAccessibilityLabel(_ configuration: FormFieldConfiguration) -> Self {
        let label = configuration.clearButtonAccessibilityLabel
        return if !label.isEmpty {
            self.clearButtonAccessibilityLabel(label)
        } else {
            self
        }
    }

    func demoHelperAccessibilityLabel(_ configuration: FormFieldConfiguration) -> Self {
        let label = configuration.helperAccessibilityLabel
        return if !label.isEmpty {
            self.helperAccessibilityLabel(label)
        } else {
            self
        }
    }

    func demoSecondaryHelperAccessibilityLabel(_ configuration: FormFieldConfiguration) -> Self {
        let label = configuration.secondaryHelperAccessibilityLabel
        return if !label.isEmpty {
            self.secondaryHelperAccessibilityLabel(label)
        } else {
            self
        }
    }

    func demoSecondaryHelperAccessibilityValue(_ configuration: FormFieldConfiguration) -> Self {
        let label = configuration.secondaryHelperAccessibilityValue
        return if !label.isEmpty {
            self.secondaryHelperAccessibilityValue(label)
        } else {
            self
        }
    }
}

// MARK: - Extension

private extension FormFieldView {

    func counterIfPossible(on text: String, for configuration: FormFieldConfiguration) -> Self {
        return if configuration.componentType.isSecondaryHelper {
            self.counter(on: text, limit: configuration.textInputCounterLimit)
        } else {
            self
        }
    }
}
