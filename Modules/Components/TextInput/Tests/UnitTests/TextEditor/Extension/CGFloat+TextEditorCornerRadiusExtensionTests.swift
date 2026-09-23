//
//  CGFloat+TextEditorCornerRadiusExtensionTests.swift
//  SparkComponentTextInputTests
//
//  Created on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput

final class CGFloatTextEditorCornerRadiusExtensionTests: XCTestCase {

    // MARK: - Properties

    private let maxRadius = TextInputConstants.height / 2 // 22

    // MARK: - Tests

    func testTextEditorRadius_whenRadiusIsLessThanMax() {
        // GIVEN
        let inputRadius: CGFloat = 8

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        XCTAssertEqual(result, 8, "Should return the input radius when it's less than max")
    }

    func testTextEditorRadius_whenRadiusIsEqualToMax() {
        // GIVEN
        let inputRadius: CGFloat = 22

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        XCTAssertEqual(result, 22, "Should return the max radius when input equals max")
    }

    func testTextEditorRadius_whenRadiusIsGreaterThanMax() {
        // GIVEN
        let inputRadius: CGFloat = 50

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        XCTAssertEqual(result, maxRadius, "Should return the max radius when input exceeds max")
    }

    func testTextEditorRadius_whenRadiusIsZero() {
        // GIVEN
        let inputRadius: CGFloat = 0

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        XCTAssertEqual(result, 0, "Should return 0 when input radius is 0")
    }

    func testTextEditorRadius_whenRadiusIsNegative() {
        // GIVEN
        let inputRadius: CGFloat = -5

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        XCTAssertEqual(result, -5, "Should return the negative value when input is negative")
    }

    func testTextEditorRadius_withEdgeCaseValues() {
        // GIVEN
        let inputRadius: CGFloat = 21.9

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        XCTAssertEqual(result, 21.9, "Should return input when it's just below max")
    }

    func testTextEditorRadius_withEdgeCaseAboveMax() {
        // GIVEN
        let inputRadius: CGFloat = 22.1

        // WHEN
        let result = CGFloat.textEditorRadius(inputRadius)

        // THEN
        XCTAssertEqual(result, maxRadius, "Should return max when input is just above max")
    }
}
