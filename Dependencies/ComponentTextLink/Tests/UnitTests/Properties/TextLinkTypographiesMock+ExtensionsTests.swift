//
//  TextLinkTypographiesMock+ExtensionTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkThemingTesting

extension TextLinkTypographies {

    // MARK: - Methods

    static func mocked() -> Self {
        let normalTypographyFontTokenMock = TypographyFontTokenGeneratedMock.mocked(
            uiFont: .systemFont(ofSize: 12),
            font: .title
        )
        let highlightTypographyFontTokenMock = TypographyFontTokenGeneratedMock.mocked(
            uiFont: .boldSystemFont(ofSize: 12),
            font: .title2
        )

        return .init(
            normal: normalTypographyFontTokenMock,
            highlight: highlightTypographyFontTokenMock
        )
    }
}
