//
//  TabUISegmentTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 06/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTab
import UIKit

@Suite("Tab UI Segment Tests")
struct TabUISegmentTests {

    // MARK: - Properties

    private let testImage = UIImage()
    private let testTitle = "Test Title"
    private let testAttributedTitle = NSAttributedString(string: "Attributed Title")

    // MARK: - Tests - Initialization with title and image

    @Test("Init with title and image")
    func initWithTitleAndImage() {
        // GIVEN / WHEN
        let segment = TabUISegment(title: self.testTitle, image: self.testImage)

        // THEN
        #expect(segment.title == self.testTitle)
        #expect(segment.attributedTitle == nil)
        #expect(segment.image == self.testImage)
    }

    @Test("Init with attributed title and image")
    func initWithAttributedTitleAndImage() {
        // GIVEN / WHEN
        let segment = TabUISegment(attributedTitle: self.testAttributedTitle, image: self.testImage)

        // THEN
        #expect(segment.title == nil)
        #expect(segment.attributedTitle == self.testAttributedTitle)
        #expect(segment.image == self.testImage)
    }

    // MARK: - Tests - Internal Initialization

    @Test("Internal init with image only")
    func internalInitWithImageOnly() {
        // GIVEN / WHEN
        let segment = TabUISegment(image: self.testImage)

        // THEN
        #expect(segment.title == nil)
        #expect(segment.attributedTitle == nil)
        #expect(segment.image == self.testImage)
    }

    @Test("Internal init with title without image")
    func internalInitWithTitleWithoutImage() {
        // GIVEN / WHEN
        let segment = TabUISegment(title: self.testTitle)

        // THEN
        #expect(segment.title == self.testTitle)
        #expect(segment.attributedTitle == nil)
        #expect(segment.image == nil)
    }

    @Test("Internal init with title and optional image")
    func internalInitWithTitleAndOptionalImage() {
        // GIVEN / WHEN
        let segment = TabUISegment(title: self.testTitle, image: self.testImage)

        // THEN
        #expect(segment.title == self.testTitle)
        #expect(segment.attributedTitle == nil)
        #expect(segment.image == self.testImage)
    }

    @Test("Internal init with attributed title without image")
    func internalInitWithAttributedTitleWithoutImage() {
        // GIVEN / WHEN
        let segment = TabUISegment(attributedTitle: self.testAttributedTitle)

        // THEN
        #expect(segment.title == nil)
        #expect(segment.attributedTitle == self.testAttributedTitle)
        #expect(segment.image == nil)
    }

    @Test("Internal init with attributed title and optional image")
    func internalInitWithAttributedTitleAndOptionalImage() {
        // GIVEN / WHEN
        let segment = TabUISegment(attributedTitle: self.testAttributedTitle, image: self.testImage)

        // THEN
        #expect(segment.title == nil)
        #expect(segment.attributedTitle == self.testAttributedTitle)
        #expect(segment.image == self.testImage)
    }

    // MARK: - Tests - Edge Cases

    @Test("Init with empty title")
    func initWithEmptyTitle() {
        // GIVEN / WHEN
        let segment = TabUISegment(title: "", image: self.testImage)

        // THEN
        #expect(segment.title?.isEmpty == true)
        #expect(segment.attributedTitle == nil)
        #expect(segment.image == self.testImage)
    }

    @Test("Init with empty attributed title")
    func initWithEmptyAttributedTitle() {
        // GIVEN / WHEN
        let emptyAttributedString = NSAttributedString(string: "")
        let segment = TabUISegment(attributedTitle: emptyAttributedString, image: self.testImage)

        // THEN
        #expect(segment.title == nil)
        #expect(segment.attributedTitle == emptyAttributedString)
        #expect(segment.image == self.testImage)
    }

    @Test("Init with long title")
    func initWithLongTitle() {
        // GIVEN
        let longTitle = String(repeating: "A", count: 1000)

        // WHEN
        let segment = TabUISegment(title: longTitle, image: self.testImage)

        // THEN
        #expect(segment.title == longTitle)
        #expect(segment.attributedTitle == nil)
        #expect(segment.image == self.testImage)
    }

    @Test("Init with attributed title with attributes")
    func initWithAttributedTitleWithAttributes() {
        // GIVEN
        let attributedString = NSAttributedString(
            string: "Styled Text",
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 16),
                .foregroundColor: UIColor.red
            ]
        )

        // WHEN
        let segment = TabUISegment(attributedTitle: attributedString, image: self.testImage)

        // THEN
        #expect(segment.title == nil)
        #expect(segment.attributedTitle == attributedString)
        #expect(segment.image == self.testImage)
    }

    // MARK: - Tests - Multiple Instances

    @Test("Multiple instances with different values")
    func multipleInstancesWithDifferentValues() {
        // GIVEN / WHEN
        let segment1 = TabUISegment(title: "Title 1", image: self.testImage)
        let segment2 = TabUISegment(title: "Title 2", image: self.testImage)

        // THEN
        #expect(segment1.title == "Title 1")
        #expect(segment2.title == "Title 2")
        #expect(segment1.title != segment2.title)
    }

    @Test("Multiple instances with same values")
    func multipleInstancesWithSameValues() {
        // GIVEN / WHEN
        let segment1 = TabUISegment(title: self.testTitle, image: self.testImage)
        let segment2 = TabUISegment(title: self.testTitle, image: self.testImage)

        // THEN
        #expect(segment1.title == segment2.title)
        #expect(segment1.attributedTitle == segment2.attributedTitle)
        #expect(segment1.image == segment2.image)
    }
}
