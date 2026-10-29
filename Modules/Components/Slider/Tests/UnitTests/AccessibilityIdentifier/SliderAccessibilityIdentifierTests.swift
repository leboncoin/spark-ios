//
//  SliderAccessibilityIdentifierTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
import Testing

@Suite("Slider AccessibilityIdentifier Tests")
struct SliderAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View has expected value")
    func viewHasExpectedValue() {
        // GIVEN / WHEN / THEN
        #expect(SliderAccessibilityIdentifier.view == "spark-slider")
    }

    @Test("Slider has expected value")
    func sliderHasExpectedValue() {
        // GIVEN / WHEN / THEN
        #expect(SliderAccessibilityIdentifier.slider == "spark-slider")
    }

    @Test("Slider content has expected value")
    func sliderContentHasExpectedValue() {
        // GIVEN / WHEN / THEN
        #expect(SliderAccessibilityIdentifier.sliderContent == "spark-slider-content")
    }
}
