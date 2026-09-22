//
//  SnackbarButtonTypeDeprecatedTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SparkComponentButton
@testable import SparkComponentSnackbar

@Suite("Snackbar Button Type Deprecated Tests")
struct SnackbarButtonTypeDeprecatedTests {

    // MARK: - Tests

    @Test("Initialize with intent and variant")
    func initializeWithIntentAndVariant() {
        // GIVEN
        let givenIntent = ButtonIntent.success
        let givenVariant = ButtonVariant.filled

        // WHEN
        let buttonType = SnackbarButtonTypeDeprecated(
            intent: givenIntent,
            variant: givenVariant
        )

        // THEN
        #expect(buttonType.intent == givenIntent)
        #expect(buttonType.variant == givenVariant)
    }

    @Test("Initialize with different intent and variant combinations")
    func initializeWithDifferentCombinations() {
        // GIVEN
        let testCases: [(ButtonIntent, ButtonVariant)] = [
            (.main, .filled),
            (.support, .tinted),
            (.alert, .ghost),
            (.danger, .contrast)
        ]

        for (intent, variant) in testCases {
            // WHEN
            let buttonType = SnackbarButtonTypeDeprecated(
                intent: intent,
                variant: variant
            )

            // THEN
            #expect(buttonType.intent == intent)
            #expect(buttonType.variant == variant)
        }
    }
}
