//
//  FormFieldComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
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
                RadioButtonImplementationView(
                    configuration: self.configuration.radioButtonConfiguration,
                    showInfo: false
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
            limit: 100,
            show: self.configurationWrapped.componentType.isSecondaryHelper
        )
        .demoTitleAccessibilityLabel(self.configurationWrapped)
        .demoHelperAccessibilityLabel(self.configurationWrapped)
        .demoSecondaryHelperAccessibilityLabel(self.configurationWrapped)
        .demoSecondaryHelperAccessibilityValue(self.configurationWrapped)
        .demoDisabled(self.configurationWrapped)
        .layoutPriority(1)
    }
}

struct FormFieldConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<FormFieldConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: FormFieldImplementationView.self,
            mainItemsView: {
                EnumConfigurationView(
                    name: "feedback state",
                    values: FormFieldFeedbackState.allCases,
                    selectedValue: self.configuration.feedbackState
                )

                TextFieldConfigurationView(
                    name: "title",
                    text: self.configuration.title
                )

                ToggleConfigurationView(
                    name: "is title required title",
                    isOn: self.configuration.isTitleRequired
                )

                TextFieldConfigurationView(
                    name: "helper",
                    text: self.configuration.helper
                )

                ToggleConfigurationView(
                    name: "is attributed string",
                    isOn: self.configuration.isAttributedString
                )
                EnumConfigurationView(
                    name: "component type",
                    values: FormFieldComponentType.allCases,
                    selectedValue: self.configuration.componentType
                )
            },
            otherAccessibilityItemsView: {
                TextFieldConfigurationView(
                    name: "title accessibility label",
                    text: self.configuration.titleAccessibilityLabel,
                    orientation: .vertical
                )

                TextFieldConfigurationView(
                    name: "helper accessibility label",
                    text: self.configuration.helperAccessibilityLabel,
                    orientation: .vertical
                )

                TextFieldConfigurationView(
                    name: "secondary helper accessibility label",
                    text: self.configuration.secondaryHelperAccessibilityLabel,
                    orientation: .vertical
                )

                TextFieldConfigurationView(
                    name: "secondary helper accessibility value",
                    text: self.configuration.secondaryHelperAccessibilityValue,
                    orientation: .vertical
                )
            }
        )
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

    func counterIfPossible(on text: String, limit: Int?, show: Bool) -> Self {
        if show {
            self.counter(on: text, limit: limit)
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
