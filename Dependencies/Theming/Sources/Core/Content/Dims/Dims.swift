//
//  Dims.swift
//  SparkDemo
//
//  Created by louis.borlee on 22/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol Dims: Hashable, Equatable {
    var none: CGFloat { get }
    var dim1: CGFloat { get }
    var dim2: CGFloat { get }
    var dim3: CGFloat { get }
    var dim4: CGFloat { get }
    var dim5: CGFloat { get }
    var full: CGFloat { get }
}

public extension Dims {
    /// None corresponding to 1.0 value
    var none: CGFloat {
        return 1.0
    }

    /// None corresponding to 0 value
    var full: CGFloat {
        return 0
    }
}

// MARK: - Hashable & Equatable

public extension Dims {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.none)
        hasher.combine(self.dim1)
        hasher.combine(self.dim2)
        hasher.combine(self.dim3)
        hasher.combine(self.dim4)
        hasher.combine(self.dim5)
        hasher.combine(self.full)
    }

    func equals(_ other: any Dims) -> Bool {
        return self.none == other.none &&
        self.dim1 == other.dim1 &&
        self.dim2 == other.dim2 &&
        self.dim3 == other.dim3 &&
        self.dim4 == other.dim4 &&
        self.dim5 == other.dim5 &&
        self.full == other.full
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
