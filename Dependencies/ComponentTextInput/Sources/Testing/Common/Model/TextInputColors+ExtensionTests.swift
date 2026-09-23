//
//  TextInputColors+ExtensionTests.swift
//  SparkTextFieldUnitTests
//
//  Created by louis.borlee on 01/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkThemingTesting

extension TextInputColors {
    static func mocked(
        text: ColorTokenGeneratedMock,
        placeholder: ColorTokenGeneratedMock,
        border: ColorTokenGeneratedMock,
        background: ColorTokenGeneratedMock
    ) -> TextInputColors {
        return .init(
            text: text,
            placeholder: placeholder,
            border: border,
            background: background
        )
    }
}
