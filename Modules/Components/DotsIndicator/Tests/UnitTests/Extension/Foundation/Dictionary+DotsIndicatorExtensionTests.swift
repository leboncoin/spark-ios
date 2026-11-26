//
//  Dictionary+DotsIndicatorExtensionTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 26/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import CoreGraphics
import Testing
@testable import SparkComponentDotsIndicator

// MARK: - Tests

struct DictionaryDotsIndicatorExtensionTests {

    // Dots of 8pt with 4pt spacing, active dot (page 2) of 16pt:
    // page 0 at 0...8, page 2 at 24...40, page 4 at 56...64.
    private let frames: [Int: CGRect] = [
        0: CGRect(x: 0, y: 0, width: 8, height: 8),
        2: CGRect(x: 24, y: 0, width: 16, height: 8),
        4: CGRect(x: 56, y: 0, width: 8, height: 8)
    ]

    @Test("Step width should be an inactive dot and its spacing")
    func stepWidthShouldBeInactiveDotAndSpacing() {
        #expect(self.frames.dotsIndicatorStepWidth(selectedPage: 2, numberOfPages: 5) == 12)
    }

    @Test("Step width with a missing frame should return 0", arguments: [1, 3])
    func stepWidthWithMissingFrameShouldReturnZero(selectedPage: Int) {
        #expect(self.frames.dotsIndicatorStepWidth(selectedPage: selectedPage, numberOfPages: 5) == 0)
    }

    @Test("Step width with one page should return 0")
    func stepWidthWithOnePageShouldReturnZero() {
        #expect(self.frames.dotsIndicatorStepWidth(selectedPage: 0, numberOfPages: 1) == 0)
    }
}
