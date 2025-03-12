//
//  FormFieldComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias FormFieldComponentView = ComponentViewable<FormFieldConfiguration, FormFieldImplementationView, FormFieldConfigurationView>

extension FormFieldComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct FormFieldImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<FormFieldConfiguration>
    @State private var text: String = ""

    // MARK: - View

    var body: some View {
        FormFieldView(self.configurationWrapped, component: {
            switch self.configurationWrapped.componentType {
            case .checkbox:
                CheckboxGroupImplementationView(
                    configuration: self.configuration.checkboxGroupConfiguration,
                    showInfo: false
                )
            case .radioButton:
                RadioButtonGroupImplementationView(
                    configuration: self.configuration.radioButtonConfiguration,
                    showInfo: false
                )
            case .stepper:
                StepperImplementationView(
                    configuration: self.configuration.stepperConfiguration
                )
            case .textEditor:
                TextEditorImplementationView(
                    configuration: self.configuration.textEditorConfiguration,
                    textForFormField: self.$text
                )
            case .textField:
                TextFieldImplementationView(
                    configuration: self.configuration.textFieldConfiguration,
                    textForFormField: self.$text
                )
            }
        })
        .counterIfPossible(
            on: self.text,
            for: self.configurationWrapped
        )
        .demoTitleAccessibilityLabel(self.configurationWrapped)
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
        let titleIsEmpty = configuration.title.isEmpty
        let helperIsEmpty = configuration.helper.isEmpty

        if configuration.isAttributedString {
            self.init(
                theme: configuration.theme.value,
                component: component,
                feedbackState: configuration.feedbackState,
                attributedTitle: titleIsEmpty ? nil : configuration.title.demoAttributedString,
                attributedHelper: helperIsEmpty ? nil : configuration.helper.demoAttributedString,
                isTitleRequired: configuration.isTitleRequired
            )
        } else {
            self.init(
                theme: configuration.theme.value,
                component: component,
                feedbackState: configuration.feedbackState,
                title: titleIsEmpty ? nil : configuration.title,
                helper: helperIsEmpty ? nil : configuration.helper,
                isTitleRequired: configuration.isTitleRequired
            )
        }
    }

    func demoTitleAccessibilityLabel(_ configuration: FormFieldConfiguration) -> Self {
        let label = configuration.titleAccessibilityLabel
        if !label.isEmpty {
            return self.titleAccessibilityLabel(label)
        } else {
            return self
        }
    }

    func demoHelperAccessibilityLabel(_ configuration: FormFieldConfiguration) -> Self {
        let label = configuration.helperAccessibilityLabel
        if !label.isEmpty {
            return self.helperAccessibilityLabel(label)
        } else {
            return self
        }
    }

    func demoSecondaryHelperAccessibilityLabel(_ configuration: FormFieldConfiguration) -> Self {
        let label = configuration.secondaryHelperAccessibilityLabel
        if !label.isEmpty {
            return self.secondaryHelperAccessibilityLabel(label)
        } else {
            return self
        }
    }

    func demoSecondaryHelperAccessibilityValue(_ configuration: FormFieldConfiguration) -> Self {
        let label = configuration.secondaryHelperAccessibilityValue
        if !label.isEmpty {
            return self.secondaryHelperAccessibilityValue(label)
        } else {
            return self
        }
    }
}

// MARK: - Extension

private extension FormFieldView {

    func counterIfPossible(on text: String, for configuration: FormFieldConfiguration) -> Self {
        if configuration.componentType.isSecondaryHelper {
            self.counter(on: text, limit: configuration.textInputCounterLimit)
        } else {
            self
        }
    }
}

// MARK: - Preview

struct FormFieldComponentView_Previews: PreviewProvider {
    static var previews: some View {
        FormFieldComponentView()
    }
}
