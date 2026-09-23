//
//  ColorsBase.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ColorsBase: Hashable, Equatable {

    // MARK: - Background

    var background: any ColorToken { get }
    var onBackground: any ColorToken { get }
    var backgroundVariant: any ColorToken { get }
    var onBackgroundVariant: any ColorToken { get }

    // MARK: - Surface

    var surface: any ColorToken { get }
    var onSurface: any ColorToken { get }
    var surfaceInverse: any ColorToken { get }
    var onSurfaceInverse: any ColorToken { get }
    var surfaceDark: any ColorToken { get }
    var onSurfaceDark: any ColorToken { get }

    // MARK: - Outline

    var outline: any ColorToken { get }
    var outlineHigh: any ColorToken { get }

    // MARK: - Overlay

    var overlay: any ColorToken { get }
    var onOverlay: any ColorToken { get }
}

// MARK: - Hashable & Equatable

public extension ColorsBase {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.background)
        hasher.combine(self.onBackground)
        hasher.combine(self.backgroundVariant)
        hasher.combine(self.onBackgroundVariant)

        hasher.combine(self.surface)
        hasher.combine(self.onSurface)
        hasher.combine(self.surfaceInverse)
        hasher.combine(self.onSurfaceInverse)
        hasher.combine(self.surfaceDark)
        hasher.combine(self.onSurfaceDark)

        hasher.combine(self.outline)
        hasher.combine(self.outlineHigh)

        hasher.combine(self.overlay)
        hasher.combine(self.onOverlay)
    }

    func equals(_ other: any ColorsBase) -> Bool {
        return self.background.equals(other.background) &&
        self.onBackground.equals(other.onBackground) &&
        self.backgroundVariant.equals(other.backgroundVariant) &&
        self.onBackgroundVariant.equals(other.onBackgroundVariant) &&

        self.surface.equals(other.surface) &&
        self.onSurface.equals(other.onSurface) &&
        self.surfaceInverse.equals(other.surfaceInverse) &&
        self.onSurfaceInverse.equals(other.onSurfaceInverse) &&
        self.surfaceDark.equals(other.surfaceDark) &&
        self.onSurfaceDark.equals(other.onSurfaceDark) &&

        self.outline.equals(other.outline) &&
        self.outlineHigh.equals(other.outlineHigh) &&

        self.overlay.equals(other.overlay) &&
        self.onOverlay.equals(other.onOverlay) &&

        self.background.equals(other.background) &&
        self.onBackground.equals(other.onBackground)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

