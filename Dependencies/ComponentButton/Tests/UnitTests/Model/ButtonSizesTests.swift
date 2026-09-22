//
//  ButtonSizesTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentButton

@Suite("Button Sizes Tests")
struct ButtonSizesTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let sizes = ButtonSizes()

        // THEN
        #expect(sizes.height == .zero)
        #expect(sizes.width == .zero)
        #expect(sizes.isFixedHeight == false)
        #expect(sizes.isFixedWidth == false)
        #expect(sizes.maxHeight == nil)
        #expect(sizes.imageSize == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let sizes1 = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)
        let sizes2 = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)

        // THEN
        #expect(sizes1 == sizes2)
    }

    @Test("Inequality when different height")
    func inequalityWhenDifferentHeight() {
        // GIVEN / WHEN
        let sizes1 = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)
        let sizes2 = ButtonSizes(height: 56, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)

        // THEN
        #expect(sizes1 != sizes2)
    }

    @Test("Inequality when different width")
    func inequalityWhenDifferentWidth() {
        // GIVEN / WHEN
        let sizes1 = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)
        let sizes2 = ButtonSizes(height: 44, width: 200, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)

        // THEN
        #expect(sizes1 != sizes2)
    }

    @Test("Inequality when different fixed height")
    func inequalityWhenDifferentFixedHeight() {
        // GIVEN / WHEN
        let sizes1 = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)
        let sizes2 = ButtonSizes(height: 44, width: 100, isFixedHeight: true, isFixedWidth: false, maxHeight: 300, imageSize: 16)

        // THEN
        #expect(sizes1 != sizes2)
    }

    @Test("Inequality when different fixed width")
    func inequalityWhenDifferentFixedWidth() {
        // GIVEN / WHEN
        let sizes1 = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)
        let sizes2 = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: true, maxHeight: 300, imageSize: 16)

        // THEN
        #expect(sizes1 != sizes2)
    }

    @Test("Inequality when different max height")
    func inequalityWhenDifferentMaxHeight() {
        // GIVEN / WHEN
        let sizes1 = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)
        let sizes2 = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 350, imageSize: 16)

        // THEN
        #expect(sizes1 != sizes2)
    }

    @Test("Inequality when different image size")
    func inequalityWhenDifferentImageSize() {
        // GIVEN / WHEN
        let sizes1 = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)
        let sizes2 = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 20)

        // THEN
        #expect(sizes1 != sizes2)
    }

    @Test("Fixed height is true")
    func isFixedHeightIsTrue() {
        // GIVEN / WHEN
        let sizes = ButtonSizes(height: 44, width: 100, isFixedHeight: true, isFixedWidth: false, maxHeight: 300, imageSize: 16)

        // THEN
        #expect(sizes.isFixedHeight == true)
    }

    @Test("Fixed height is false")
    func isFixedHeightIsFalse() {
        // GIVEN / WHEN
        let sizes = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)

        // THEN
        #expect(sizes.isFixedHeight == false)
    }

    @Test("Fixed width is true")
    func isFixedWidthIsTrue() {
        // GIVEN / WHEN
        let sizes = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: true, maxHeight: 300, imageSize: 16)

        // THEN
        #expect(sizes.isFixedWidth == true)
    }

    @Test("Fixed width is false")
    func isFixedWidthIsFalse() {
        // GIVEN / WHEN
        let sizes = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)

        // THEN
        #expect(sizes.isFixedWidth == false)
    }

    @Test("Max height property with value")
    func maxHeightPropertyWithValue() {
        // GIVEN / WHEN
        let sizes = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: 350, imageSize: 16)

        // THEN
        #expect(sizes.maxHeight == 350)
    }

    @Test("Max height property is nil")
    func maxHeightPropertyIsNil() {
        // GIVEN / WHEN
        let sizes = ButtonSizes(height: 44, width: 100, isFixedHeight: false, isFixedWidth: false, maxHeight: nil, imageSize: 16)

        // THEN
        #expect(sizes.maxHeight == nil)
    }

    @Test("Width property")
    func widthProperty() {
        // GIVEN / WHEN
        let sizes = ButtonSizes(height: 44, width: 150, isFixedHeight: false, isFixedWidth: false, maxHeight: 300, imageSize: 16)

        // THEN
        #expect(sizes.width == 150)
    }
}
