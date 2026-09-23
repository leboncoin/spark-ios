//
//  TextInputPlaceholder.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 05/06/2025.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

enum TextInputPlaceholder: String, CaseIterable {
    case empty
    case small
    case multiline

    static func allCases(isSwiftUIComponent: Bool) -> [Self] {
        isSwiftUIComponent ? [.empty, .small] : Self.allCases
    }

    var text: String? {
        switch self {
        case .empty: nil
        case .small: "My placeholder"
        case .multiline: "My placeholder. Duis aute irure dolor in reprehenderit in voluptate velit."
        }
    }
}
