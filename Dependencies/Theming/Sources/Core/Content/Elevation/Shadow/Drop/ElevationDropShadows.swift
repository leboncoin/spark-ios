//
//  ElevationDropShadows.swift
//  SparkTheming
//
//  Created by louis.borlee on 27/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ElevationDropShadows: Hashable, Equatable {
    var none: any ElevationShadow { get }
    var small: any ElevationShadow { get }
    var medium: any ElevationShadow { get }
    var large: any ElevationShadow { get }
    var extraLarge: any ElevationShadow { get }
}

public extension ElevationDropShadows {
    var none: any ElevationShadow {
        ElevationShadowDefault(
            offset: .zero,
            blur: 0,
            colorToken: ColorTokenDefault.clear,
            opacity: 0
        )
    }
}

// MARK: - Hashable & Equatable

public extension ElevationDropShadows {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.small)
        hasher.combine(self.medium)
        hasher.combine(self.large)
        hasher.combine(self.extraLarge)
    }

    func equals(_ other: any ElevationDropShadows) -> Bool {
        return self.none.equals(other.none) &&
        self.small.equals(other.small) &&
        self.medium.equals(other.medium) &&
        self.large.equals(other.large) &&
        self.extraLarge.equals(other.extraLarge)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

internal extension ElevationDropShadows {

    func dropShadowEquals(_ other: any ElevationDropShadows) -> Bool {
        return self.equals(other)
    }
}
