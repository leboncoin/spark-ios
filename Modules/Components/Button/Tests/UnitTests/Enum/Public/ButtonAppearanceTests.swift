//
//  ButtonAppearanceTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 25/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
import Testing

@Suite("Button Appearance Tests")
struct ButtonAppearanceTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [ButtonAppearance] = [
            .primary,
            .secondary,
            .tertiary,
            .contrast,
            .ghost,
            .success,
            .danger,
            .boost,
            .ai
        ]

        // WHEN / THEN
        #expect(ButtonAppearance.allCases.count == expectedCases.count)
        #expect(Set(ButtonAppearance.allCases) == Set(expectedCases))
    }

    @Test("Default value is primary")
    func defaultValueIsPrimary() {
        // GIVEN / WHEN / THEN
        #expect(ButtonAppearance.default == .primary)
    }

    // MARK: - Init Tests

    @Test("Init returns primary for main filled")
    func initReturnsPrimaryForMainFilled() {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .main,
            variant: .filled
        )

        // THEN
        #expect(appearance == .primary)
    }

    @Test(
        "Init returns correct appearance for main intent",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.primary),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func initReturnsCorrectAppearanceForMainIntent(variant: ButtonVariant, expectedAppearance: ButtonAppearance) {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .main,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Init returns correct appearance for support intent",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.secondary),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func initReturnsCorrectAppearanceForSupportIntent(variant: ButtonVariant, expectedAppearance: ButtonAppearance) {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .support,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Init returns correct appearance for success intent",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.success),
            (ButtonVariant.outlined, ButtonAppearance.success),
            (ButtonVariant.tinted, ButtonAppearance.success),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func initReturnsCorrectAppearanceForSuccessIntent(variant: ButtonVariant, expectedAppearance: ButtonAppearance) {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .success,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Init returns correct appearance for danger intent",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.danger),
            (ButtonVariant.outlined, ButtonAppearance.danger),
            (ButtonVariant.tinted, ButtonAppearance.danger),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func initReturnsCorrectAppearanceForDangerIntent(variant: ButtonVariant, expectedAppearance: ButtonAppearance) {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .danger,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Init returns correct appearance for info intent",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.tertiary),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func initReturnsCorrectAppearanceForInfoIntent(variant: ButtonVariant, expectedAppearance: ButtonAppearance) {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .info,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Init returns correct appearance for alert intent",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.tertiary),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func initReturnsCorrectAppearanceForAlertIntent(variant: ButtonVariant, expectedAppearance: ButtonAppearance) {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .alert,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Init returns correct appearance for neutral intent",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.tertiary),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func initReturnsCorrectAppearanceForNeutralIntent(variant: ButtonVariant, expectedAppearance: ButtonAppearance) {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .neutral,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Init returns correct appearance for surface intent",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.contrast),
            (ButtonVariant.outlined, ButtonAppearance.contrast),
            (ButtonVariant.ghost, ButtonAppearance.ghost)
        ]
    )
    func initReturnsCorrectAppearanceForSurfaceIntent(variant: ButtonVariant, expectedAppearance: ButtonAppearance) {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .surface,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Init returns correct appearance for accent intent",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.boost),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func initReturnsCorrectAppearanceForAccentIntent(variant: ButtonVariant, expectedAppearance: ButtonAppearance) {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .accent,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Init returns AI appearance for all AI intent variants",
        arguments: [
            ButtonVariant.filled,
            ButtonVariant.outlined,
            ButtonVariant.tinted,
            ButtonVariant.ghost,
            ButtonVariant.contrast
        ]
    )
    func initReturnsAIAppearanceForAllAIIntentVariants(variant: ButtonVariant) {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .ai,
            variant: variant
        )

        // THEN
        #expect(appearance == .ai)
    }

    @Test(
        "Init returns tertiary for surfaceInverse intent with any variant",
        arguments: [
            ButtonVariant.filled,
            ButtonVariant.outlined,
            ButtonVariant.tinted,
            ButtonVariant.ghost,
            ButtonVariant.contrast
        ]
    )
    func initReturnsTertiaryForSurfaceInverseIntentWithAnyVariant(variant: ButtonVariant) {
        // GIVEN / WHEN
        let appearance = ButtonAppearance(
            intent: .surfaceInverse,
            variant: variant
        )

        // THEN
        #expect(appearance == .tertiary)
    }
}
