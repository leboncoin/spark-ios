//
//  SnackbarAutoDismissDelayTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSnackbar
import Testing

@Suite("Snackbar Auto Dismiss Delay Tests")
struct SnackbarAutoDismissDelayTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [SnackbarAutoDismissDelay] = [.fast, .long]

        // WHEN / THEN
        #expect(SnackbarAutoDismissDelay.allCases.count == expectedCases.count)
        #expect(Set(SnackbarAutoDismissDelay.allCases) == Set(expectedCases))
    }

    @Test("Default value is fast")
    func defaultValueIsFast() {
        // GIVEN / WHEN / THEN
        #expect(SnackbarAutoDismissDelay.default == .fast)
    }

    @Test("Fast delay has 4 seconds")
    func fastDelayHas4Seconds() {
        // GIVEN
        let delay = SnackbarAutoDismissDelay.fast

        // WHEN
        let seconds = delay.seconds

        // THEN
        #expect(seconds == 4.0)
    }

    @Test("Long delay has 10 seconds")
    func longDelayHas10Seconds() {
        // GIVEN
        let delay = SnackbarAutoDismissDelay.long

        // WHEN
        let seconds = delay.seconds

        // THEN
        #expect(seconds == 10.0)
    }
}
