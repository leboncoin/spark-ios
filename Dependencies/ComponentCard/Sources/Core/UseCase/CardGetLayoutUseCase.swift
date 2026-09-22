//
//  CardGetLayoutUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol CardGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        padding: CardPadding,
        headerPosition: CardHeaderPosition
    ) -> CardLayout
}

final class CardGetLayoutUseCase: CardGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        padding: CardPadding,
        headerPosition: CardHeaderPosition
    ) -> CardLayout {
        let isHeaderBottonPadding = padding == .allAndBottomHeader && headerPosition.contentHasTopPadding

        let padding = padding.isPadding ? theme.layout.spacing.large : .zero

        switch headerPosition {
        case .banner:
            let headerPadding = theme.layout.spacing.medium

            return CardLayout(
                padding: padding,
                headerVerticalPadding: headerPadding,
                headerHorizontalPadding: headerPadding,
                isHeaderBottonPadding: isHeaderBottonPadding
            )

        case .border:
            return CardLayout(
                padding: padding,
                headerVerticalPadding: theme.layout.spacing.small,
                headerHorizontalPadding: theme.layout.spacing.large,
                isHeaderBottonPadding: isHeaderBottonPadding
            )
        }
    }
}
