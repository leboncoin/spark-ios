//
//  ProgressTrackerContinuousGestureHandlerTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 27.03.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation

import SwiftUI
import Testing

@testable import SparkComponentProgressTracker

@MainActor
@Suite("Progress Tracker Continuous Gesture Handler Tests")
final class ProgressTrackerContinuousGestureHandlerTests {

    var _currentPageIndex: Int = 0

    lazy var currentPageIndex = Binding<Int>(
        get: { return self._currentPageIndex },
        set: { self._currentPageIndex = $0 }
    )

    private var _currentTouchedPageIndex: Int?

    lazy var currentTouchedPageIndex = Binding<Int?>(
        get: { return self._currentTouchedPageIndex },
        set: { self._currentTouchedPageIndex = $0 }
    )

    private var indicators = (0...3).map{ CGRect(x: $0 * 40, y: 0, width: 40, height: 40)}

    private var disabledIndices = Set<Int>()

    // MARK: - Tests
    @Test("Index 0 is current 1 may be selected")
    func index0IsCurrent1MayBeSelected() {
        // Given
        self._currentPageIndex = 0
        let sut = self.sut()

        // When
        sut.onChanged(location: CGPoint(x: 81, y: 0))

        // Then
        #expect(self._currentTouchedPageIndex == 1, "Next select page is 1")
        #expect(self._currentPageIndex == 0, "Current page is not updated")

        // When
        sut.onEnded(location: CGPoint(x: 81, y: 0))

        // Then
        #expect(self._currentTouchedPageIndex == nil, "Next select page is nil")
        #expect(self._currentPageIndex == 1, "Current page is not updated")
    }

    @Test("Drag along view")
    func dragAlongView() {
        // Given
        self._currentPageIndex = 0
        let sut = self.sut()

        // When
        sut.onChanged(location: CGPoint(x: 81, y: 0))
        // Then
        #expect(self._currentTouchedPageIndex == 1, "Next select page is 1")
        #expect(self._currentPageIndex == 0, "Current page is not updated")

        // When
        sut.onChanged(location: CGPoint(x: 121, y: 0))
        // Then
        #expect(self._currentTouchedPageIndex == 2, "Next select page is 1")
        #expect(self._currentPageIndex == 1, "Current page is not updated")

        // When
        sut.onEnded(location: CGPoint(x: 159, y: 0))

        // Then
        #expect(self._currentTouchedPageIndex == nil, "Next select page is nil")
        #expect(self._currentPageIndex == 2, "Current page is not updated")
    }

    @Test("Index 2 is current 0 may be selected")
    func index2IsCurrent0MayBeSelected() {
        // Given
        self._currentPageIndex = 2
        let sut = self.sut()

        // When
        sut.onChanged(location: CGPoint(x: 0, y: 0))

        // Then
        #expect(self._currentTouchedPageIndex == 1, "Next select page is 1")
        #expect(self._currentPageIndex == 2, "Current page is not updated")

        // When
        sut.onEnded(location: CGPoint(x: 81, y: 0))

        // Then
        #expect(self._currentTouchedPageIndex == nil, "Next select page is nil")
        #expect(self._currentPageIndex == 1, "Current page is not updated")
    }

    @Test("Cant skip disabled")
    func cantSkipDisabled() {
        // Given
        self._currentPageIndex = 0
        self.disabledIndices.insert(1)
        let sut = self.sut()

        // When
        sut.onChanged(location: CGPoint(x: 81, y: 0))

        // Then
        #expect(self._currentTouchedPageIndex == nil, "Next select page is nil")
        #expect(self._currentPageIndex == 0, "Current page is not updated")

        // When
        sut.onEnded(location: CGPoint(x: 81, y: 0))

        // Then
        #expect(self._currentTouchedPageIndex == nil, "Next select page is nil")
        #expect(self._currentPageIndex == 0, "Current page is not updated")
    }

    @Test("Touch outside frame ignored")
    func touchOutsideFrameIgnored() {
        // Given
        self._currentPageIndex = 0
        self.disabledIndices.insert(1)
        let sut = self.sut()

        // When
        sut.onChanged(location: CGPoint(x: 161, y: 0))

        // Then
        #expect(self._currentTouchedPageIndex == nil, "Current touched page is nil")
        #expect(self._currentPageIndex == 0, "Current page is not updated")

        // When
        sut.onEnded(location: CGPoint(x: 161, y: 0))

        // Then
        #expect(self._currentTouchedPageIndex == nil, "Next select page is nil")
        #expect(self._currentPageIndex == 0, "Current page is not updated")
    }

    // MARK: Private helpers
    private func sut() -> ProgressTrackerContinuousGestureHandler {
        return .init(
            currentPageIndex: self.currentPageIndex,
            currentTouchedPageIndex: self.currentTouchedPageIndex,
            indicators: self.indicators,
            frame: CGRect(x: 0, y: 0, width: self.indicators.count * 40, height: 40),
            disabledIndices: self.disabledIndices)
    }
}
