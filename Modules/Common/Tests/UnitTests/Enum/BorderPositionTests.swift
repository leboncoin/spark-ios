//
//  BorderPositionTests.swift
//  SparkCommonTests
//
//  Created by robin.lemaire on 20/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import CoreGraphics
import Foundation
@_spi(SI_SPI) @testable import SparkCommon
import Testing

@Suite("Border Position Tests")
struct BorderPositionTests {

    // MARK: - Tests

    @Test("Default value is overlay")
    func defaultValueIsOverlay() {
        #expect(BorderPosition.default == .overlay)
    }

    @Test("Inset when inner returns zero")
    func insetWhenInnerReturnsZero() {
        // GIVEN
        let width: CGFloat = 10

        // WHEN
        let inset = BorderPosition.inner.inset(width: width)

        // THEN
        #expect(inset == .zero)
    }

    @Test("Inset when outer returns negative half width")
    func insetWhenOuterReturnsNegativeHalfWidth() {
        // GIVEN
        let width: CGFloat = 10

        // WHEN
        let inset = BorderPosition.outer.inset(width: width)

        // THEN
        #expect(inset == -width / 2)
    }
}
