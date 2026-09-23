//
//  RadioButtonGetColorsUseCase.swift
//  SparkComponentRadioButton
//
//  Created by michael.zimmermann on 11.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable
protocol RadioButtonGetColorsUseCaseable {
    func execute(theme: any Theme,
                 intent: RadioButtonIntent,
                 isSelected: Bool) -> RadioButtonColors
}

/// A use case to determine the colors of a radio button.
/// Properties:
/// - theming: Contains state and theme of the radio button ``RadioButtonTheming``
///
/// Functions:
/// - execute: takes a parameter if the radio button is selected or not, and returns a ``RadioButtonColors`` defining the various colors of the radion button.
struct RadioButtonGetColorsUseCase: RadioButtonGetColorsUseCaseable {

    // MARK: - Functions
    ///
    /// Calculate the colors of the radio button depending on it's state and whether it is selected or not.
    ///
    /// - Parameters:
    ///    - isSelected = true, when the radion button is selected, false otherwise.
    ///
    /// - Returns: ``RadioButtonColors`` which contains the various colors of the radio button.
    func execute(theme: any Theme,
                 intent: RadioButtonIntent,
                 isSelected: Bool) -> RadioButtonColors {
        let buttonColor = theme.colors.buttonColor(
            intent: intent,
            isSelected: isSelected)

        return RadioButtonColors(
            button: buttonColor,
            label: theme.colors.base.onBackground,
            halo: theme.colors.haloColor(intent: intent),
            fill: isSelected ? buttonColor : ColorTokenDefault.clear,
            surface: theme.colors.surfaceColor(intent: intent)
        )
    }
}

// MARK: - Private Extensions

private extension Colors {
    func buttonColor(
        intent: RadioButtonIntent,
        isSelected: Bool) -> any ColorToken {
            return  isSelected ? self.selectedColor(intent: intent) : self.base.outline
    }

    private func selectedColor(intent: RadioButtonIntent) -> any ColorToken {
        switch intent {
        case .accent:
            return self.accent.accent
        case .alert:
            return self.feedback.alert
        case .danger:
            return self.feedback.error
        case .info:
            return self.feedback.info
        case .main:
            return self.main.main
        case .neutral:
            return self.feedback.neutral
        case .success:
            return self.feedback.success
        case .support:
            return self.support.support
        }
    }

    func surfaceColor(intent: RadioButtonIntent) -> any ColorToken {
        switch intent {
        case .accent:
            return self.accent.onAccent
        case .alert:
            return self.feedback.onAlert
        case .danger:
            return self.feedback.onError
        case .info:
            return self.feedback.onInfo
        case .main:
            return self.main.onMain
        case .neutral:
            return self.feedback.onNeutral
        case .success:
            return self.feedback.onSuccess
        case .support:
            return self.support.onSupport
        }
    }

    func haloColor(intent: RadioButtonIntent) -> any ColorToken {
        switch intent {
        case .accent:
            return self.accent.accentContainer
        case .alert:
            return self.feedback.alertContainer
        case .danger:
            return self.feedback.errorContainer
        case .info:
            return self.feedback.infoContainer
        case .main:
            return self.main.mainContainer
        case .neutral:
            return self.feedback.neutralContainer
        case .success:
            return self.feedback.successContainer
        case .support:
            return self.support.supportContainer
        }
    }
}
