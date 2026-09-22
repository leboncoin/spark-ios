//
//  TypographyGeneratedMock+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by michael.zimmermann on 10.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

public extension TypographyGeneratedMock {

    // MARK: - Methods

    static func mocked() -> TypographyGeneratedMock {
        let typography = TypographyGeneratedMock()

        typography.bigTitle = TypographyFontTokenGeneratedMock.mocked(.largeTitle)

        typography.display1 = TypographyFontTokenGeneratedMock.mocked(.title)
        typography.display2 = TypographyFontTokenGeneratedMock.mocked(.title2)
        typography.display3 = TypographyFontTokenGeneratedMock.mocked(.title3)

        typography.headline1 = TypographyFontTokenGeneratedMock.mocked(.headline)
        typography.headline2 = TypographyFontTokenGeneratedMock.mocked(.headline)

        typography.subhead = TypographyFontTokenGeneratedMock.mocked(.subheadline)

        typography.body1 = TypographyFontTokenGeneratedMock.mocked(.body)
        typography.body1Highlight = TypographyFontTokenGeneratedMock.mocked(.body.bold())
        typography.body2 = TypographyFontTokenGeneratedMock.mocked(.body)
        typography.body2Highlight = TypographyFontTokenGeneratedMock.mocked(.body.bold())

        typography.caption = TypographyFontTokenGeneratedMock.mocked(.caption)
        typography.captionHighlight = TypographyFontTokenGeneratedMock.mocked(.caption.bold())

        typography.small = TypographyFontTokenGeneratedMock.mocked(.caption2)
        typography.smallHighlight = TypographyFontTokenGeneratedMock.mocked(.caption2.bold())
        typography.subhead = TypographyFontTokenGeneratedMock.mocked(.subheadline)

        typography.callout = TypographyFontTokenGeneratedMock.mocked(.callout)

        typography.customWithSizeAndWeightAndStyleReturnValue = TypographyFontTokenGeneratedMock.mocked(.footnote)

        return typography
    }

    static func mocked2() -> TypographyGeneratedMock {
        let typography = TypographyGeneratedMock()

        typography.bigTitle = TypographyFontTokenGeneratedMock.mocked(.title)

        typography.display1 = TypographyFontTokenGeneratedMock.mocked(.title2)
        typography.display2 = TypographyFontTokenGeneratedMock.mocked(.title3)
        typography.display3 = TypographyFontTokenGeneratedMock.mocked(.headline)

        typography.headline1 = TypographyFontTokenGeneratedMock.mocked(.subheadline)
        typography.headline2 = TypographyFontTokenGeneratedMock.mocked(.body)

        typography.subhead = TypographyFontTokenGeneratedMock.mocked(.callout)

        typography.body1 = TypographyFontTokenGeneratedMock.mocked(.footnote)
        typography.body1Highlight = TypographyFontTokenGeneratedMock.mocked(.footnote.bold())
        typography.body2 = TypographyFontTokenGeneratedMock.mocked(.caption)
        typography.body2Highlight = TypographyFontTokenGeneratedMock.mocked(.caption.bold())

        typography.caption = TypographyFontTokenGeneratedMock.mocked(.caption2)
        typography.captionHighlight = TypographyFontTokenGeneratedMock.mocked(.caption2.bold())

        typography.small = TypographyFontTokenGeneratedMock.mocked(.footnote)
        typography.smallHighlight = TypographyFontTokenGeneratedMock.mocked(.footnote.bold())
        typography.subhead = TypographyFontTokenGeneratedMock.mocked(.callout)

        typography.callout = TypographyFontTokenGeneratedMock.mocked(.body)

        typography.customWithSizeAndWeightAndStyleReturnValue = TypographyFontTokenGeneratedMock.mocked(.caption)

        return typography
    }
}

public extension TypographyFontTokenGeneratedMock {
    // MARK: - Methods

    static func mocked(_ font: Font) -> TypographyFontTokenGeneratedMock {
        let fontToken = TypographyFontTokenGeneratedMock()
        fontToken.font = font
        fontToken.uiFont = .italicSystemFont(ofSize: 12)
        return fontToken
    }

    static func mocked(_ font: UIFont) -> TypographyFontTokenGeneratedMock {
        let fontToken = TypographyFontTokenGeneratedMock()
        fontToken.uiFont = font
        fontToken.font = .caption
        return fontToken
    }

    static func mocked(
        uiFont: UIFont = .boldSystemFont(ofSize: 16),
        font: Font = .footnote
    ) -> TypographyFontTokenGeneratedMock {
        let fontToken = TypographyFontTokenGeneratedMock()
        fontToken.uiFont = uiFont
        fontToken.font = font
        return fontToken
    }

    static func body() -> TypographyFontTokenGeneratedMock {
        let fontToken = TypographyFontTokenGeneratedMock()
        fontToken.uiFont = .systemFont(ofSize: 14)
        fontToken.font = .body
        return fontToken
    }

    static func callout() -> TypographyFontTokenGeneratedMock {
        let fontToken = TypographyFontTokenGeneratedMock()
        fontToken.uiFont = .boldSystemFont(ofSize: 15)
        fontToken.font = .callout
        return fontToken
    }

    static func caption() -> TypographyFontTokenGeneratedMock {
        let fontToken = TypographyFontTokenGeneratedMock()
        fontToken.uiFont = .italicSystemFont(ofSize: 12)
        fontToken.font = .caption
        return fontToken
    }

    static func footnote() -> TypographyFontTokenGeneratedMock {
        let fontToken = TypographyFontTokenGeneratedMock()
        fontToken.uiFont = .italicSystemFont(ofSize: 8)
        fontToken.font = .footnote
        return fontToken
    }

    static func headline() -> TypographyFontTokenGeneratedMock {
        let fontToken = TypographyFontTokenGeneratedMock()
        fontToken.uiFont = .boldSystemFont(ofSize: 16)
        fontToken.font = .headline
        return fontToken
    }

    static func title() -> TypographyFontTokenGeneratedMock {
        let fontToken = TypographyFontTokenGeneratedMock()
        fontToken.uiFont = .boldSystemFont(ofSize: 20)
        fontToken.font = .title
        return fontToken
    }
}
