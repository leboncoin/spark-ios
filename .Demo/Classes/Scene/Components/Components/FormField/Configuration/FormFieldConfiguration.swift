//
//  FormFieldConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class FormFieldConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var feedbackState: FormFieldFeedbackState = .default
    var title: String = Bool.random() ? "My Title" : ""
    var helper: String = Bool.random() ? "My Helper" : ""
    var isAttributedString: Bool = .random()
    var isTitleRequired: Bool = .random()
    var componentType: FormFieldComponentType = .random

    let textInputCounterLimit: Int = 100

    var titleAccessibilityLabel: String = ""
    var helperAccessibilityLabel: String = ""
    var secondaryHelperAccessibilityLabel: String = ""
    var secondaryHelperAccessibilityValue: String = ""

    var checkboxGroupConfiguration = CheckboxGroupConfiguration()
    var radioButtonConfiguration = RadioButtonGroupConfiguration()
    var stepperConfiguration = StepperConfiguration()
    var textEditorConfiguration = TextEditorConfiguration()
    var textFieldConfiguration = TextFieldConfiguration()

    // MARK: - Initialization

    init(componentType: FormFieldComponentType) {
        self.componentType = componentType
        super.init()
        self.setup()
    }

    required init() {
        super.init()
        self.setup()
    }

    // MARK: - Setup

    private func setup() {
        self.checkboxGroupConfiguration.isEnabled.value = true
        self.checkboxGroupConfiguration.layout = .vertical
        self.checkboxGroupConfiguration.numberOfItems = 2
        for (index, _) in self.checkboxGroupConfiguration.items.enumerated() {
            self.checkboxGroupConfiguration.items[index].isLongText = false
            self.checkboxGroupConfiguration.items[index].isAttributedText = false
            self.checkboxGroupConfiguration.items[index].isEnabled = true
        }

        self.radioButtonConfiguration.isEnabled.value = true
        self.radioButtonConfiguration.groupLayout = .vertical
        self.radioButtonConfiguration.numberOfItems = 2
        for (index, _) in self.radioButtonConfiguration.items.enumerated() {
            self.radioButtonConfiguration.items[index].isLongText = false
            self.radioButtonConfiguration.items[index].isAttributedText = false
        }

        self.stepperConfiguration.isEnabled.value = true

        self.textEditorConfiguration.isEnabled.value = true
        self.textEditorConfiguration.uiKitIsEditable = true

        self.textFieldConfiguration.isEnabled.value = true
        self.textFieldConfiguration.isReadOnly = false
    }
}
