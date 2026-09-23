//
//  TextFieldGetIsClearButtonUseCase.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 11/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TextFieldGetIsClearButtonUseCaseable {
    func execute(clearMode: TextFieldClearMode, isFocused: Bool) -> Bool
}

final class TextFieldGetIsClearButtonUseCase: TextFieldGetIsClearButtonUseCaseable {

    // MARK: - Methods

    func execute(clearMode: TextFieldClearMode, isFocused: Bool) -> Bool {
        switch clearMode {
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
