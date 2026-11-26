//
//  Int+DotsIndicatorExtensionTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import CoreGraphics
import Testing
@testable import SparkComponentDotsIndicator

// MARK: - Tests

struct IntDotsIndicatorExtensionTests {

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

    // Dots of 8pt with 4pt spacing, active dot (page 2) of 16pt:
    // LTR: page 0 at 0...8, page 1 at 12...20, page 2 at 24...40.

    @Test("Tapped page should return expected page", arguments: [
        (2.0, 1), (30.0, 2), (50.0, 3)
    ])
    func tappedPageShouldReturnExpectedPage(tapLocationX: CGFloat, expected: Int) {
        let page = 2.tappedPage(
            tapLocationX: tapLocationX,
            activeDotFrame: .init(x: 24, y: 0, width: 16, height: 8),
            firstDotFrame: .init(x: 0, y: 0, width: 8, height: 8),
            numberOfPages: 5
        )
        #expect(page == expected)
    }

    @Test("Tapped page on the first page should return the next page outside the active dot", arguments: [
        (-5.0, 1), (8.0, 0), (30.0, 1)
    ])
    func tappedPageOnFirstPageShouldReturnExpectedPage(tapLocationX: CGFloat, expected: Int) {
        let frame = CGRect(x: 0, y: 0, width: 16, height: 8)
        let page = 0.tappedPage(
            tapLocationX: tapLocationX,
            activeDotFrame: frame,
            firstDotFrame: frame,
            numberOfPages: 5
        )
        #expect(page == expected)
    }

    @Test("Tapped page on the last page should stay on the last page after the active dot")
    func tappedPageOnLastPageShouldStayOnLastPage() {
        let page = 4.tappedPage(
            tapLocationX: 100,
            activeDotFrame: .init(x: 48, y: 0, width: 16, height: 8),
            firstDotFrame: .init(x: 0, y: 0, width: 8, height: 8),
            numberOfPages: 5
        )
        #expect(page == 4)
    }

    @Test("Swiped page should return expected page", arguments: [
        (2, -20.0, 3), (2, 20.0, 1), (2, 0.0, 2), (4, -20.0, 4), (0, 20.0, 0)
    ])
    func swipedPageShouldReturnExpectedPage(page: Int, translation: CGFloat, expected: Int) {
        #expect(page.swipedPage(translation: translation, numberOfPages: 5) == expected)
    }

    @Test("Long press page should return expected page", arguments: [
        (0.0, 2), (12.0, 3), (-12.0, 1), (5.0, 2), (7.0, 3), (100.0, 4), (-100.0, 0)
    ])
    func longPressPageShouldReturnExpectedPage(translation: CGFloat, expected: Int) {
        #expect(2.longPressPage(
            translation: translation,
            startTranslation: 0,
            stepWidth: 12,
            numberOfPages: 5
        ) == expected)
    }

    @Test("Long press page with start translation should use the delta")
    func longPressPageWithStartTranslationShouldUseDelta() {
        #expect(2.longPressPage(translation: 30, startTranslation: 18, stepWidth: 12, numberOfPages: 5) == 3)
    }

    @Test("Long press page without step width should return the start page")
    func longPressPageWithoutStepWidthShouldReturnStartPage() {
        #expect(2.longPressPage(translation: 50, startTranslation: 0, stepWidth: 0, numberOfPages: 5) == 2)
    }

    @Test("Is dot frame reported should return expected value", arguments: [
        (0, true), (1, false), (2, true), (3, false), (4, true)
    ])
    func isDotFrameReportedShouldReturnExpectedValue(index: Int, expected: Bool) {
        #expect(index.isDotFrameReported(selectedPage: 2, numberOfPages: 5) == expected)
    }
}
