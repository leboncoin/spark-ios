//
//  ProgressTrackerContentTests.swift
//  SparkCoreUnitTests
//
//  Created by Michael Zimmermann on 25.01.24.
//  Copyright © 2024 Adevinta. All rights reserved.
//

import XCTest

@testable import SparkCore

final class ProgressTrackerContentTests: XCTestCase {

    // MARK: - Tests
    func test_uses_default_label()  {
        // GIVEN
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 2, currentPage: 1, showDefaultPageNumber: true)

        // THEN
        XCTAssertEqual(sut.content(ofIndex: 0).label, "1", "Expected label to be 1")
        XCTAssertEqual(sut.content(ofIndex: 1).label
            , "2", "Expected label to be 1")
    }

    func test_uses_no_label()  {
        // GIVEN
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 2, currentPage: 1, showDefaultPageNumber: false)

        // THEN
        XCTAssertNil(sut.content(ofIndex: 0).label, "Expected label 1 to be nil")
        XCTAssertNil(sut.content(ofIndex: 1).label, "Expected label 2 to be nil")
    }

    func test_uses_set_label()  {
        // GIVEN
        var sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 2, currentPage: 1, showDefaultPageNumber: false)

        // WHEN
        sut.setContentLabel("A", ofIndex: 0)
        sut.setContentLabel("B", ofIndex: 1)

        // THEN
        XCTAssertEqual(sut.content(ofIndex: 0).label, "A", "Expected label 1 to be A")
        XCTAssertEqual(sut.content(ofIndex: 1).label, "B", "Expected label 2 to be B")
    }

    func test_uses_preferred_image()  {
        // GIVEN
        let preferredImage = UIImage(systemName: "pencil")!
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 2, currentPage: 1, showDefaultPageNumber: false, preferredIndicatorImage: preferredImage)

        // THEN
        XCTAssertEqual(sut.content(ofIndex: 0).indicatorImage, preferredImage, "Expected image 1 to be preferred")
        XCTAssertEqual(sut.content(ofIndex: 1).indicatorImage, preferredImage, "Expected image 2 to be preferred")
    }

    func test_uses_preferred_current_page_image()  {
        // GIVEN
        let preferredImage = UIImage(systemName: "pencil")!
        let currentPagePreferredImage = UIImage(systemName: "lock.circle")
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 2,
            currentPage: 1,
            showDefaultPageNumber: false,
            preferredIndicatorImage: preferredImage,
            preferredCurrentPageIndicatorImage: currentPagePreferredImage
        )

        // THEN
        XCTAssertEqual(sut.content(ofIndex: 0).indicatorImage, preferredImage, "Expected image 1 to be preferred")
        XCTAssertEqual(sut.content(ofIndex: 1).indicatorImage, currentPagePreferredImage, "Expected image 2 to be currentPagePreferredImage")
    }

    func test_uses_image_set()  {
        // GIVEN
        let preferredImage = UIImage(systemName: "pencil")!
        let currentPagePreferredImage = UIImage(systemName: "lock.circle")
        let contentImage = UIImage(systemName: "pencil.circle")!

        var sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 3,
            currentPage: 2,
            showDefaultPageNumber: false,
            preferredIndicatorImage: preferredImage,
            preferredCurrentPageIndicatorImage: currentPagePreferredImage
        )

        sut.setIndicatorImage(contentImage, forIndex: 1)
        sut.setIndicatorImage(contentImage, forIndex: 2)

        // THEN
        XCTAssertEqual(sut.content(ofIndex: 0).indicatorImage, preferredImage, "Expected image 1 to be preferredImage")
        XCTAssertEqual(sut.content(ofIndex: 1).indicatorImage, contentImage, "Expected image 2 to be currentImage")
        XCTAssertEqual(sut.content(ofIndex: 2).indicatorImage, currentPagePreferredImage, "Expected image 3 to be contentPagePreferredImage")
    }

    func test_uses_current_page_image_set()  {
        // GIVEN
        let preferredImage = UIImage(systemName: "pencil")!
        let currentPagePreferredImage = UIImage(systemName: "lock.circle")
        let visitedImage = UIImage(systemName: "pencil.circle")!
        let currentContentImage = UIImage(systemName: "trash")!

        var sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 3,
            currentPage: 1,
            showDefaultPageNumber: false,
            preferredIndicatorImage: preferredImage,
            preferredCurrentPageIndicatorImage: currentPagePreferredImage,
            visitedPageIndicatorImage: visitedImage
        )

        sut.setCurrentPageIndicatorImage(currentContentImage, forIndex: 1)

        // THEN
        XCTAssertEqual(sut.content(ofIndex: 0).indicatorImage, visitedImage, "Expected image 1 to be currentPagePreferredImage")
        XCTAssertEqual(sut.content(ofIndex: 1).indicatorImage, currentContentImage, "Expected image 2 to be contentImage")
        XCTAssertEqual(sut.content(ofIndex: 2).indicatorImage, preferredImage, "Expected image 3 to be preferred")
    }

    func test_attributed_label() {
        // GIVEN
        var sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 3,
            currentPage: 2
        )

        // WHEN
        sut.setAttributedLabel(NSAttributedString(string: "hello"), forIndex: 1)

        // THEN
        XCTAssertEqual(sut.getAttributedLabel(ofIndex: 1)?.string, "hello")
    }
}
