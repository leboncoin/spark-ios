//
//  SliderConstantsTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
import Testing

@Suite("Slider Constants Tests")
struct SliderConstantsTests {

    // MARK: - Tests

    @Test("Thumb width has expected value")
    func thumbWidthHasExpectedValue() {
        // GIVEN / WHEN / THEN
        if #available(iOS 26.0, *) {
            #expect(SliderConstants.thumbWidth == 38.0)
        } else {
            #expect(SliderConstants.thumbWidth == 28.0)
        }
    }
}
