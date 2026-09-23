//
//  SparkElevation.swift
//  SparkTheme
//
//  Created by louis.borlee on 30/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import SparkTheming

struct SparkElevation: Elevation {

    // MARK: - Properties

    let dropShadow: any (ElevationDropShadows & ElevationShadow) = SparkDropShadow()

    // MARK: - Initialization

    init() {}
}

// MARK: - Drop Shadow

struct SparkDropShadow: ElevationDropShadows & ElevationShadow, Equatable, Hashable {

    // MARK: - Properties

    let small: any ElevationShadow = ElevationShadowDefault(
        offset: .init(x: 0, y: 1),
        blur: 2,
        colorToken: ColorTokenDefault(named: "shadow", in: Bundle.module),
        opacity: 0.5
    )
    let medium: any ElevationShadow = ElevationShadowDefault(
        offset: .init(x: 0, y: 6),
        blur: 12,
        colorToken: ColorTokenDefault(named: "shadow", in: Bundle.module),
        opacity: 0.5
    )
    let large: any ElevationShadow = ElevationShadowDefault(
        offset: .init(x: 0, y: 8),
        blur: 16,
        colorToken: ColorTokenDefault(named: "shadow", in: Bundle.module),
        opacity: 0.5
    )
    let extraLarge: any ElevationShadow = ElevationShadowDefault(
        offset: .init(x: 0, y: 12),
        blur: 24,
        colorToken: ColorTokenDefault(named: "shadow", in: Bundle.module),
        opacity: 0.5
    )

    let offset: CGPoint = .init(x: 0, y: 4)
    let blur: CGFloat = 8
    let colorToken: any ColorToken = ColorTokenDefault(named: "shadow", in: Bundle.module)
    let opacity: Float = 0.5

    // MARK: - Initialization

    init() {}
}

// MARK: - Hashable & Equatable

extension SparkDropShadow {

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

    func equals(_ other: SparkDropShadow) -> Bool {
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

fileprivate struct SparkColorTokenShadow: ColorToken {
    var uiColor: UIColor { .black }
    var color: Color { .black }
}
