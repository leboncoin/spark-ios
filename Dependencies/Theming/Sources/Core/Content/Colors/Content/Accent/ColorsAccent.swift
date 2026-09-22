//
//  ColorsAccent.swift
//  SparkDemo
//
//  Created by louis.borlee on 01/08/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ColorsAccent: Hashable, Equatable {
    var accent: any ColorToken { get }
    var onAccent: any ColorToken { get }
    var accentVariant: any ColorToken { get }
    var onAccentVariant: any ColorToken { get }
    var accentContainer: any ColorToken { get }
    var onAccentContainer: any ColorToken { get }
}

// MARK: - Hashable & Equatable

public extension ColorsAccent {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.accent)
        hasher.combine(self.onAccent)
        hasher.combine(self.accentVariant)
        hasher.combine(self.onAccentVariant)
        hasher.combine(self.accentContainer)
        hasher.combine(self.onAccentContainer)
    }

    func equals(_ other: any ColorsAccent) -> Bool {
        return self.accent.equals(other.accent) &&
        self.onAccent.equals(other.onAccent) &&
        self.accentVariant.equals(other.accentVariant) &&
        self.onAccentVariant.equals(other.onAccentVariant) &&
        self.accentContainer.equals(other.accentContainer) &&
        self.onAccentContainer.equals(other.onAccentContainer)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
