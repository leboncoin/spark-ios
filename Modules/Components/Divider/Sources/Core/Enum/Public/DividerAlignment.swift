//
//  DividerAlignment.swift
//  SparkComponentDivider
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

/// The alignment of the divider.
public enum DividerAlignment: CaseIterable {
    case top
    case trailing
    case bottom
    case leading
    case center

    // MARK: - Properties

    /// The default case. Equals to **.center**.
    public static let `default`: Self = .center
}
