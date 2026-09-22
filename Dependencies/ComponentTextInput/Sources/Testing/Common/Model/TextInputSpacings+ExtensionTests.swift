//
//  TextInputSpacings+ExtensionTests.swift
//  SparkTextFieldUnitTests
//
//  Created by louis.borlee on 01/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentTextInput

extension TextInputSpacings {
    static func mocked(horizontal: CGFloat, content: CGFloat) -> TextInputSpacings {
        return .init(horizontal: horizontal, content: content)
    }
}
