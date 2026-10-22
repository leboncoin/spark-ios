//
//  UIContentSizeCategory+PaddingExtension.swift
//  SparkCoreSnapshotTests
//
//  Created by Robin Lemaire on 09/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit

extension UIContentSizeCategory {

    var padding: CGFloat {
        switch self {
        case .extraSmall: 8
        case .small: 8
        case .medium: 10
        case .large: 10
        case .extraLarge: 10
        case .extraExtraLarge: 12
        case .extraExtraExtraLarge: 14
        case .accessibilityMedium: 20
        case .accessibilityLarge: 20
        case .accessibilityExtraLarge: 20
        case .accessibilityExtraExtraLarge: 20
        case .accessibilityExtraExtraExtraLarge: 20
        default: 10
        }
    }
}
