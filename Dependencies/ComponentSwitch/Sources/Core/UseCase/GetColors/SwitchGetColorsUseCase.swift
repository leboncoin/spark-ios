//
//  SwitchGetColorUseCase.swift
//  SparkComponentSwitch
//
//  Created by robin.lemaire on 12/05/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable
protocol SwitchGetColorsUseCaseable {
    func execute(intent: SwitchIntent,
                 colors: any Colors,
                 dims: any Dims) -> SwitchColors
}

struct SwitchGetColorsUseCase: SwitchGetColorsUseCaseable {

    // MARK: - Properties

    private let getColorUseCase: any SwitchGetColorUseCaseable

    // MARK: - Initialization

    init(getColorUseCase: any SwitchGetColorUseCaseable = SwitchGetColorUseCase()) {
        self.getColorUseCase = getColorUseCase
    }

    // MARK: - Methods

    func execute(
        intent: SwitchIntent,
        colors: any Colors,
        dims: any Dims
    ) -> SwitchColors {

        // Get color from use case
        let color = self.getColorUseCase.execute(
            intent: intent,
            colors: colors
        )

        let statusAndStateColors = SwitchStatusColors(
            onColorToken: color,
            offColorToken: colors.base.onSurface.opacity(dims.dim4)
        )

        return .init(
            toggleBackgroundColors: statusAndStateColors,
            toggleDotForegroundColors: statusAndStateColors,
            toggleDotBackgroundColor: colors.base.surface,
            textForegroundColor: colors.base.onSurface
        )
    }
}
