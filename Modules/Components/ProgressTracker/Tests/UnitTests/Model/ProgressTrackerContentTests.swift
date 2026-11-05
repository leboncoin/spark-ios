//
//  ProgressTrackerContentTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 25.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
import Testing

@testable import SparkComponentProgressTracker

@MainActor
@Suite("Progress Tracker Content Tests")
struct ProgressTrackerContentTests {

    // MARK: - Tests
    @Test("Uses default label")
    func usesDefaultLabel() {
        // GIVEN
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 2, currentPageIndex: 1, showDefaultPageNumber: true)

        // THEN
        #expect(sut.pageContent(atIndex: 0).label == "1", "Expected label to be 1")
        #expect(sut.pageContent(atIndex: 1).label == "2", "Expected label to be 1")
    }

    @Test("Uses no label")
    func usesNoLabel() {
        // GIVEN
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 2, currentPageIndex: 1, showDefaultPageNumber: false)

        // THEN
        #expect(sut.pageContent(atIndex: 0).label == nil, "Expected label 1 to be nil")
        #expect(sut.pageContent(atIndex: 1).label == nil, "Expected label 2 to be nil")
    }

    @Test("Uses set indicator label")
    func usesSetIndicatorLabel() {
        // GIVEN
        var sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 2, currentPageIndex: 1, showDefaultPageNumber: false)

        // WHEN
        sut.setIndicatorLabel("X", atIndex: 0)
        #expect(sut.getIndicatorLabel(atIndex: 0) == "X", "Expected indicator label to be X")

        sut.setIndicatorLabel("A", atIndex: 0)
        sut.setIndicatorLabel("B", atIndex: 1)

        // THEN
        #expect(!sut.hasLabel, "Expected not to labels")
        #expect(sut.pageContent(atIndex: 0).label == "A", "Expected label 1 to be A")
        #expect(sut.pageContent(atIndex: 1).label == "B", "Expected label 2 to be B")
    }

    @Test("Indicator label max length")
    func indicatorLabelMaxLength() {
        // GIVEN
        var sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 2, currentPageIndex: 1, showDefaultPageNumber: false)

        // WHEN
        sut.setIndicatorLabel("XXX", atIndex: 0)

        // THEN
        #expect(sut.getIndicatorLabel(atIndex: 0) == "XX", "Expected indicator label to be XX")

    }

    @Test("Uses set label")
    func usesSetLabel() {
        // GIVEN
        var sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 4, currentPageIndex: 1, showDefaultPageNumber: false)

        // WHEN
        sut.setAttributedLabel(NSAttributedString(string: "A"), atIndex: 0)
        sut.setAttributedLabel(NSAttributedString(string: "B"), atIndex: 1)
        sut.setAttributedLabel(nil, atIndex: 3)

        // THEN
        #expect(sut.hasLabel, "Expected hasLabel to be true")
        #expect(sut.numberOfLabels == 2, "Expected number of labels to be 2")
        #expect(sut.labels[0] == NSAttributedString(string: "A"), "Expected label to be A")
        #expect(sut.labels[1] == NSAttributedString(string: "B"), "Expected label 2 to be B")
    }

    @Test("Uses preferred image")
    func usesPreferredImage() throws {
        // GIVEN
        let preferredImage = try #require(UIImage(systemName: "pencil"))
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 2, currentPageIndex: 1, showDefaultPageNumber: false, preferredIndicatorImage: preferredImage)

        // THEN
        #expect(sut.pageContent(atIndex: 0).indicatorImage == preferredImage, "Expected image 1 to be preferred")
        #expect(sut.pageContent(atIndex: 1).indicatorImage == preferredImage, "Expected image 2 to be preferred")
    }

    @Test("Uses preferred current page image")
    func usesPreferredCurrentPageImage() throws {
        // GIVEN
        let preferredImage = try #require(UIImage(systemName: "pencil"))
        let currentPagePreferredImage = UIImage(systemName: "lock.circle")
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 2,
            currentPageIndex: 1,
            showDefaultPageNumber: false,
            preferredIndicatorImage: preferredImage,
            preferredCurrentPageIndicatorImage: currentPagePreferredImage
        )

        // THEN
        #expect(sut.pageContent(atIndex: 0).indicatorImage == preferredImage, "Expected image 1 to be preferred")
        #expect(sut.pageContent(atIndex: 1).indicatorImage == currentPagePreferredImage, "Expected image 2 to be currentPagePreferredImage")
    }

    @Test("Uses image set")
    func usesImageSet() throws {
        // GIVEN
        let preferredImage = try #require(UIImage(systemName: "pencil"))
        let currentPagePreferredImage = UIImage(systemName: "lock.circle")
        let contentImage = try #require(UIImage(systemName: "pencil.circle"))

        var sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 3,
            currentPageIndex: 2,
            showDefaultPageNumber: false,
            preferredIndicatorImage: preferredImage,
            preferredCurrentPageIndicatorImage: currentPagePreferredImage
        )

        /// WHEN
        sut.setIndicatorImage(preferredImage, atIndex: 1)
        sut.setIndicatorImage(contentImage, atIndex: 1)
        sut.setIndicatorImage(contentImage, atIndex: 2)

        // THEN
        #expect(sut.pageContent(atIndex: 0).indicatorImage == preferredImage, "Expected image 1 to be preferredImage")
        #expect(sut.pageContent(atIndex: 1).indicatorImage == contentImage, "Expected image 2 to be currentImage")
        #expect(sut.pageContent(atIndex: 2).indicatorImage == currentPagePreferredImage, "Expected image 3 to be contentPagePreferredImage")
    }

    @Test("Uses current page image set")
    func usesCurrentPageImageSet() throws {
        // GIVEN
        let preferredImage = try #require(UIImage(systemName: "pencil"))
        let currentPagePreferredImage = UIImage(systemName: "lock.circle")
        let visitedImage = try #require(UIImage(systemName: "pencil.circle"))
        let currentContentImage = try #require(UIImage(systemName: "trash"))

        var sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 3,
            currentPageIndex: 1,
            showDefaultPageNumber: false,
            preferredIndicatorImage: preferredImage,
            preferredCurrentPageIndicatorImage: currentPagePreferredImage,
            completedPageIndicatorImage: visitedImage
        )

        sut.setCurrentPageIndicatorImage(currentContentImage, atIndex: 1)

        // THEN
        #expect(sut.pageContent(atIndex: 0).indicatorImage == visitedImage, "Expected image 1 to be currentPagePreferredImage")
        #expect(sut.pageContent(atIndex: 1).indicatorImage == currentContentImage, "Expected image 2 to be contentImage")
        #expect(sut.pageContent(atIndex: 2).indicatorImage == preferredImage, "Expected image 3 to be preferred")
    }

    @Test("Attributed label")
    func attributedLabel() {
        // GIVEN
        var sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 3,
            currentPageIndex: 2
        )

        // WHEN
        sut.setAttributedLabel(NSAttributedString(string: "hello"), atIndex: 1)

        // THEN
        #expect(sut.getAttributedLabel(atIndex: 1)?.string == "hello")
    }

    @Test("Needs update of layout when pagecount differs")
    func needsUpdateOfLayoutWhenPagecountDiffers() {
        // GIVEN
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 3,
            currentPageIndex: 2
        )

        let other = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 4,
            currentPageIndex: 2
        )

        // THEN
        #expect(sut.needsUpdateOfLayout(otherComponent: other))
    }

    @Test("Needs update of label counts differ")
    func needsUpdateOfLabelCountsDiffer() {
        // GIVEN
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 3,
            currentPageIndex: 2
        )

        var other = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 3,
            currentPageIndex: 2
        )

        other.setAttributedLabel(NSAttributedString(string: "A"), atIndex: 0)

        // THEN
        #expect(sut.needsUpdateOfLayout(otherComponent: other))
    }

    @Test("No need for layout updated")
    func noNeedForLayoutUpdated() {
        // GIVEN
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 3,
            currentPageIndex: 2
        )

        let other = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(
            numberOfPages: 3,
            currentPageIndex: 2
        )

        // THEN
        #expect(!(sut.needsUpdateOfLayout(otherComponent: other)))
    }

    @Test("Accessibility label with no content")
    func accessibilityLabelWithNoContent() {
        // GIVEN
        let sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 2, currentPageIndex: 1, showDefaultPageNumber: false)

        // THEN
        #expect(sut.getIndicatorAccessibilityLabel(atIndex: 0) == nil, "Expected accessibility label to be nil")
        #expect(sut.getIndicatorAccessibilityLabel(atIndex: 1) == nil, "Expected accessibility label to be nil")
    }

    @Test("Accessibility label with content")
    func accessibilityLabelWithContent() {
        // GIVEN
        var sut = ProgressTrackerContent<ProgressTrackerUIIndicatorContent>(numberOfPages: 2, currentPageIndex: 1, showDefaultPageNumber: false)

        // WHEN
        sut.setIndicatorLabel("A", atIndex: 0)
        sut.setIndicatorLabel("B", atIndex: 1)

        // THEN
        #expect(sut.getIndicatorAccessibilityLabel(atIndex: 0) == "A", "Expected accessibility label to be A")
        #expect(sut.getIndicatorAccessibilityLabel(atIndex: 1) == "B", "Expected accessibility label to be B")
    }
}
