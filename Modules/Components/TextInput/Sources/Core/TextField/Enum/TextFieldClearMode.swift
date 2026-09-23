//
//  TextFieldClearMode.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 04/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// Constants that define when clear button appear in a **swiftUI** text field.
public enum TextFieldClearMode: CaseIterable {
    /// The view never appears.
    case never
    /// The view is displayed only while text is being edited in the text field.
    case whileEditing
    /// The view is displayed only when text is not being edited.
    case unlessEditing
    /// The view is always displayed if the text field contains text.
    case always

    // MARK: - Properties

    public static let `default`: Self = .never

    // MARK: - Methods

    @available(*, deprecated, message: "Please use TextFieldGetIsClearButtonUseCase instead.")
    internal func showClearButton(isFocused: Bool) -> Bool {
        switch self {
        case .never:
            return false
        case .always:
            return true
        case .whileEditing:
            return isFocused
        case .unlessEditing:
            return !isFocused
        }
    }
}
