//
//  ProgressTrackerGetTrackColorUseCaseTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 24.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentProgressTracker
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Progress Tracker Get Track Color Use Case Tests")
struct ProgressTrackerGetTrackColorUseCaseTests {

    // MARK: - Properties
    var sut: ProgressTrackerGetTrackColorUseCase!
    var colors: ColorsGeneratedMock!

    // MARK: - Setup
    init() {

        self.colors = ColorsGeneratedMock.mocked()
        self.sut = ProgressTrackerGetTrackColorUseCase()
    }

    // MARK: - Tests
    @Test("All intents")
    func allIntents() {
        for intent in ProgressTrackerIntent.allCases {
            let expectedColor = intent.expectedColors(on: self.colors)
            let givenColor = self.sut.execute(colors: self.colors, intent: intent)
            #expect(expectedColor.equals(givenColor) == true, "Enabled color for \(intent) is not as expected")
        }
    }
}

private extension ProgressTrackerIntent {

    func expectedColors(on mock: ColorsGeneratedMock) -> any ColorToken {
        switch self {
        case .neutral: mock.feedback.neutral
        case .success: mock.feedback.success
        case .support: mock.support.support
        default: mock.support.support
        }
    }
}
