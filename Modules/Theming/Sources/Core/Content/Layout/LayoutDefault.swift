//
//  LayoutDefault.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

public struct LayoutDefault: Layout {

    // MARK: - Properties

    public let spacing: any LayoutSpacing

    // MARK: - Initialization

    public init(spacing: any LayoutSpacing) {
        self.spacing = spacing
    }
}

// MARK: - Hashable & Equatable

public extension LayoutDefault {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.spacing)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.spacing.equals(rhs.spacing)
    }
}

