//
//  RadioButtonGetColorsUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol RadioButtonGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func executeStatic(theme: any Theme, intent: SelectionControlsIntent) -> RadioButtonStaticColors
    // sourcery: theme = "Identical"
    func executeDynamic(theme: any Theme, intent: SelectionControlsIntent, isOn: Bool) -> RadioButtonDynamicColors
}

struct RadioButtonGetColorsUseCase: RadioButtonGetColorsUseCaseable {

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
    ) -> RadioButtonStaticColors {
        let dot = self.getColorUseCase.executeContent(
            theme: theme,
            intent: intent
        )

        let hover = self.getColorUseCase.executeHover(
            theme: theme,
            intent: intent
        )

        return .init(
            dot: dot,
            hover: hover
        )
    }

    func executeDynamic(
        theme: any Theme,
        intent: SelectionControlsIntent,
        isOn: Bool
    ) -> RadioButtonDynamicColors {
        let circle = self.getColorUseCase.executeBorder(
            theme: theme,
            intent: intent,
            isSelected: isOn
        )

        return .init(circle: circle)
    }
}
