//
//  DotsIndicatorToken+SizeTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentDotsIndicator

// MARK: - Tests

struct DotsIndicatorTokenSizeTests {

    // MARK: - Properties

    private let token = DotsIndicatorToken.Size()

    // MARK: - Tests

    @Test("Active dot width ratio should return 4")
    func activeDotWidthRatioShouldReturn4() {
        #expect(self.token.activeDotWidthRatio == 4)
    }

    @Test("Dot height should return expected value", arguments: [
        (DotsIndicatorSize.small, CGFloat(4)), (.medium, 8), (.large, 16)
    ])
    func dotHeightShouldReturnExpectedValue(size: DotsIndicatorSize, expected: CGFloat) {
        #expect(self.token.dotHeight(size: size) == expected)
    }

    @Test("Inactive dot width should return dot height", arguments: DotsIndicatorSize.allCases)
    func inactiveDotWidthShouldReturnDotHeight(size: DotsIndicatorSize) {
        #expect(self.token.dotWidth(size: size, isActive: false) == self.token.dotHeight(size: size))
    }

    @Test("Active dot width should return expected value", arguments: [
        (DotsIndicatorSize.small, CGFloat(16)), (.medium, 32), (.large, 64)
    ])
    func activeDotWidthShouldReturnExpectedValue(size: DotsIndicatorSize, expected: CGFloat) {
        #expect(self.token.dotWidth(size: size, isActive: true) == expected)
    }

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(DotsIndicatorToken.Size() == DotsIndicatorToken.Size())
    }
}
