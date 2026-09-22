//
//  ButtonGetAppearanceUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 27/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
import Testing

@Suite("Button Get Appearance Use Case Tests")
struct ButtonGetAppearanceUseCaseTests {

    // MARK: - Properties

    let featureToggleService: SparkFeatureToggleServicingGeneratedMock

    // MARK: - Initialization

    init() {
        self.featureToggleService = SparkFeatureToggleServicingGeneratedMock()
    }

    // MARK: - Tests

    @Test("Execute returns appearance when provided")
    func executeReturnsAppearanceWhenProvided() {
        // GIVEN
        self.featureToggleService.appearance = false
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            .primary,
            intent: .main,
            variant: .filled
        )

        // THEN
        #expect(appearance == .primary)
    }

    @Test("Execute returns nil when appearance is nil and feature toggle is false")
    func executeReturnsNilWhenAppearanceIsNilAndFeatureToggleIsFalse() {
        // GIVEN
        self.featureToggleService.appearance = false
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .main,
            variant: .filled
        )

        // THEN
        #expect(appearance == nil)
    }

    @Test("Execute returns calculated appearance when appearance is nil and feature toggle is true")
    func executeReturnsCalculatedAppearanceWhenAppearanceIsNilAndFeatureToggleIsTrue() {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .main,
            variant: .filled
        )

        // THEN
        #expect(appearance == .primary)
    }

    @Test(
        "Execute returns correct appearance for main intent when feature toggle is true",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.primary),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func executeReturnsCorrectAppearanceForMainIntentWhenFeatureToggleIsTrue(
        variant: ButtonVariant,
        expectedAppearance: ButtonAppearance
    ) {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .main,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Execute returns correct appearance for support intent when feature toggle is true",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.secondary),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func executeReturnsCorrectAppearanceForSupportIntentWhenFeatureToggleIsTrue(
        variant: ButtonVariant,
        expectedAppearance: ButtonAppearance
    ) {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .support,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Execute returns correct appearance for success intent when feature toggle is true",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.success),
            (ButtonVariant.outlined, ButtonAppearance.success),
            (ButtonVariant.tinted, ButtonAppearance.success),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func executeReturnsCorrectAppearanceForSuccessIntentWhenFeatureToggleIsTrue(
        variant: ButtonVariant,
        expectedAppearance: ButtonAppearance
    ) {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .success,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Execute returns correct appearance for danger intent when feature toggle is true",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.danger),
            (ButtonVariant.outlined, ButtonAppearance.danger),
            (ButtonVariant.tinted, ButtonAppearance.danger),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func executeReturnsCorrectAppearanceForDangerIntentWhenFeatureToggleIsTrue(
        variant: ButtonVariant,
        expectedAppearance: ButtonAppearance
    ) {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .danger,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Execute returns correct appearance for info intent when feature toggle is true",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.tertiary),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func executeReturnsCorrectAppearanceForInfoIntentWhenFeatureToggleIsTrue(
        variant: ButtonVariant,
        expectedAppearance: ButtonAppearance
    ) {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .info,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Execute returns correct appearance for alert intent when feature toggle is true",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.tertiary),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func executeReturnsCorrectAppearanceForAlertIntentWhenFeatureToggleIsTrue(
        variant: ButtonVariant,
        expectedAppearance: ButtonAppearance
    ) {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .alert,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Execute returns correct appearance for neutral intent when feature toggle is true",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.tertiary),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func executeReturnsCorrectAppearanceForNeutralIntentWhenFeatureToggleIsTrue(
        variant: ButtonVariant,
        expectedAppearance: ButtonAppearance
    ) {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .neutral,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Execute returns correct appearance for surface intent when feature toggle is true",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.contrast),
            (ButtonVariant.outlined, ButtonAppearance.contrast),
            (ButtonVariant.ghost, ButtonAppearance.ghost)
        ]
    )
    func executeReturnsCorrectAppearanceForSurfaceIntentWhenFeatureToggleIsTrue(
        variant: ButtonVariant,
        expectedAppearance: ButtonAppearance
    ) {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .surface,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Execute returns correct appearance for accent intent when feature toggle is true",
        arguments: [
            (ButtonVariant.filled, ButtonAppearance.boost),
            (ButtonVariant.outlined, ButtonAppearance.tertiary),
            (ButtonVariant.tinted, ButtonAppearance.tertiary),
            (ButtonVariant.ghost, ButtonAppearance.ghost),
            (ButtonVariant.contrast, ButtonAppearance.contrast)
        ]
    )
    func executeReturnsCorrectAppearanceForAccentIntentWhenFeatureToggleIsTrue(
        variant: ButtonVariant,
        expectedAppearance: ButtonAppearance
    ) {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .accent,
            variant: variant
        )

        // THEN
        #expect(appearance == expectedAppearance)
    }

    @Test(
        "Execute returns AI appearance for all AI intent variants when feature toggle is true",
        arguments: [
            ButtonVariant.filled,
            ButtonVariant.outlined,
            ButtonVariant.tinted,
            ButtonVariant.ghost,
            ButtonVariant.contrast
        ]
    )
    func executeReturnsAIAppearanceForAllAIIntentVariantsWhenFeatureToggleIsTrue(variant: ButtonVariant) {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .ai,
            variant: variant
        )

        // THEN
        #expect(appearance == .ai)
    }

    @Test(
        "Execute returns tertiary for surfaceInverse intent with any variant when feature toggle is true",
        arguments: [
            ButtonVariant.filled,
            ButtonVariant.outlined,
            ButtonVariant.tinted,
            ButtonVariant.ghost,
            ButtonVariant.contrast
        ]
    )
    func executeReturnsTertiaryForSurfaceInverseIntentWithAnyVariantWhenFeatureToggleIsTrue(variant: ButtonVariant) {
        // GIVEN
        self.featureToggleService.appearance = true
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        // WHEN
        let appearance = sut.execute(
            nil,
            intent: .surfaceInverse,
            variant: variant
        )

        // THEN
        #expect(appearance == .tertiary)
    }

    @Test("Execute always returns provided appearance regardless of feature toggle")
    func executeAlwaysReturnsProvidedAppearanceRegardlessOfFeatureToggle() {
        // GIVEN
        self.featureToggleService.appearance = false
        let sut = ButtonGetAppearanceUseCase(featureTogglesService: self.featureToggleService)

        let testCases: [(ButtonAppearance, ButtonIntent, ButtonVariant)] = [
            (.primary, .support, .ghost),
            (.secondary, .main, .filled),
            (.tertiary, .accent, .contrast),
            (.ghost, .danger, .filled),
            (.boost, .main, .outlined)
        ]

        // WHEN / THEN
        for (providedAppearance, intent, variant) in testCases {
            let appearance = sut.execute(
                providedAppearance,
                intent: intent,
                variant: variant
            )
            #expect(appearance == providedAppearance)
        }
    }
}
