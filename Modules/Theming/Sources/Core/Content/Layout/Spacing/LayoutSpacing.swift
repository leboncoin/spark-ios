//
//  LayoutSpacing.swift
//  SparkTheming
//
//  Created by robin.lemaire on 05/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol LayoutSpacing: Hashable, Equatable {
    var none: CGFloat { get }
    var small: CGFloat { get }
    var medium: CGFloat { get }
    var large: CGFloat { get }
    var xLarge: CGFloat { get }
    var xxLarge: CGFloat { get }
    var xxxLarge: CGFloat { get }
}

public extension LayoutSpacing {
    var none: CGFloat { 0 }
}

// MARK: - Hashable & Equatable

public extension LayoutSpacing {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.none)
        hasher.combine(self.small)
        hasher.combine(self.medium)
        hasher.combine(self.large)
        hasher.combine(self.xLarge)
        hasher.combine(self.xxLarge)
        hasher.combine(self.xxxLarge)
    }

    func equals(_ other: any LayoutSpacing) -> Bool {
        return self.none == other.none &&
        self.small == other.small &&
        self.medium == other.medium &&
        self.large == other.large &&
        self.xLarge == other.xLarge &&
        self.xxLarge == other.xxLarge &&
        self.xxxLarge == other.xxxLarge
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
