//
//  CommonGetColorUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CommonGetColorUseCaseable {
    // sourcery: contentTheme = "Identical", return = "Identical"
    func executeContent(theme contentTheme: any Theme, intent: SelectionControlsIntent) -> any ColorToken
    // sourcery: borderTheme = "Identical", return = "Identical"
    func executeBorder(theme borderTheme: any Theme, intent: SelectionControlsIntent, isSelected: Bool) -> any ColorToken
    // sourcery: hoverTheme = "Identical", return = "Identical"
    func executeHover(theme hoverTheme: any Theme, intent: SelectionControlsIntent) -> any ColorToken
}

struct CommonGetColorUseCase: CommonGetColorUseCaseable {

    // MARK: - Methods

    func executeContent(
        theme contentTheme: any Theme,
        intent: SelectionControlsIntent
    ) -> any ColorToken {
        return self.executeState(
            theme: contentTheme,
            intent: intent
        )
    }

    func executeBorder(
        theme borderTheme: any Theme,
        intent: SelectionControlsIntent,
        isSelected: Bool
    ) -> any ColorToken {
        let state = self.executeState(
            theme: borderTheme,
            intent: intent
        )

        return switch intent {
        case .error: state
        case .support: isSelected ? state : borderTheme.colors.base.outline
        }
    }

    func executeHover(
        theme hoverTheme: any Theme,
        intent: SelectionControlsIntent
    ) -> any ColorToken {
        return switch intent {
        case .error: hoverTheme.colors.feedback.errorContainer
        case .support: hoverTheme.colors.support.supportContainer
        }
    }

    // MARK: - Private Properties

    private func executeState(
        theme: any Theme,
        intent: SelectionControlsIntent
    ) -> any ColorToken {
        return switch intent {
        case .error: theme.colors.feedback.error
        case .support: theme.colors.support.support
        }
    }
}
