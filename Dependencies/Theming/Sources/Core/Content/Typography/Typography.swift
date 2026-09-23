//
//  Typography.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// sourcery: AutoMockable
public protocol Typography: Hashable, Equatable {
    var bigTitle: any TypographyFontToken { get }

    var display1: any TypographyFontToken { get }
    var display2: any TypographyFontToken { get }
    var display3: any TypographyFontToken { get }

    var headline1: any TypographyFontToken { get }
    var headline2: any TypographyFontToken { get }

    var subhead: any TypographyFontToken { get }

    var body1: any TypographyFontToken { get }
    var body1Highlight: any TypographyFontToken { get }

    var body2: any TypographyFontToken { get }
    var body2Highlight: any TypographyFontToken { get }

    var caption: any TypographyFontToken { get }
    var captionHighlight: any TypographyFontToken { get }

    var small: any TypographyFontToken { get }
    var smallHighlight: any TypographyFontToken { get }

    var callout: any TypographyFontToken { get }

    func custom(
        size: CGFloat,
        weight: TypographyFontWeight,
        style: TypographyFontStyle
    ) -> any TypographyFontToken
}

// MARK: - Hashable & Equatable

public extension Typography {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.bigTitle)

        hasher.combine(self.display1)
        hasher.combine(self.display2)
        hasher.combine(self.display3)

        hasher.combine(self.headline1)
        hasher.combine(self.headline2)

        hasher.combine(self.subhead)

        hasher.combine(self.body1)
        hasher.combine(self.body1Highlight)

        hasher.combine(self.body2)
        hasher.combine(self.body2Highlight)

        hasher.combine(self.caption)
        hasher.combine(self.captionHighlight)

        hasher.combine(self.small)
        hasher.combine(self.smallHighlight)

        hasher.combine(self.callout)
    }

    func equals(_ other: any Typography) -> Bool {
        return self.bigTitle.equals(other.bigTitle) &&

        self.display1.equals(other.display1) &&
        self.display2.equals(other.display2) &&
        self.display3.equals(other.display3) &&

        self.headline1.equals(other.headline1) &&
        self.headline2.equals(other.headline2) &&

        self.subhead.equals(other.subhead) &&

        self.body1.equals(other.body1) &&
        self.body1Highlight.equals(other.body1Highlight) &&

        self.body2.equals(other.body2) &&
        self.body2Highlight.equals(other.body2Highlight) &&

        self.caption.equals(other.caption) &&
        self.captionHighlight.equals(other.captionHighlight) &&

        self.small.equals(other.small) &&
        self.smallHighlight.equals(other.smallHighlight) &&

        self.callout.equals(other.callout)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

