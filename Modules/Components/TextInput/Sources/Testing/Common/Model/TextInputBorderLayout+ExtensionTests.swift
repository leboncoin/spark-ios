//
//  TextInputBorderLayout+ExtensionTests.swift
//  SparkTextFieldUnitTests
//
//  Created by louis.borlee on 01/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentTextInput

extension TextInputBorderLayout {
    static func mocked(radius: CGFloat, width: CGFloat) -> TextInputBorderLayout {
        return .init(radius: radius, width: width)
    }
}
