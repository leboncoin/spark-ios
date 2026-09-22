//
//  Theme.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

// sourcery: AutoMockable
public protocol Theme: Hashable, Equatable {
    var border: any SparkTheming.Border { get }
    var colors: any SparkTheming.Colors { get }
    var elevation: any SparkTheming.Elevation { get }
    var layout: any SparkTheming.Layout { get }
    var typography: any SparkTheming.Typography { get }
    var dims: any SparkTheming.Dims { get }
}

// MARK: - Hashable & Equatable

public extension Theme {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.border)
        hasher.combine(self.colors)
        hasher.combine(self.elevation)
        hasher.combine(self.layout)
        hasher.combine(self.typography)
        hasher.combine(self.dims)
    }

    func equals(_ other: any Theme) -> Bool {
        return self.border.equals(other.border) &&
        self.colors.equals(other.colors) &&
        self.elevation.equals(other.elevation) &&
        self.layout.equals(other.layout) &&
        self.typography.equals(other.typography) &&
        self.dims.equals(other.dims)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

// MARK: - Optional Extension

public extension Optional where Wrapped == any Theme {

    func equals(_ other: (any Theme)?) -> Bool {
        switch (self, other) {
        case (.none, .none):
            return true

        case (.none, .some), (.some, .none):
            return false

        case (let lhs?, let rhs?):
            return lhs.equals(rhs)
        }
    }
}
