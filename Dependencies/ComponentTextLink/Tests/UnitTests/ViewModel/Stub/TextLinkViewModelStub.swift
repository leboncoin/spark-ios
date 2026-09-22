//
//  TextLinkViewModelStub.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 28/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkThemingTesting

class TextLinkViewModelStub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: TextLinkIntent = .accent
    let givenIsHighlighted = false
    let givenText = "TextLink"
    let givenTextHighlightRange = NSRange(location: 0, length: 4)
    let givenTypography: TextLinkTypography = .body1
    let givenVariant: TextLinkVariant = .underline
}

// MARK: - Extension

extension TextLinkCommonViewModel {

    func setup(stub: TextLinkViewModelStub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            text: stub.givenText,
            textHighlightRange: stub.givenTextHighlightRange,
            typography: stub.givenTypography,
            variant: stub.givenVariant
        )
    }
}
