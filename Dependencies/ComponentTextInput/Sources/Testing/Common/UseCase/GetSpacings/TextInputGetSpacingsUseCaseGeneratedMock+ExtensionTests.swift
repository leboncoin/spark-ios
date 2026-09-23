//
//  TextInputGetSpacingsUseCaseGeneratedMock+ExtensionTests.swift
//  SparkTextFieldUnitTests
//
//  Created by louis.borlee on 01/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentTextInput

extension TextInputGetSpacingsUseCaseableGeneratedMock {
    static func mocked(returnedSpacings: TextInputSpacings) -> TextInputGetSpacingsUseCaseableGeneratedMock {
        let mock = TextInputGetSpacingsUseCaseableGeneratedMock()
        mock.executeWithThemeAndBorderStyleReturnValue = returnedSpacings
        return mock
    }
}
