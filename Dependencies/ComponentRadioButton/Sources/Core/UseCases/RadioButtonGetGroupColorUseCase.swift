//
//  RadioButtonGetGroupColorUseCase.swift
//  SparkRadioButton
//
//  Created by michael.zimmermann on 28.06.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable
protocol RadioButtonGetGroupColorUseCaseable {
    func execute(colors: any Colors, intent: RadioButtonIntent) -> any ColorToken
}

/// GetRadioButtonGroupColorUseCase
/// Returns the color of the state of the radio button group
/// Functions:
/// - execute: takes a colors and states and returns a ``ColorToken`` defining the state.
struct RadioButtonGetGroupColorUseCase: RadioButtonGetGroupColorUseCaseable {
    // MARK: - Functions

    /// Return the color token corresponding to the state
    func execute(colors: any Colors, intent: RadioButtonIntent) -> any ColorToken {
        switch intent {
        case .accent:
            return colors.accent.accent
        case .alert:
            return colors.feedback.alert
        case .danger:
            return colors.feedback.error
        case .info:
            return colors.feedback.info
        case .main:
            return colors.main.main
        case .neutral:
            return colors.feedback.neutral
        case .success:
            return colors.feedback.success
        case .support:
            return colors.support.support
        }
    }
}
