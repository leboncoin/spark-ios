//
//  TextLinkHoverStyleTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

@Suite("Text Link Hover Style Tests")
struct TextLinkHoverStyleTests {

    // MARK: - Tests

    @Test("Default values")
    func defaultValues() {
        // GIVEN / WHEN
        let hoverStyle = TextLinkHoverStyle()

        // THEN
        #expect(hoverStyle.horizontalPadding == 0, "Default horizontal padding should be 0")
        #expect(hoverStyle.verticalPadding == 0, "Default vertical padding should be 0")
        #expect(hoverStyle.cornerRadius == 0, "Default corner radius should be 0")
        #expect(hoverStyle.dim == 0, "Default dim should be 0")
        #expect(hoverStyle.backgroundColor is ColorTokenClear, "Default background color should be ColorTokenClear")
    }

    @Test("Init with custom values")
    func initWithCustomValues() {
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
        #expect(hoverStyle.horizontalPadding == horizontalPadding, "Horizontal padding should be set correctly")
        #expect(hoverStyle.verticalPadding == verticalPadding, "Vertical padding should be set correctly")
        #expect(hoverStyle.cornerRadius == cornerRadius, "Corner radius should be set correctly")
        #expect(hoverStyle.backgroundColor.equals(backgroundColor), "Background color should be set correctly")
        #expect(hoverStyle.dim == dim, "Dim should be set correctly")
    }

    @Test("Equatable equal instances")
    func equatableEqualInstances() {
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
        #expect(hoverStyle1 == hoverStyle2, "Hover styles with same values should be equal")
    }

    @Test("Equatable different horizontal padding")
    func equatableDifferentHorizontalPadding() {
        // GIVEN
        var hoverStyle1 = TextLinkHoverStyle()
        hoverStyle1.horizontalPadding = 10

        var hoverStyle2 = TextLinkHoverStyle()
        hoverStyle2.horizontalPadding = 15

        // WHEN / THEN
        #expect(hoverStyle1 != hoverStyle2, "Hover styles with different horizontal padding should not be equal")
    }

    @Test("Equatable different vertical padding")
    func equatableDifferentVerticalPadding() {
        // GIVEN
        var hoverStyle1 = TextLinkHoverStyle()
        hoverStyle1.verticalPadding = 8

        var hoverStyle2 = TextLinkHoverStyle()
        hoverStyle2.verticalPadding = 12

        // WHEN / THEN
        #expect(hoverStyle1 != hoverStyle2, "Hover styles with different vertical padding should not be equal")
    }

    @Test("Equatable different corner radius")
    func equatableDifferentCornerRadius() {
        // GIVEN
        var hoverStyle1 = TextLinkHoverStyle()
        hoverStyle1.cornerRadius = 5

        var hoverStyle2 = TextLinkHoverStyle()
        hoverStyle2.cornerRadius = 10

        // WHEN / THEN
        #expect(hoverStyle1 != hoverStyle2, "Hover styles with different corner radius should not be equal")
    }

    @Test("Equatable different background color")
    func equatableDifferentBackgroundColor() {
        // GIVEN
        var hoverStyle1 = TextLinkHoverStyle()
        hoverStyle1.backgroundColor = ColorTokenGeneratedMock.red()

        var hoverStyle2 = TextLinkHoverStyle()
        hoverStyle2.backgroundColor = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        #expect(hoverStyle1 != hoverStyle2, "Hover styles with different background colors should not be equal")
    }

    @Test("Equatable different dim")
    func equatableDifferentDim() {
        // GIVEN
        var hoverStyle1 = TextLinkHoverStyle()
        hoverStyle1.dim = 0.3

        var hoverStyle2 = TextLinkHoverStyle()
        hoverStyle2.dim = 0.7

        // WHEN / THEN
        #expect(hoverStyle1 != hoverStyle2, "Hover styles with different dim values should not be equal")
    }
}
