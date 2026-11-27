//
//  String+LocalizedExtensionTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentDotsIndicator

// MARK: - Tests

struct StringLocalizedExtensionTests {

    @Test("Accessibility dots indicator value should contain the human page and the number of pages")
    func accessibilityDotsIndicatorValueShouldContainTheHumanPageAndTheNumberOfPages() {
        let value = String.accessibilityDotsIndicatorValue(currentPage: 1, numberOfPages: 5)

        #expect(value.contains("2"))
        #expect(value.contains("5"))
        #expect(value != "accessibility_dots_indicator_value")
    }
}
