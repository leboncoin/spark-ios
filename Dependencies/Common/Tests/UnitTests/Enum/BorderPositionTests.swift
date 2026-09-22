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
import XCTest

final class BorderPositionTests: XCTestCase {

    // MARK: - Tests

    func test_default_value_is_overlay() {
        XCTAssertEqual(BorderPosition.default, .overlay)
    }

    func test_inset_when_inner_returns_zero() {
        // GIVEN
        let width: CGFloat = 10

        // WHEN
        let inset = BorderPosition.inner.inset(width: width)

        // THEN
        XCTAssertEqual(inset, .zero)
    }

    func test_inset_when_outer_returns_negative_half_width() {
        // GIVEN
        let width: CGFloat = 10

        // WHEN
        let inset = BorderPosition.outer.inset(width: width)

        // THEN
        XCTAssertEqual(inset, -width / 2)
    }
}
