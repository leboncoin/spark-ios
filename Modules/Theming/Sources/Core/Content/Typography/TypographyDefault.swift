//
//  TypographyDefault.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit

public struct TypographyDefault: Typography {

    // MARK: - Properties

    public let bigTitle: any TypographyFontToken

    public let display1: any TypographyFontToken
    public let display2: any TypographyFontToken
    public let display3: any TypographyFontToken

    public let headline1: any TypographyFontToken
    public let headline2: any TypographyFontToken

    public let subhead: any TypographyFontToken

    public let body1: any TypographyFontToken
    public let body1Highlight: any TypographyFontToken

    public let body2: any TypographyFontToken
    public let body2Highlight: any TypographyFontToken

    public let caption: any TypographyFontToken
    public let captionHighlight: any TypographyFontToken

    public let small: any TypographyFontToken
    public let smallHighlight: any TypographyFontToken

    public let callout: any TypographyFontToken

    // MARK: - Initialization

    public init(
        bigTitle: any TypographyFontToken,
        display1: any TypographyFontToken,
        display2: any TypographyFontToken,
        display3: any TypographyFontToken,
        headline1: any TypographyFontToken,
        headline2: any TypographyFontToken,
        subhead: any TypographyFontToken,
        body1: any TypographyFontToken,
        body1Highlight: any TypographyFontToken,
        body2: any TypographyFontToken,
        body2Highlight: any TypographyFontToken,
        caption: any TypographyFontToken,
        captionHighlight: any TypographyFontToken,
        small: any TypographyFontToken,
        smallHighlight: any TypographyFontToken,
        callout: any TypographyFontToken
    ) {
        self.bigTitle = bigTitle
        self.display1 = display1
        self.display2 = display2
        self.display3 = display3
        self.headline1 = headline1
        self.headline2 = headline2
        self.subhead = subhead
        self.body1 = body1
        self.body1Highlight = body1Highlight
        self.body2 = body2
        self.body2Highlight = body2Highlight
        self.caption = caption
        self.captionHighlight = captionHighlight
        self.small = small
        self.smallHighlight = smallHighlight
        self.callout = callout
    }

    // MARK: - Methods

    public func custom(
        size: CGFloat,
        weight: TypographyFontWeight,
        style: TypographyFontStyle
    ) -> any TypographyFontToken {
        TypographyFontTokenClear()
    }
}
