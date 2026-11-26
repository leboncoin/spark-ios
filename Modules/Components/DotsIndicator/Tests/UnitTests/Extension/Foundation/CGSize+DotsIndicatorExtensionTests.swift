//
//  CGSize+DotsIndicatorExtensionTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 26/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import CoreGraphics
import Testing
@testable import SparkComponentDotsIndicator

// MARK: - Tests

struct CGSizeDotsIndicatorExtensionTests {

    @Test("Is swipe should return expected value", arguments: [
        (CGSize.zero, false),
        (CGSize(width: 9, height: 0), false),
        (CGSize(width: 10, height: 0), true),
        (CGSize(width: -10, height: 0), true),
        (CGSize(width: 0, height: 10), true),
        (CGSize(width: 6, height: 8), true),
        (CGSize(width: 5, height: 5), false)
    ])
    func isSwipeShouldReturnExpectedValue(translation: CGSize, expected: Bool) {
        #expect(translation.isDotsIndicatorSwipe == expected)
    }
}
