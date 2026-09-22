//
//  ColorsFocus.swift
//  SparkTheming
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ColorsFocus: Hashable, Equatable {
    var focus: any ColorToken { get }
    var onFocus: any ColorToken { get }
    var focusContainer: any ColorToken { get }
    var onFocusContainer: any ColorToken { get }
}

// MARK: - Hashable & Equatable

public extension ColorsFocus {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.focus)
        hasher.combine(self.onFocus)
        hasher.combine(self.focusContainer)
        hasher.combine(self.onFocusContainer)
    }

    func equals(_ other: any ColorsFocus) -> Bool {
        return self.focus.equals(other.focus) &&
        self.onFocus.equals(other.onFocus) &&
        self.focusContainer.equals(other.focusContainer) &&
        self.onFocusContainer.equals(other.onFocusContainer)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
