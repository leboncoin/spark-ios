//
//  ProgressBarIndeterminateAnimationTypeTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 29/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentProgressBar

@MainActor
@Suite("Progress Bar Indeterminate Animation Type Tests")
struct ProgressBarIndeterminateAnimationTypeTests {

    // MARK: - Tests

    @Test("Next")
    func next() throws {
        // GIVEN
        let items: [(
            givenType: ProgressBarIndeterminateAnimationType,
            expectedNextType: ProgressBarIndeterminateAnimationType
        )] = [
            (
                givenType: .easeIn,
                expectedNextType: .easeOut
            ),
            (
                givenType: .easeOut,
                expectedNextType: .reset
            ),
            (
                givenType: .reset,
                expectedNextType: .easeIn
            )
        ]

        for item in items {
            // WHEN
            var type = item.givenType
            type.next()

            // THEN
            #expect(type == item.expectedNextType, "Wrong next type when type is \(item.givenType)")
        }
    }
}
