//
//  ProgressTrackerGetTrackColorUseCaseTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 24.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentProgressTracker
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ProgressTrackerGetTrackColorUseCaseTests: XCTestCase {

    // MARK: - Properties
    var sut: ProgressTrackerGetTrackColorUseCase!
    var colors: ColorsGeneratedMock!

    // MARK: - Setup
    override func setUp() {
        super.setUp()

        self.colors = ColorsGeneratedMock.mocked()
        self.sut = ProgressTrackerGetTrackColorUseCase()
    }

    // MARK: - Tests
    func test_all_intents() {
        for intent in ProgressTrackerIntent.allCases {
            let expectedColor = intent.expectedColors(on: self.colors)
            let givenColor = self.sut.execute(colors: self.colors, intent: intent)
            XCTAssertTrue(expectedColor.equals(givenColor) == true, "Enabled color for \(intent) is not as expected")
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
