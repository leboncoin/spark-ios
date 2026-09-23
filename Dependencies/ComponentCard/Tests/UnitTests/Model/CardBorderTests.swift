//
//  CardBorderTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentCard

// MARK: - Tests

@Suite("Card Border Tests")
struct CardBorderTests {

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let border = CardBorder()

        // THEN
        #expect(border.width == 0)
        #expect(border.radius == 0)
        #expect(border.headerRadius == 0)
    }

    @Test("Custom initialization with specific values")
    func customInitialization() {
        // GIVEN
        let width: CGFloat = 2.0
        let radius: CGFloat = 8.0
        let headerRadius: CGFloat = 16.0

        // WHEN
        let border = CardBorder(width: width, radius: radius, headerRadius: headerRadius)

        // THEN
        #expect(border.width == width)
        #expect(border.radius == radius)
        #expect(border.headerRadius == headerRadius)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN
        let border1 = CardBorder(width: 1.0, radius: 4.0, headerRadius: 8.0)
        let border2 = CardBorder(width: 1.0, radius: 4.0, headerRadius: 8.0)

        // WHEN / THEN
        #expect(border1 == border2)
    }

    @Test("Inequality when different width")
    func inequalityWhenDifferentWidth() {
        // GIVEN
        let border1 = CardBorder(width: 1.0, radius: 4.0, headerRadius: 8.0)
        let border3 = CardBorder(width: 2.0, radius: 4.0, headerRadius: 8.0)

        // WHEN / THEN
        #expect(border1 != border3)
    }

    @Test("Inequality when different radius")
    func inequalityWhenDifferentRadius() {
        // GIVEN
        let border1 = CardBorder(width: 1.0, radius: 4.0, headerRadius: 8.0)
        let border4 = CardBorder(width: 1.0, radius: 2.0, headerRadius: 8.0)

        // WHEN / THEN
        #expect(border1 != border4)
    }

    @Test("Inequality when different header radius")
    func inequalityWhenDifferentHeaderRadius() {
        // GIVEN
        let border1 = CardBorder(width: 1.0, radius: 4.0, headerRadius: 8.0)
        let border5 = CardBorder(width: 1.0, radius: 4.0, headerRadius: 12.0)

        // WHEN / THEN
        #expect(border1 != border5)
    }

    @Test("Property mutation")
    func propertyMutation() {
        // GIVEN
        var border = CardBorder()

        // WHEN
        border.width = 3.0
        border.radius = 12.0
        border.headerRadius = 24.0

        // THEN
        #expect(border.width == 3.0)
        #expect(border.radius == 12.0)
        #expect(border.headerRadius == 24.0)
    }
}
