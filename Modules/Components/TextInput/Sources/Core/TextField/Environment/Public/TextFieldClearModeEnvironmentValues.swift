//
//  TextFieldClearModeEnvironmentValues.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 04/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textFieldClearMode: TextFieldClearModeValue = .init()
}

public extension View {

    /// A mode that controls when the standard Clear button appears in the text field.
    ///
    /// The standard clear button displays at the right side of the text field when the text field has contents, providing a way for the user to remove text quickly.
    /// This button appears automatically based on the value of this property. The default value for this property is *TextFieldClearMode.never*.
    ///
    /// - Parameters:
    ///   - mode: The textfield's clear mode.
    ///   - customAction: The clear mode custom action. *Optional*.
    ///   If the customAction is nil AND if the content is a **string**, the default action **remove** the text.
    func sparkTextFieldClearMode(_ mode: TextFieldClearMode, customAction: (() -> Void)? = nil) -> some View {
        self.environment(\.textFieldClearMode, .init(mode: mode, action: customAction))
    }

    /// A mode that controls when the standard Clear button appears in the text field.
    ///
    /// The standard clear button displays at the right side of the text field when the text field has contents, providing a way for the user to remove text quickly.
    /// This button appears automatically based on the value of this property. The default value for this property is *TextFieldClearMode.never*.
    @available(*, deprecated, message: "Use sparkTextFieldClearMode instead !")
    func textFieldClearMode(_ mode: TextFieldClearMode) -> some View {
        self.environment(\.textFieldClearMode, .init(mode: mode))
    }
}
