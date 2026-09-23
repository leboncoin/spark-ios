//
//  Elevation.swift
//  SparkTheming
//
//  Created by louis.borlee on 27/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol Elevation: Hashable, Equatable {
    var dropShadow: any (ElevationShadow & ElevationDropShadows) { get }
}

// MARK: - Hashable & Equatable

public extension Elevation {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.dropShadow)
    }

    func equals(_ other: any Elevation) -> Bool {
        return self.dropShadow.dropShadowEquals(other.dropShadow) &&
        self.dropShadow.shadowEquals(other.dropShadow)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
