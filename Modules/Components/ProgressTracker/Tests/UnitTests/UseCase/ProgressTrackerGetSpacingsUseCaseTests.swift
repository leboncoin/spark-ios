//
//  ProgressTrackerGetSpacingsUseCaseTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 24.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentProgressTracker
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Progress Tracker Get Spacings Use Case Tests")
struct ProgressTrackerGetSpacingsUseCaseTests {

    // MARK: Properties
    var sut: ProgressTrackerGetSpacingsUseCase!
    var spacing: (any LayoutSpacing)!

    // MARK: - Setup
    init() {

        self.spacing = LayoutSpacingGeneratedMock.mocked()
        self.sut = ProgressTrackerGetSpacingsUseCase()
    }

    // MARK: - Tests
    @Test("Horizontal spacing")
    func horizontalSpacing() {
        let spacing = self.sut.execute(spacing: self.spacing, orientation: .horizontal)

        #expect(spacing == .init(trackIndicatorSpacing: 3.0, minLabelSpacing: 5.0))
    }

    @Test("Vertical spacing")
    func verticalSpacing() {
        let spacing = self.sut.execute(spacing: self.spacing, orientation: .vertical)

        #expect(spacing == .init(trackIndicatorSpacing: 3.0, minLabelSpacing: 5.0))
    }
}
