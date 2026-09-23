//
//  FormFieldAccessibilityIdentifier.swift
//  SparkComponentFormField
//
//  Created by alican.aycil on 30.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation

public enum FormFieldAccessibilityIdentifier {

    // MARK: - Properties

    public static let formField = "spark-formfield"
    @available(*, deprecated, message: "Replaced by formFieldTitle")
    public static let formFieldLabel = FormFieldAccessibilityIdentifier.formFieldTitle
    public static let formFieldTitle = "spark-formfield-title"
    public static let formFieldClearButton = "spark-formfield-clear-button"
    public static let formFieldHelperImage = "spark-formfield-helper-image"
    public static let formFieldHelperMessage = "spark-formfield-helper-message"
    public static let formFieldSecondaryHelperMessage = "spark-formfield-secondary-helper-message"
}
