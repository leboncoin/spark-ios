//
//  SliderConstantsTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
import XCTest

final class SliderConstantsTests: XCTestCase {

    // MARK: - Tests

    func test_thumbWidth_hasExpectedValue() {
        // GIVEN / WHEN / THEN
        if #available(iOS 26.0, *) {
            XCTAssertEqual(SliderConstants.thumbWidth, 38.0)
        } else {
            XCTAssertEqual(SliderConstants.thumbWidth, 28.0)
        }
    }
}
