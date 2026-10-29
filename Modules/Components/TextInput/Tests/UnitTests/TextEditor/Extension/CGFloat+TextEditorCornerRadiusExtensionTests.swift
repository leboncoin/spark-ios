//
//  CGFloat+TextEditorCornerRadiusExtensionTests.swift
//  SparkComponentTextInputTests
//
//  Created on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentTextInput

@Suite("CG Float Text Editor Corner Radius Extension Tests")
struct CGFloatTextEditorCornerRadiusExtensionTests {

    // MARK: - Properties

    private let maxRadius = TextInputConstants.height / 2 // 22

    // MARK: - Tests

    @Test("Text editor radius when radius is less than max")
    func textEditorRadiusWhenRadiusIsLessThanMax() {
        // GIVEN
        let inputRadius: CGFloat = 8

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        #expect(result == 8, "Should return the input radius when it's less than max")
    }

    @Test("Text editor radius when radius is equal to max")
    func textEditorRadiusWhenRadiusIsEqualToMax() {
        // GIVEN
        let inputRadius: CGFloat = 22

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        #expect(result == 22, "Should return the max radius when input equals max")
    }

    @Test("Text editor radius when radius is greater than max")
    func textEditorRadiusWhenRadiusIsGreaterThanMax() {
        // GIVEN
        let inputRadius: CGFloat = 50

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        #expect(result == maxRadius, "Should return the max radius when input exceeds max")
    }

    @Test("Text editor radius when radius is zero")
    func textEditorRadiusWhenRadiusIsZero() {
        // GIVEN
        let inputRadius: CGFloat = 0

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        #expect(result == 0, "Should return 0 when input radius is 0")
    }

    @Test("Text editor radius when radius is negative")
    func textEditorRadiusWhenRadiusIsNegative() {
        // GIVEN
        let inputRadius: CGFloat = -5

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        #expect(result == -5, "Should return the negative value when input is negative")
    }

    @Test("Text editor radius with edge case values")
    func textEditorRadiusWithEdgeCaseValues() {
        // GIVEN
        let inputRadius: CGFloat = 21.9

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        #expect(result == 21.9, "Should return input when it's just below max")
    }

    @Test("Text editor radius with edge case above max")
    func textEditorRadiusWithEdgeCaseAboveMax() {
        // GIVEN
        let inputRadius: CGFloat = 22.1

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        #expect(result == maxRadius, "Should return max when input is just above max")
    }
}
