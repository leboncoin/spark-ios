//
//  TextInputContentResilience.swift
//  SparkTextEditorSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

enum TextInputContentResilience: String, CaseIterable {
    case empty
    case smallText
    case multilineText

    static func allCases(isSwiftUIComponent: Bool) -> [Self] {
        isSwiftUIComponent ? [.empty, .smallText] : Self.allCases
    }

    static func allCases(isTextField: Bool) -> [Self] {
        isTextField ? [.empty, .smallText] : Self.allCases
    }

    var text: String {
        switch self {
        case .empty: ""
        case .smallText: "My text"
        case .multilineText: "My text. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        }
    }
}
