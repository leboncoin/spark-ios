//
//  SnackbarGetIntentsUseCaseTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSnackbar
import SparkComponentButton
import Testing

@Suite("Snackbar Get Intents Use Case Tests")
struct SnackbarGetIntentsUseCaseTests {

    // MARK: - Properties

    let sut: SnackbarGetIntentsUseCase

    // MARK: - Initialization

    init() {
        self.sut = SnackbarGetIntentsUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns alert button intent for alert snackbar intent")
    func executeReturnsAlertButtonIntentForAlertSnackbarIntent() {
        // GIVEN / WHEN
        let intents = self.sut.execute(intent: .alert)

        // THEN
        #expect(intents.button == .alert)
    }

    @Test("Execute returns danger button intent for error snackbar intent")
    func executeReturnsDangerButtonIntentForErrorSnackbarIntent() {
        // GIVEN / WHEN
        let intents = self.sut.execute(intent: .error)

        // THEN
        #expect(intents.button == .danger)
    }

    @Test("Execute returns info button intent for info snackbar intent")
    func executeReturnsSupportButtonIntentForInfoSnackbarIntent() {
        // GIVEN / WHEN
        let intents = self.sut.execute(intent: .info)

        // THEN
        #expect(intents.button == .info)
    }

    @Test("Execute returns success button intent for success snackbar intent")
    func executeReturnsSuccessButtonIntentForSuccessSnackbarIntent() {
        // GIVEN / WHEN
        let intents = self.sut.execute(intent: .success)

        // THEN
        #expect(intents.button == .success)
    }

    @Test("Execute returns info button intent for deprecated accent intent")
    func executeReturnsSupportButtonIntentForDeprecatedAccentIntent() {
        // GIVEN / WHEN
        let intents = self.sut.execute(intent: .accent)

        // THEN
        #expect(intents.button == .info)
    }

    @Test("Execute returns info button intent for deprecated main intent")
    func executeReturnsSupportButtonIntentForDeprecatedMainIntent() {
        // GIVEN / WHEN
        let intents = self.sut.execute(intent: .main)

        // THEN
        #expect(intents.button == .info)
    }

    @Test("Execute returns info button intent for deprecated neutral intent")
    func executeReturnsSupportButtonIntentForDeprecatedNeutralIntent() {
        // GIVEN / WHEN
        let intents = self.sut.execute(intent: .neutral)

        // THEN
        #expect(intents.button == .info)
    }

    @Test("Execute returns info button intent for deprecated info intent")
    func executeReturnsSupportButtonIntentForDeprecatedSupportIntent() {
        // GIVEN / WHEN
        let intents = self.sut.execute(intent: .info)

        // THEN
        #expect(intents.button == .info)
    }

    @Test("Execute returns info button intent for deprecated surfaceInverse intent")
    func executeReturnsSupportButtonIntentForDeprecatedSurfaceInverseIntent() {
        // GIVEN / WHEN
        let intents = self.sut.execute(intent: .surfaceInverse)

        // THEN
        #expect(intents.button == .info)
    }

    @Test("Execute returns correct button intent for all active cases", arguments: [
        (SnackbarIntent.alert, ButtonIntent.alert),
        (SnackbarIntent.error, ButtonIntent.danger),
        (SnackbarIntent.info, ButtonIntent.info),
        (SnackbarIntent.success, ButtonIntent.success)
    ])
    func executeReturnsCorrectButtonIntentForAllActiveCases(
        snackbarIntent: SnackbarIntent,
        expectedButtonIntent: ButtonIntent
    ) {
        // GIVEN / WHEN
        let intents = self.sut.execute(intent: snackbarIntent)

        // THEN
        #expect(intents.button == expectedButtonIntent)
    }
}
