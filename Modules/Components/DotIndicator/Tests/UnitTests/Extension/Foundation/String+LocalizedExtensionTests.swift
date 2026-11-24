//
//  String+LocalizedExtensionTests.swift
//  SparkComponentDotIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentDotIndicator

// MARK: - Tests

struct StringLocalizedExtensionTests {

    @Test("Accessibility dot indicator value should contain the human page and the number of pages")
    func accessibilityDotIndicatorValueShouldContainTheHumanPageAndTheNumberOfPages() {
        let value = String.accessibilityDotIndicatorValue(currentPage: 1, numberOfPages: 5)

        #expect(value.contains("2"))
        #expect(value.contains("5"))
        #expect(value != "accessibility_dot_indicator_value")
    }
}
