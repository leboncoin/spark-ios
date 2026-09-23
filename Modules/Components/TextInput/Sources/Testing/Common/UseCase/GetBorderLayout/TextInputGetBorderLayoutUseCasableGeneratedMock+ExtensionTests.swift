//
//  TextInputGetBorderLayoutUseCaseableGeneratedMock+ExtensionTests.swift
//  SparkTextFieldUnitTests
//
//  Created by louis.borlee on 01/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentTextInput

extension TextInputGetBorderLayoutUseCaseableGeneratedMock {

    static func mocked(returnedBorderLayout: TextInputBorderLayout) -> TextInputGetBorderLayoutUseCaseableGeneratedMock {
        let mock = TextInputGetBorderLayoutUseCaseableGeneratedMock()
        mock.executeWithThemeAndBorderStyleAndIsFocusedReturnValue = returnedBorderLayout
        return mock
    }
}

