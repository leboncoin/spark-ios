//
//  ButtonGetSpacingsUseCase.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetSpacingsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        type: ButtonType,
        contentVisibility: ButtonContentVisibility
    ) -> ButtonLayout
}

struct ButtonGetSpacingsUseCase: ButtonGetSpacingsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        type: ButtonType,
        contentVisibility: ButtonContentVisibility
    ) -> ButtonLayout {
        let spacing = theme.layout.spacing

        let horizontalPadding = if type == .button && contentVisibility.showLabel {
            spacing.large
        } else {
            spacing.none
        }

        return .init(
            horizontalSpacing: spacing.medium,
            horizontalPadding: horizontalPadding
        )
    }
}
