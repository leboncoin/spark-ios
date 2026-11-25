//
//  SegmentedControlToken+AnimationTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by Robin Lemaire on 25/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentSegmentedControl

// MARK: - Tests

struct SegmentedControlTokenAnimationTests {

    // MARK: - Properties

    private let token = SegmentedControlToken.Animation()

    // MARK: - Tests

    @Test("selection duration should return 0.15")
    func selectionDurationShouldReturnValue() {
        #expect(self.token.selectionDuration == 0.15)
    }

    @Test("selection should return easeInOut with selection duration")
    func selectionShouldReturnEaseInOut() {
        #expect(self.token.selection == .easeInOut(duration: 0.15))
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(SegmentedControlToken.Animation() == SegmentedControlToken.Animation())
    }
}
