//
//  UnevenRoundedRectangle+HighlightedExtensionTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 03/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@_spi(SI_SPI) @testable import SparkCommon

final class UnevenRoundedRectangleHighlightedExtensionTests: XCTestCase {

    // MARK: - Tests

    func test_init_with_individual_radii_not_highlighted() {
        // GIVEN/WHEN
        let shape = UnevenRoundedRectangle(
            topLeadingRadius: 5.0,
            bottomLeadingRadius: 10.0,
            bottomTrailingRadius: 15.0,
            topTrailingRadius: 20.0,
            isHighlighted: false,
            style: .continuous
        )

        // THEN
        XCTAssertEqual(shape.cornerRadii.topLeading, 5.0, "Wrong topLeading value")
        XCTAssertEqual(shape.cornerRadii.bottomLeading, 10.0, "Wrong bottomLeading value")
        XCTAssertEqual(shape.cornerRadii.bottomTrailing, 15.0, "Wrong bottomTrailing value")
        XCTAssertEqual(shape.cornerRadii.topTrailing, 20.0, "Wrong topTrailing value")
        XCTAssertEqual(shape.style, .continuous, "Wrong style value")
    }

    func test_init_with_individual_radii_highlighted() {
        // GIVEN/WHEN
        let shape = UnevenRoundedRectangle(
            topLeadingRadius: 5.0,
            bottomLeadingRadius: 10.0,
            bottomTrailingRadius: 15.0,
            topTrailingRadius: 20.0,
            isHighlighted: true,
            style: .continuous
        )

        // THEN
        XCTAssertEqual(shape.cornerRadii.topLeading, 5.0, "Wrong topLeading value")
        XCTAssertEqual(shape.cornerRadii.bottomLeading, 0.0, "Wrong bottomLeading value when highlighted")
        XCTAssertEqual(shape.cornerRadii.bottomTrailing, 15.0, "Wrong bottomTrailing value")
        XCTAssertEqual(shape.cornerRadii.topTrailing, 20.0, "Wrong topTrailing value")
        XCTAssertEqual(shape.style, .continuous, "Wrong style value")
    }

    func test_init_with_individual_radii_default_style() {
        // GIVEN/WHEN
        let shape = UnevenRoundedRectangle(
            topLeadingRadius: 8.0,
            bottomLeadingRadius: 12.0,
            bottomTrailingRadius: 16.0,
            topTrailingRadius: 20.0,
            isHighlighted: false
        )

        // THEN
        XCTAssertEqual(shape.cornerRadii.topLeading, 8.0, "Wrong topLeading value")
        XCTAssertEqual(shape.cornerRadii.bottomLeading, 12.0, "Wrong bottomLeading value")
        XCTAssertEqual(shape.cornerRadii.bottomTrailing, 16.0, "Wrong bottomTrailing value")
        XCTAssertEqual(shape.cornerRadii.topTrailing, 20.0, "Wrong topTrailing value")
        XCTAssertEqual(shape.style, .circular, "Wrong default style value")
    }

    func test_init_with_individual_zero_radii_highlighted() {
        // GIVEN/WHEN
        let shape = UnevenRoundedRectangle(
            topLeadingRadius: 3.0,
            bottomLeadingRadius: 5.0,
            bottomTrailingRadius: 0.0,
            topTrailingRadius: 7.0,
            isHighlighted: true,
            style: .circular
        )

        // THEN
        XCTAssertEqual(shape.cornerRadii.topLeading, 3.0, "Wrong topLeading value")
        XCTAssertEqual(shape.cornerRadii.bottomLeading, 0.0, "Wrong bottomLeading value when highlighted")
        XCTAssertEqual(shape.cornerRadii.bottomTrailing, 0.0, "Wrong bottomTrailing value")
        XCTAssertEqual(shape.cornerRadii.topTrailing, 7.0, "Wrong topTrailing value")
        XCTAssertEqual(shape.style, .circular, "Wrong style value")
    }

    func test_init_with_zero_bottomLeading_radius_highlighted() {
        // GIVEN/WHEN
        let shape = UnevenRoundedRectangle(
            topLeadingRadius: 10.0,
            bottomLeadingRadius: 0.0,
            bottomTrailingRadius: 8.0,
            topTrailingRadius: 12.0,
            isHighlighted: true,
            style: .circular
        )

        // THEN
        XCTAssertEqual(shape.cornerRadii.topLeading, 10.0, "Wrong topLeading value")
        XCTAssertEqual(shape.cornerRadii.bottomLeading, 0.0, "Wrong bottomLeading value when highlighted")
        XCTAssertEqual(shape.cornerRadii.bottomTrailing, 8.0, "Wrong bottomTrailing value")
        XCTAssertEqual(shape.cornerRadii.topTrailing, 12.0, "Wrong topTrailing value")
        XCTAssertEqual(shape.style, .circular, "Wrong style value")
    }
}
