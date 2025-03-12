//
//  FormFieldComponentType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

enum FormFieldComponentType: String, CaseIterable {
    case checkbox
    case radioButton
    case stepper
    case textEditor
    case textField

    // MARK: - Properties

    var isSecondaryHelper: Bool {
        switch self {
        case .textEditor, .textField: true
        default: false
        }
    }
}
