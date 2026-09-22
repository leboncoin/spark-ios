//
//  Layout.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol Layout: Hashable, Equatable {
    var spacing: any LayoutSpacing { get }
}

// MARK: - Hashable & Equatable

public extension Layout {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.spacing)
    }

    func equals(_ other: any Layout) -> Bool {
        return self.spacing.equals(other.spacing)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
