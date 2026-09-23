//
//  ElevationShadow.swift
//  SparkTheming
//
//  Created by louis.borlee on 27/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol ElevationShadow: Hashable, Equatable {
    var offset: CGPoint { get }
    var blur: CGFloat { get }
    var colorToken: any ColorToken { get }
    var opacity: Float { get }
}

// MARK: - Hashable & Equatable

public extension ElevationShadow {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.offset.y)
        hasher.combine(self.offset.x)
        hasher.combine(self.blur)
        hasher.combine(self.colorToken)
        hasher.combine(self.opacity)
    }

    func equals(_ other: any ElevationShadow) -> Bool {
        return self.offset == other.offset &&
        self.blur == other.blur &&
        self.colorToken.equals(other.colorToken) &&
        self.opacity == other.opacity
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

internal extension ElevationShadow {

    func shadowEquals(_ other: any ElevationShadow) -> Bool {
        return self.equals(other)
    }
}
