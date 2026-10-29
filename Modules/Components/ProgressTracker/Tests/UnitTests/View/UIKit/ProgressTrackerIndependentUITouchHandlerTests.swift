//
//  ProgressTrackerIndependentUITouchHandlerTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 12.02.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Combine
import Testing
import UIKit
@testable import SparkComponentProgressTracker
@_spi(SI_SPI) import SparkCommon

@MainActor
@Suite("Progress Tracker Independent UI Touch Handler Tests")
struct ProgressTrackerIndependentUITouchHandlerTests {

    var controls: [UIControl]!

    var sut: ProgressTrackerIndependentUITouchHandler!

    // MARK: - Setup
    init() {
        self.controls = (0...4)
            .map { index in
                return CGRect(x: index * 50, y: 0, width: 50, height: 50)
            }
            .map(UIControl.init(frame:))

        let sut = ProgressTrackerInteractionState.independent.touchHandler(currentPageIndex: 0, indicatorViews: self.controls) as? ProgressTrackerIndependentUITouchHandler

        #expect(sut != nil)

        self.sut = sut
    }

    @Test("Touch on current page nothing happens")
    func touchOnCurrentPageNothingHappens() {
        // WHEN
        self.sut.beginTracking(location: .zero)

        // THEN
        #expect(self.sut.trackingPageIndex == nil)
    }

    @Test("Touch on first step")
    func touchOnFirstStep() {
        // WHEN
        self.sut.beginTracking(location: CGPoint(x: 51, y: 10))

        // THEN
        #expect(self.sut.trackingPageIndex == 1)
    }

    @Test("Touch on second step")
    func touchOnSecondStep() {
        // WHEN
        self.sut.beginTracking(location: CGPoint(x: 101, y: 10))

        // THEN
        #expect(self.sut.trackingPageIndex == 2)
    }

    @Test("Touch left of current index")
    func touchLeftOfCurrentIndex() {
        // GIVEN
        self.sut.currentPageIndex = 3

        // WHEN
        self.sut.beginTracking(location: CGPoint(x: 51, y: 10))

        // THEN
        #expect(self.sut.trackingPageIndex == 1)
    }

    @Test("Touch right of current index")
    func touchRightOfCurrentIndex() {
        // GIVEN
        self.sut.currentPageIndex = 3

        // WHEN
        self.sut.beginTracking(location: CGPoint(x: 251, y: 10))

        // THEN
        #expect(self.sut.trackingPageIndex == 4)
    }

    @Test("Touch and move")
    func touchAndMove() {
        // GIVEN
        self.sut.beginTracking(location: CGPoint(x: 51, y: 10))

        // WHEN
        self.sut.continueTracking(location: CGPoint(x: 301, y: 10))

        // THEN
        #expect(self.sut.trackingPageIndex == 1)
    }

    @Test("Touch and move to current page")
    func touchAndMoveToCurrentPage() {
        // GIVEN
        self.sut.currentPageIndex = 2
        self.sut.beginTracking(location: CGPoint(x: 51, y: 10))

        // WHEN
        self.sut.continueTracking(location: CGPoint(x: 101, y: 10))

        // THEN
        #expect(self.sut.trackingPageIndex == 1)
    }

    @Test("Touch and move over current page")
    func touchAndMoveOverCurrentPage() {
        // GIVEN
        self.sut.currentPageIndex = 2
        self.sut.beginTracking(location: CGPoint(x: 51, y: 10))
        self.sut.continueTracking(location: CGPoint(x: 101, y: 10))

        // WHEN
        self.sut.continueTracking(location: CGPoint(x: 1, y: 10))

        // THEN
        #expect(self.sut.trackingPageIndex == 1)
    }

    @Test("Value published on end tracking")
    func valuePublishedOnEndTracking() {
        // GIVEN
        var cancellables = Set<AnyCancellable>()
        var publishedCount = 0
        self.sut.beginTracking(location: CGPoint(x: 51, y: 10))

        self.sut.currentPagePublisher.subscribe(in: &cancellables) { currentPage in
            #expect(currentPage == 1)
            publishedCount += 1
        }
        // WHEN
        self.sut.endTracking(location: CGPoint(x: 251, y: 10))

        // THEN
        #expect(publishedCount == 1)

        #expect(self.sut.trackingPageIndex == nil)
    }

    @Test("Value not published on end tracking")
    func valueNotPublishedOnEndTracking() {
        // GIVEN
        var cancellables = Set<AnyCancellable>()
        var publishedCount = 0
        self.sut.beginTracking(location: CGPoint(x: 50, y: 10))

        self.sut.currentPagePublisher.subscribe(in: &cancellables) { currentPage in
            Issue.record("Nothing should have been published")
            publishedCount += 1
        }
        // WHEN
        self.sut.endTracking(location: CGPoint(x: 251, y: 10))

        // THEN
        #expect(publishedCount == 0)

        #expect(self.sut.currentPageIndex == 0)
        #expect(self.sut.trackingPageIndex == nil)
    }

}
