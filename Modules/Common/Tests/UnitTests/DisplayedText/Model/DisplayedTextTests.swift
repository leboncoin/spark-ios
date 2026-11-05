//
//  DisplayedTextTests.swift
//  SparkCoreTests
//
//  Created by robin.lemaire on 14/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@_spi(SI_SPI) @testable import SparkCommon

@Suite("Displayed Text Tests")
struct DisplayedTextTests {

    // MARK: - Optional Init

    @Test("Optional init with only text")
    func optionalInitWithOnlyText() {
        // GIVEN
        let textMock = "My text"

        // WHEN
        let displayedText = DisplayedText(
            text: textMock,
            attributedText: nil
        )

        // THEN
        #expect(displayedText?.text == textMock, "Wrong text")
        #expect(displayedText?.attributedText == nil, "Wrong attributedText")
    }

    @Test("Optional init with only attributed text")
    func optionalInitWithOnlyAttributedText() {
        // GIVEN
        let attributedMock: AttributedStringEither = .left(.init(string: "Holà"))

        // WHEN
        let displayedText = DisplayedText(
            text: nil,
            attributedText: attributedMock
        )

        // THEN
        #expect(displayedText?.text == nil, "Wrong text")
        #expect(displayedText?.attributedText == attributedMock, "Wrong attributedText")
    }

    @Test("Optional init without text and attributed text")
    func optionalInitWithoutTextAndAttributedText() {
        // GIVEN / WHEN
        let displayedText = DisplayedText(
            text: nil,
            attributedText: nil
        )

        // THEN
        #expect(displayedText == nil, "Wrong displayedText")
    }

    // MARK: - Text Init

    @Test("Init with text")
    func initWithText() {
        // GIVEN
        let textMock = "My text"

        // WHEN
        let displayedText = DisplayedText(
            text: textMock
        )

        // THEN
        #expect(displayedText.text == textMock, "Wrong text")
        #expect(displayedText.attributedText == nil, "Wrong attributedText")
    }

    // MARK: - AttributedText Init

    @Test("Init with attributed text")
    func initWithAttributedText() {
        // GIVEN
        let attributedMock: AttributedStringEither = .left(.init(string: "Holà"))

        // WHEN
        let displayedText = DisplayedText(
            attributedText: attributedMock
        )

        // THEN
        #expect(displayedText.text == nil, "Wrong text")
        #expect(displayedText.attributedText == attributedMock, "Wrong attributedText")
    }
}
