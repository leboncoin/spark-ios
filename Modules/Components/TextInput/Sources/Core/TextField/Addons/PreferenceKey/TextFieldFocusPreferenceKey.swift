//
//  TextFieldFocusPreferenceKey.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 06/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "With SparkTextField, this PreferenceKey is no longer usefull.")
struct TextFieldFocusPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false

    static func reduce(value: inout Bool, nextValue: () -> Bool) {}
}
