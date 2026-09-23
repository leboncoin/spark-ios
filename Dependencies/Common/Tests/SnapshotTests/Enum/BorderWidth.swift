//
//  BorderWidth.swift
//  SparkDemo
//
//  Created by robin.lemaire on 20/20/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
import SparkTheme

enum BorderWidth: String, CaseIterable {
    case small
    case medium

    // MARK: - Methods

    func value(from theme: any Theme) -> CGFloat {
        let radius = theme.border.width

        return switch self {
        case .small: radius.small
        case .medium: radius.medium
        }
    }
}
