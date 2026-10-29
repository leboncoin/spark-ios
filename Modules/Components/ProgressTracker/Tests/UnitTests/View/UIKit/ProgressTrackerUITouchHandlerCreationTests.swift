//
//  ProgressTrackerUITouchHandlerCreationTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 12.02.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
import Testing

@testable import SparkComponentProgressTracker

@MainActor
@Suite("Progress Tracker UI Touch Handler Creation Tests")
struct ProgressTrackerUITouchHandlerCreationTests {
    var controls: [UIControl]!

    // MARK: - Setup
    init() {
        self.controls = (0...4)
            .map { index in
                return CGRect(x: index * 50, y: 0, width: 50, height: 50)
            }
            .map(UIControl.init(frame:))
    }

    // MARK: - Tests
    @Test("Setup none")
    func setupNone() {
        let sut = ProgressTrackerInteractionState.none.touchHandler(currentPageIndex: 0, indicatorViews: self.controls)

        #expect(sut is ProgressTrackerNoneUITouchHandler)
    }

    @Test("Setup discrete")
    func setupDiscrete() {
        let sut = ProgressTrackerInteractionState.discrete.touchHandler(currentPageIndex: 0, indicatorViews: self.controls)

        #expect(sut is ProgressTrackerDiscreteUITouchHandler)
    }

    @Test("Setup continuous")
    func setupContinuous() {
        let sut = ProgressTrackerInteractionState.continuous.touchHandler(currentPageIndex: 0, indicatorViews: self.controls)

        #expect(sut is ProgressTrackerContinuousUITouchHandler)
    }

    @Test("Setup independent")
    func setupIndependent() {
        let sut = ProgressTrackerInteractionState.independent.touchHandler(currentPageIndex: 0, indicatorViews: self.controls)

        #expect(sut is ProgressTrackerIndependentUITouchHandler)
    }

}
