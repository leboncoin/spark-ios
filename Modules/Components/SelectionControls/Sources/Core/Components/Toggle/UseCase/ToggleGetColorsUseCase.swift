//
//  ToggleGetColorsUseCase.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 12/05/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ToggleGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func executeStatic(theme: any Theme) -> ToggleStaticColors
    // sourcery: theme = "Identical"
    func executeDynamic(theme: any Theme, isOn: Bool) -> ToggleDynamicColors
}

struct ToggleGetColorsUseCase: ToggleGetColorsUseCaseable {

    // MARK: - Properties

    private let getColorUseCase: CommonGetColorUseCaseable

    // MARK: - Initialization

    init(getColorUseCase: CommonGetColorUseCaseable = CommonGetColorUseCase()) {
        self.getColorUseCase = getColorUseCase
    }

    // MARK: - Methods

    func executeStatic(theme: any Theme) -> ToggleStaticColors {
        let hover = self.getColorUseCase.executeHover(
            theme: theme,
            intent: .support
        )

        return .init(
            dotBackground: theme.colors.base.surface,
            hover: hover
        )
    }

    func executeDynamic(theme: any Theme, isOn: Bool) -> ToggleDynamicColors {
        let color = self.getColorUseCase.executeContent(
            theme: theme,
            intent: .support
        )

        return .init(
            background: isOn ? color : color.opacity(theme.dims.dim3),
            dotForeground: isOn ? color : color.opacity(theme.dims.dim2)
        )
    }
}
