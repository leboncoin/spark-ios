//
//  IconographySize.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum IconographySize: CGFloat, CaseIterable, Hashable {
    case xSmall = 16
    case small = 24
    case medium = 32
    case large = 48
    case xLarge = 64

    // MARK: - Properties

    var name: String {
        switch self {
        case .xSmall: "Extra small"
        case .small: "Small"
        case .medium: "Medium"
        case .large: "Large"
        case .xLarge: "Extra large"
        }
    }
}
