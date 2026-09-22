//
//  SkyElevation.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/08/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

struct SkyElevation: Elevation {
    let dropShadow: any (ElevationDropShadows & ElevationShadow) = SkyDropShadow()
}

struct SkyDropShadow: ElevationDropShadows & ElevationShadow, Equatable, Hashable {

    let small: any ElevationShadow = ElevationShadowDefault(
        offset: .init(x: 0, y: 1),
        blur: 2,
        colorToken: SkyColorTokenShadow(),
        opacity: 0.20)
    let medium: any ElevationShadow = ElevationShadowDefault(
        offset: .init(x: 0, y: 6),
        blur: 12,
        colorToken: SkyColorTokenShadow(),
        opacity: 0.20)
    let large: any ElevationShadow = ElevationShadowDefault(
        offset: .init(x: 0, y: 8),
        blur: 16,
        colorToken: SkyColorTokenShadow(),
        opacity: 0.20)
    let extraLarge: any ElevationShadow = ElevationShadowDefault(
        offset: .init(x: 0, y: 12),
        blur: 24,
        colorToken: SkyColorTokenShadow(),
        opacity: 0.20)

    let offset: CGPoint = .init(x: 0, y: 4)
    let blur: CGFloat = 8
    let colorToken: any ColorToken = SkyColorTokenShadow()
    let opacity: Float = 0.20
}

// MARK: - Hashable & Equatable

extension SkyDropShadow {

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

    func equals(_ other: Self) -> Bool {
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

fileprivate struct SkyColorTokenShadow: ColorToken {
    var uiColor: UIColor { .black }
    var color: Color { .black }
}
