//
//  BorderRadius.swift
//  SparkTheming
//
//  Created by robin.lemaire on 05/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol BorderRadius: Hashable, Equatable {
    var none: CGFloat { get }
    var small: CGFloat { get }
    var medium: CGFloat { get }
    var large: CGFloat { get }
    var xLarge: CGFloat { get }
    var full: CGFloat { get }
}

public extension BorderRadius {
    var none: CGFloat { 0 }
    var full: CGFloat { .infinity }
}

// MARK: - Hashable & Equatable

public extension BorderRadius {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.none)
        hasher.combine(self.small)
        hasher.combine(self.medium)
        hasher.combine(self.large)
        hasher.combine(self.xLarge)
        hasher.combine(self.full)
    }

    func equals(_ other: any BorderRadius) -> Bool {
        return self.none == other.none &&
        self.small == other.small &&
        self.medium == other.medium &&
        self.large == other.large &&
        self.xLarge == other.xLarge &&
        self.full == other.full
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
