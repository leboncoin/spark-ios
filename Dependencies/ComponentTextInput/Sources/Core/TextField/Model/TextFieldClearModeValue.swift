//
//  TextFieldClearModeValue.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 30/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

struct TextFieldClearModeValue: Equatable {

    // MARK: - Properties

    var mode: TextFieldClearMode = .default
    var action: (() -> Void)?

    // MARK: - Equatables

    static func == (lhs: TextFieldClearModeValue, rhs: TextFieldClearModeValue) -> Bool {
        lhs.mode == rhs.mode
    }
}
