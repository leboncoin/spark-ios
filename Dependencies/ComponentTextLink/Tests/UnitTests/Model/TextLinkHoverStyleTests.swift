//
//  TextLinkHoverStyleTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

final class TextLinkHoverStyleTests: XCTestCase {

    // MARK: - Tests

    func test_default_values() {
        // GIVEN / WHEN
        let hoverStyle = TextLinkHoverStyle()

        // THEN
        XCTAssertEqual(hoverStyle.horizontalPadding, 0, "Default horizontal padding should be 0")
        XCTAssertEqual(hoverStyle.verticalPadding, 0, "Default vertical padding should be 0")
        XCTAssertEqual(hoverStyle.cornerRadius, 0, "Default corner radius should be 0")
        XCTAssertEqual(hoverStyle.dim, 0, "Default dim should be 0")
        XCTAssertTrue(hoverStyle.backgroundColor is ColorTokenClear, "Default background color should be ColorTokenClear")
    }

    func test_init_with_custom_values() {
        // GIVEN
        let horizontalPadding: CGFloat = 10
        let verticalPadding: CGFloat = 8
        let cornerRadius: CGFloat = 5
        let backgroundColor = ColorTokenGeneratedMock.red()
        let dim: CGFloat = 0.5

        // WHEN
        var hoverStyle = TextLinkHoverStyle()
        hoverStyle.horizontalPadding = horizontalPadding
        hoverStyle.verticalPadding = verticalPadding
        hoverStyle.cornerRadius = cornerRadius
        hoverStyle.backgroundColor = backgroundColor
        hoverStyle.dim = dim

        // THEN
        XCTAssertEqual(hoverStyle.horizontalPadding, horizontalPadding, "Horizontal padding should be set correctly")
        XCTAssertEqual(hoverStyle.verticalPadding, verticalPadding, "Vertical padding should be set correctly")
        XCTAssertEqual(hoverStyle.cornerRadius, cornerRadius, "Corner radius should be set correctly")
        XCTAssertTrue(hoverStyle.backgroundColor.equals(backgroundColor), "Background color should be set correctly")
        XCTAssertEqual(hoverStyle.dim, dim, "Dim should be set correctly")
    }

    func test_equatable_equal_instances() {
        // GIVEN
        let backgroundColor = ColorTokenGeneratedMock.blue()

        var hoverStyle1 = TextLinkHoverStyle()
        hoverStyle1.horizontalPadding = 10
        hoverStyle1.verticalPadding = 8
        hoverStyle1.cornerRadius = 5
        hoverStyle1.backgroundColor = backgroundColor
        hoverStyle1.dim = 0.3

        var hoverStyle2 = TextLinkHoverStyle()
        hoverStyle2.horizontalPadding = 10
        hoverStyle2.verticalPadding = 8
        hoverStyle2.cornerRadius = 5
        hoverStyle2.backgroundColor = backgroundColor
        hoverStyle2.dim = 0.3

        // WHEN / THEN
        XCTAssertEqual(hoverStyle1, hoverStyle2, "Hover styles with same values should be equal")
    }

    func test_equatable_different_horizontal_padding() {
        // GIVEN
        var hoverStyle1 = TextLinkHoverStyle()
        hoverStyle1.horizontalPadding = 10

        var hoverStyle2 = TextLinkHoverStyle()
        hoverStyle2.horizontalPadding = 15

        // WHEN / THEN
        XCTAssertNotEqual(hoverStyle1, hoverStyle2, "Hover styles with different horizontal padding should not be equal")
    }

    func test_equatable_different_vertical_padding() {
        // GIVEN
        var hoverStyle1 = TextLinkHoverStyle()
        hoverStyle1.verticalPadding = 8

        var hoverStyle2 = TextLinkHoverStyle()
        hoverStyle2.verticalPadding = 12

        // WHEN / THEN
        XCTAssertNotEqual(hoverStyle1, hoverStyle2, "Hover styles with different vertical padding should not be equal")
    }

    func test_equatable_different_corner_radius() {
        // GIVEN
        var hoverStyle1 = TextLinkHoverStyle()
        hoverStyle1.cornerRadius = 5

        var hoverStyle2 = TextLinkHoverStyle()
        hoverStyle2.cornerRadius = 10

        // WHEN / THEN
        XCTAssertNotEqual(hoverStyle1, hoverStyle2, "Hover styles with different corner radius should not be equal")
    }

    func test_equatable_different_background_color() {
        // GIVEN
        var hoverStyle1 = TextLinkHoverStyle()
        hoverStyle1.backgroundColor = ColorTokenGeneratedMock.red()

        var hoverStyle2 = TextLinkHoverStyle()
        hoverStyle2.backgroundColor = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        XCTAssertNotEqual(hoverStyle1, hoverStyle2, "Hover styles with different background colors should not be equal")
    }

    func test_equatable_different_dim() {
        // GIVEN
        var hoverStyle1 = TextLinkHoverStyle()
        hoverStyle1.dim = 0.3

        var hoverStyle2 = TextLinkHoverStyle()
        hoverStyle2.dim = 0.7

        // WHEN / THEN
        XCTAssertNotEqual(hoverStyle1, hoverStyle2, "Hover styles with different dim values should not be equal")
    }
}
