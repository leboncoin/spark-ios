//
//  SnackbarIntentsTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSnackbar
import SparkComponentButton

@Suite("Snackbar Intents Tests")
struct SnackbarIntentsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let intents = SnackbarIntents()

        // THEN
        #expect(intents.button == .default)
    }

    @Test("Custom initialization with button intent")
    func customInitializationWithButtonIntent() {
        // GIVEN / WHEN
        let intents = SnackbarIntents(button: .main)

        // THEN
        #expect(intents.button == .main)
    }

    @Test("Equality when same button intent")
    func equalityWhenSameButtonIntent() {
        // GIVEN / WHEN
        let intents1 = SnackbarIntents(button: .success)
        let intents2 = SnackbarIntents(button: .success)

        // THEN
        #expect(intents1 == intents2)
    }

    @Test("Inequality when different button intent")
    func inequalityWhenDifferentButtonIntent() {
        // GIVEN / WHEN
        let intents1 = SnackbarIntents(button: .main)
        let intents2 = SnackbarIntents(button: .success)

        // THEN
        #expect(intents1 != intents2)
    }

    @Test("Button intent can be modified")
    func buttonIntentCanBeModified() {
        // GIVEN
        var intents = SnackbarIntents(button: .main)

        // WHEN
        intents.button = .alert

        // THEN
        #expect(intents.button == .alert)
    }

    @Test("Default button intent matches ButtonIntent default")
    func defaultButtonIntentMatchesButtonIntentDefault() {
        // GIVEN / WHEN
        let intents = SnackbarIntents()

        // THEN
        #expect(intents.button == ButtonIntent.default)
    }
}
