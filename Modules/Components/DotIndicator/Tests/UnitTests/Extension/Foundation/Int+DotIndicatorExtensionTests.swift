//
//  Int+DotIndicatorExtensionTests.swift
//  SparkComponentDotIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentDotIndicator

// MARK: - Tests

struct IntDotIndicatorExtensionTests {

    @Test("Clamped page should return expected page", arguments: [
        (-1, 5, 0), (0, 5, 0), (3, 5, 3), (4, 5, 4), (8, 5, 4), (2, 0, 0)
    ])
    func clampedPageShouldReturnExpectedPage(page: Int, numberOfPages: Int, expected: Int) {
        #expect(page.clampedPage(numberOfPages: numberOfPages) == expected)
    }

    @Test("Previous page should return expected page", arguments: [(0, 0), (1, 0), (4, 3)])
    func previousPageShouldReturnExpectedPage(page: Int, expected: Int) {
        #expect(page.previousPage(numberOfPages: 5) == expected)
    }

    @Test("Next page should return expected page", arguments: [(0, 1), (3, 4), (4, 4)])
    func nextPageShouldReturnExpectedPage(page: Int, expected: Int) {
        #expect(page.nextPage(numberOfPages: 5) == expected)
    }
}
