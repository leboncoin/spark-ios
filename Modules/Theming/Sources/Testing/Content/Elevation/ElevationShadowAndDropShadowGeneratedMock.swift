//
//  ElevationShadowAndDropShadowGeneratedMock.swift
//  SparkTheming
//
//  Created by robin.lemaire on 05/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkTheming
import Foundation

@_spi(SI_SPI) public final class ElevationShadowAndDropShadowGeneratedMock: ElevationShadow & ElevationDropShadows, Hashable, Equatable {

    public var underlyingOffset: CGPoint!
    public var offset: CGPoint {
        get { return underlyingOffset }
        set(value) { underlyingOffset = value }
    }

    public var underlyingBlur: CGFloat!
    public var blur: CGFloat {
        get { return underlyingBlur }
        set(value) { underlyingBlur = value }
    }

    public var underlyingColorToken: (any SparkTheming.ColorToken)!
    public var colorToken: any SparkTheming.ColorToken {
        get { return underlyingColorToken }
        set(value) { underlyingColorToken = value }
    }

    public var underlyingOpacity: Float!
    public var opacity: Float {
        get { return underlyingOpacity }
        set(value) { underlyingOpacity = value }
    }

    public var underlyingSmall: (any SparkTheming.ElevationShadow)!
    public var small: any SparkTheming.ElevationShadow {
        get { return underlyingSmall }
        set(value) { underlyingSmall = value }
    }

    public var underlyingMedium: (any SparkTheming.ElevationShadow)!
    public var medium: any SparkTheming.ElevationShadow {
        get { return underlyingMedium }
        set(value) { underlyingMedium = value }
    }

    public var underlyingLarge: (any SparkTheming.ElevationShadow)!
    public var large: any SparkTheming.ElevationShadow {
        get { return underlyingLarge }
        set(value) { underlyingLarge = value }
    }

    public var underlyingExtraLarge: (any SparkTheming.ElevationShadow)!
    public var extraLarge: any SparkTheming.ElevationShadow {
        get { return underlyingExtraLarge }
        set(value) { underlyingExtraLarge = value }
    }

    // MARK: - Initialization

    public init() {}
}

// MARK: - Hashable & Equatable

@_spi(SI_SPI) public extension ElevationShadowAndDropShadowGeneratedMock {

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

    func equals(_ other: ElevationShadowAndDropShadowGeneratedMock) -> Bool {
        return self.small.equals(other.small) &&
        self.medium.equals(other.medium) &&
        self.large.equals(other.large) &&
        self.extraLarge.equals(other.extraLarge) &&
        self.offset == other.offset &&
        self.blur == other.blur &&
        self.colorToken.equals(other.colorToken) &&
        self.opacity == other.opacity
    }

    static func == (lhs: ElevationShadowAndDropShadowGeneratedMock, rhs: ElevationShadowAndDropShadowGeneratedMock) -> Bool {
        return lhs.equals(rhs)
    }
}
