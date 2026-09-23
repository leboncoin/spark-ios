//
//  CheckboxGetColorsUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 31/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CheckboxGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func executeStatic(theme: any Theme, intent: SelectionControlsIntent) -> CheckboxStaticColors
    // sourcery: theme = "Identical"
    func executeDynamic(theme: any Theme, intent: SelectionControlsIntent, selectionState: CheckboxSelectionState) -> CheckboxDynamicColors
}

struct CheckboxGetColorsUseCase: CheckboxGetColorsUseCaseable {

    // MARK: - Properties

    private let getColorUseCase: CommonGetColorUseCaseable

    // MARK: - Initialization

    init(getColorUseCase: CommonGetColorUseCaseable = CommonGetColorUseCase()) {
        self.getColorUseCase = getColorUseCase
    }

    // MARK: - Methods

    func executeStatic(
        theme: any Theme,
        intent: SelectionControlsIntent
    ) -> CheckboxStaticColors {
        let iconForeground = switch intent {
        case .error: theme.colors.feedback.onError
        case .support: theme.colors.support.onSupport
        }

        let hover = self.getColorUseCase.executeHover(
            theme: theme,
            intent: intent
        )

        return .init(
            iconForeground: iconForeground,
            hover: hover
        )
    }

    func executeDynamic(
        theme: any Theme,
        intent: SelectionControlsIntent,
        selectionState: CheckboxSelectionState
    ) -> CheckboxDynamicColors {
        let isSelected = switch selectionState {
        case .selected, .indeterminate: true
        case .unselected: false
        }

        lazy var selectedBackground = self.getColorUseCase.executeContent(
            theme: theme,
            intent: intent
        )

        let border = self.getColorUseCase.executeBorder(
            theme: theme,
            intent: intent,
            isSelected: isSelected
        )

        return .init(
            background: isSelected ? selectedBackground : ColorTokenDefault.clear,
            border: border
        )
    }
}
