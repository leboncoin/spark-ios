//
//  RainbowElevation.swift
//  SparkTheming
//
//  Created by robin.lemaire on 14/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

struct RainbowElevation: Elevation {

    // MARK: - Properties

    let dropShadow: any (ElevationDropShadows & ElevationShadow) = RainbowDropShadow()

    // MARK: - Initialization

    init() {}
}

// MARK: - Drop Shadow

struct RainbowDropShadow: ElevationDropShadows & ElevationShadow, Equatable, Hashable {

    // MARK: - Properties

    let small: any ElevationShadow = RainbowElevationShadow()
    let medium: any ElevationShadow = RainbowElevationShadow()
    let large: any ElevationShadow = RainbowElevationShadow()
    let extraLarge: any ElevationShadow = RainbowElevationShadow()

    let offset: CGPoint = .init(x: 0, y: 4)
    let blur: CGFloat = 8
    let colorToken: any ColorToken = RainbowColorToken()
    let opacity: Float = 0.5

    // MARK: - Initialization

    init() {}
}

// MARK: - Hashable & Equatable

extension RainbowDropShadow {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.small)
        hasher.combine(self.medium)
        hasher.combine(self.large)
        hasher.combine(self.extraLarge)
        hasher.combine(self.offset.y)
        hasher.combine(self.offset.x)
        hasher.combine(self.blur)
        hasher.combine(self.colorToken)
        hasher.combine(self.opacity)
    }

    func equals(_ other: RainbowDropShadow) -> Bool {
        return self.small.equals(other.small) &&
        self.medium.equals(other.medium) &&
        self.large.equals(other.large) &&
        self.extraLarge.equals(other.extraLarge) &&
        self.offset == other.offset &&
        self.blur == other.blur &&
        self.colorToken.equals(other.colorToken) &&
        self.opacity == other.opacity
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

// MARK: - Private Token

private struct RainbowElevationShadow: ElevationShadow {

    // MARK: - Properties

    let offset: CGPoint = .init(x: 0, y: 0)
    let blur: CGFloat = 10
    let colorToken: any ColorToken = RainbowColorToken()
    let opacity: Float = 0.8
}

private struct RainbowColorToken: ColorToken {
    let uiColor: UIColor = .red
    let color: Color = .red
}
