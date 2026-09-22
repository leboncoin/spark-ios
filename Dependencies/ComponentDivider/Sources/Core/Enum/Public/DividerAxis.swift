//
//  DividerIntent.swift
//  SparkComponentDivider
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit

/// The axis of the divider.
public enum DividerAxis: CaseIterable {
    case horizontal
    case vertical

    // MARK: - Properties

    /// The default case. Equals to **.horizontal**.
    public static let `default`: Self = .horizontal

    var uikit: NSLayoutConstraint.Axis {
        switch self {
        case .horizontal: .horizontal
        case .vertical: .vertical
        }
    }
}
