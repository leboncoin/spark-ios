//
//  BorderWidth.swift
//  SparkTheming
//
//  Created by robin.lemaire on 05/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol BorderWidth: Hashable, Equatable {
    var none: CGFloat { get }
    var small: CGFloat { get }
    var medium: CGFloat { get }
}

public extension BorderWidth {
    var none: CGFloat { 0 }
}

// MARK: - Hashable & Equatable

public extension BorderWidth {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.none)
        hasher.combine(self.small)
        hasher.combine(self.medium)
    }

    func equals(_ other: any BorderWidth) -> Bool {
        return self.none == other.none &&
        self.small == other.small &&
        self.medium == other.medium
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
