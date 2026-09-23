//
//  ScaledBorderType.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit

/// The scaled border type.
/// Use only on **SwiftUI** for a custom cornerRadius or borderRadius.
public enum ScaledBorderType {
    case dash
    case radius
    case width

    // MARK: - Properties

    internal var uiKitRelativeTo: UIFont.TextStyle {
        switch self {
        case .radius: .body
        case .dash, .width: .caption2
        }
    }

    internal var swiftUIRelativeTo: Font.TextStyle? {
        switch self {
        case .radius: nil
        case .dash, .width: .caption2
        }
    }

    internal var minValueFactor: CGFloat {
        switch self {
        case .dash, .width: 1
        case .radius: 1
        }
    }

    internal var maxValueFactor: CGFloat {
        switch self {
        case .dash, .width: 1.75
        case .radius: 1.2
        }
    }
}

// MARK: - Internal Extension

public extension LimitedScaledMetric {

    // MARK: - Initialization

    /// Init a limited scaled metric from a type for a custom content border
    init(value: CGFloat?, type: ScaledBorderType) {
        let value = value ?? .zero

        self.init(
            value: value,
            minFactor: type.minValueFactor,
            maxFactor: type.maxValueFactor,
            relativeTo: type.swiftUIRelativeTo
        )
    }
}
