//
//  CardGetBorderUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CardGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        variant: CardVariant,
        isHeader: Bool,
        headerPosition: CardHeaderPosition
    ) -> CardBorder
}

final class CardGetBorderUseCase: CardGetBorderUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        variant: CardVariant,
        isHeader: Bool,
        headerPosition: CardHeaderPosition
    ) -> CardBorder {
        let width = switch (variant, isHeader, headerPosition) {
        case (.outlined, true, .banner): theme.border.width.medium
        case (.outlined, _, _): theme.border.width.small
        default: theme.border.width.none
        }

        let headerRadius: CGFloat = switch headerPosition {
        case .banner: theme.border.radius.none
        case .border: theme.border.radius.large
        }

        return .init(
            width: width,
            radius: theme.border.radius.large,
            headerRadius: headerRadius
        )
    }
}
