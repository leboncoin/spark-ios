//
//  FormFieldConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
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

    var titleAccessibilityLabel: String = ""
    var helperAccessibilityLabel: String = ""
    var secondaryHelperAccessibilityLabel: String = ""
    var secondaryHelperAccessibilityValue: String = ""

    var checkboxGroupConfiguration = CheckboxGroupConfiguration()
    var radioButtonConfiguration = RadioButtonGroupConfiguration()
    var textEditorConfiguration = TextEditorConfiguration()
    var textFieldConfiguration = TextFieldConfiguration()
}
