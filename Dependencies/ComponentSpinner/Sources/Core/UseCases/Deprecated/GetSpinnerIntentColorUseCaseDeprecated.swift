//
//  SpinnerGetIntentColorUseCaseDeprecated.swift
//  SparkComponentSpinner
//
//  Created by michael.zimmermann on 10.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable
@available(*, deprecated, message: "Not used anymore by SparkSpinner or SparkUISpinner")
protocol SpinnerGetIntentColorUseCasable {
    func execute(colors: any Colors, intent: SpinnerIntent) -> any ColorToken
}

/// SpinnerGetIntentColorUseCaseDeprecated
/// Use case to determin the colors of the Spinner by the intent
/// Functions:
/// - execute: returns a color token for given colors and an intent
@available(*, deprecated, message: "Not used anymore by SparkSpinner or SparkUISpinner")
struct SpinnerGetIntentColorUseCaseDeprecated: SpinnerGetIntentColorUseCasable {

    // MARK: - Functions
    ///
    /// Calculate the color of the spinner depending on the intent
    ///
    /// - Parameters:
    ///    - colors: any Colors from the theme
    ///    - intent: `SpinnerIntent`.
    ///
    /// - Returns: ``ColorToken`` of the spinner.
    func execute(colors: any Colors, intent: SpinnerIntent) -> any ColorToken {
        return switch intent {
        case .main: colors.main.main
        case .support: colors.support.support
        case .alert: colors.feedback.alert
        case .error: colors.feedback.error
        case .info: colors.feedback.info
        case .neutral: colors.feedback.neutral
        case .success: colors.feedback.success
        case .accent: colors.accent.accent
        case .custom(let colorToken): colorToken
        }
    }
}
