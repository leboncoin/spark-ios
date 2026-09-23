//
//  ButtonAccessibilityIdentifierTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentButton

@Suite("Button Accessibility Identifier Tests")
struct ButtonAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("Button identifier")
    func buttonIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(ButtonAccessibilityIdentifier.button == "spark-button")
    }

    @Test("Icon button identifier")
    func iconButtonIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(ButtonAccessibilityIdentifier.iconButton == "spark-icon-button")
    }

    @Test("Content stack view identifier")
    func contentStackViewIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(ButtonAccessibilityIdentifier.contentStackView == "spark-button-content-stackView")
    }

    @Test("Image content view identifier")
    func imageContentViewIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(ButtonAccessibilityIdentifier.imageContentView == "spark-button-image-contentView")
    }

    @Test("Image view identifier")
    func imageViewIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(ButtonAccessibilityIdentifier.imageView == "spark-button-image")
    }

    @Test("Text identifier")
    func textIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(ButtonAccessibilityIdentifier.text == "spark-button-text")
    }

    @Test("Clear button identifier")
    func clearButtonIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(ButtonAccessibilityIdentifier.clearButton == "spark-button-clear-button")
    }
}
