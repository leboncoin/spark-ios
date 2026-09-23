//
//  SliderAccessibilityIdentifierTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
import XCTest

final class SliderAccessibilityIdentifierTests: XCTestCase {

    // MARK: - Tests

    func test_view_hasExpectedValue() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(SliderAccessibilityIdentifier.view, "spark-slider")
    }

    func test_slider_hasExpectedValue() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(SliderAccessibilityIdentifier.slider, "spark-slider")
    }

    func test_sliderContent_hasExpectedValue() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(SliderAccessibilityIdentifier.sliderContent, "spark-slider-content")
    }
}
