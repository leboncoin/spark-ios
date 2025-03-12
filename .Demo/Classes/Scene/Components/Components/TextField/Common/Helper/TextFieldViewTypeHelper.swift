//
//  TextFieldViewTypeHelper.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// swiftlint:disable no_debugging_method
struct TextFieldViewTypeHelper {

    static func getType(from configuration: TextFieldConfiguration) -> TextFieldViewType {
        if configuration.isSecure {
            return .secure {
                print("Secure: On commit called")
            }
        } else {
            return .standard { isEditing in
                print("Standard: On editing changed called with isEditing \(isEditing)")
            } onCommit: {
                print("Standard: On commit called")
            }
        }
    }
}
