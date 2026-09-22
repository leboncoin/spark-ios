//
//  TypographyMock.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class TypographyMock {

    // MARK: - Test Data

    static func createMock1() -> TypographyDefault {
        return TypographyDefault(
            bigTitle: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 0), font: .largeTitle),
            display1: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 1), font: .title),
            display2: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 2), font: .title2),
            display3: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 3), font: .title3),
            headline1: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 4), font: .headline),
            headline2: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 5), font: .headline),
            subhead: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 6), font: .subheadline),
            body1: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 7), font: .body),
            body1Highlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 8), font: .body),
            body2: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 9), font: .body),
            body2Highlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 10), font: .body),
            caption: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 11), font: .caption),
            captionHighlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 12), font: .caption),
            small: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 13), font: .footnote),
            smallHighlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 14), font: .footnote),
            callout: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 15), font: .footnote)
        )
    }

    static func createMock2() -> TypographyDefault {
        return TypographyDefault(
            bigTitle: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 0), font: .largeTitle),
            display1: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 1), font: .title),
            display2: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 2), font: .title2),
            display3: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 3), font: .title3),
            headline1: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 4), font: .headline),
            headline2: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 5), font: .headline),
            subhead: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 6), font: .subheadline),
            body1: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 7), font: .body),
            body1Highlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 8), font: .body),
            body2: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 9), font: .body),
            body2Highlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 10), font: .body),
            caption: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 11), font: .caption),
            captionHighlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 12), font: .caption),
            small: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 13), font: .footnote),
            smallHighlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 14), font: .footnote),
            callout: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 15), font: .footnote)
        )
    }

    static func createDifferentMock() -> TypographyDefault {
        return TypographyDefault(
            bigTitle: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 24), font: .callout),
            display1: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 25), font: .callout),
            display2: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 26), font: .callout),
            display3: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 27), font: .callout),
            headline1: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 28), font: .callout),
            headline2: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 29), font: .callout),
            subhead: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 30), font: .callout),
            body1: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 31), font: .callout),
            body1Highlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 32), font: .callout),
            body2: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 33), font: .callout),
            body2Highlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 34), font: .callout),
            caption: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 35), font: .callout),
            captionHighlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 36), font: .callout),
            small: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 37), font: .callout),
            smallHighlight: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 38), font: .callout),
            callout: TypographyFontTokenGeneratedMock.mocked(uiFont: .systemFont(ofSize: 39), font: .callout)
        )
    }
}
