//
//  DividerSeparatorWidthType.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 17/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

enum DividerSeparatorWidthType {
    /// The separator has a fixed width
    case fixed
    /// The separator has a dynamic width
    case dynamic
    /// The separators have an equals width
    case equal

    // MARK: - Static Properties

    static var `default`: Self = .equal

    // MARK: - Properties

    var isEqual: Bool {
        switch self {
        case .equal: true
        default: false
        }
    }

    var isFixed: Bool {
        switch self {
        case .fixed: true
        default: false
        }
    }
}
