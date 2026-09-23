//
//  BadgeFormat.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

enum BadgeFormat: String, CaseIterable {
    case `default`
    case custom
    case overflowCounter

    // MARK: - Methodsz

    func sparkValue(customText: String, overflowValue: Int) -> SparkComponentBadge.BadgeFormat {
        switch self {
        case .default: .default
        case .custom: .custom(formatter: BadgePreviewFormatter(text: " " + customText))
        case .overflowCounter: .overflowCounter(maxValue: overflowValue)
        }
    }
}

// MARK: - Formatter

private struct BadgePreviewFormatter: BadgeFormatting {

    let text: String

    func formatText(for value: Int?) -> String {
        guard let value else {
            return "_"
        }
        return self.text + "\(value)"
    }
}
