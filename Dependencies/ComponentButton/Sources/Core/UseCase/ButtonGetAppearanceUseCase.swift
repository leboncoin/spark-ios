//
//  ButtonGetAppearanceUseCase.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 27/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkCommon

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetAppearanceUseCaseable {
    func execute(
        _ appearance: ButtonAppearance?,
        intent: ButtonIntent,
        variant: ButtonVariant
    ) -> ButtonAppearance?
}

@available(*, deprecated, message: "Should be removed ASAP (25/07/26)")
struct ButtonGetAppearanceUseCase: ButtonGetAppearanceUseCaseable {

    // MARK: - Private properties

    private let featureTogglesService: any SparkFeatureToggleServicing

    // MARK: - Initialization

    init(
        featureTogglesService: any SparkFeatureToggleServicing = SparkFeatureToggleService.shared
    ) {
        self.featureTogglesService = featureTogglesService
    }

    // MARK: - Methods

    func execute(
        _ appearance: ButtonAppearance?,
        intent: ButtonIntent,
        variant: ButtonVariant
    ) -> ButtonAppearance? {
        return if let appearance {
            appearance
        } else if self.featureTogglesService.appearance {
            .init(intent: intent, variant: variant)
        } else {
            nil
        }
    }
}
