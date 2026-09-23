//
//  ButtonGetBorderUseCase.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetBorderUseCaseable {
    @available(*, deprecated, message: "Replace with func with appearance parameter")
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        appearance: ButtonAppearance?,
        intent: ButtonIntent,
        shape: ButtonShape,
        variant: ButtonVariant,
        removeStyles: Bool
    ) -> ButtonBorder

    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        appearance: ButtonAppearance,
        removeStyles: Bool
    ) -> ButtonBorder
}

struct ButtonGetBorderUseCase: ButtonGetBorderUseCaseable {

    // MARK: - Properties

    private let getAppearanceUseCase: any ButtonGetAppearanceUseCaseable

    // MARK: - Initialization

    init(getAppearanceUseCase: any ButtonGetAppearanceUseCaseable = ButtonGetAppearanceUseCase()) {
        self.getAppearanceUseCase = getAppearanceUseCase
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        appearance: ButtonAppearance?,
        intent: ButtonIntent,
        shape: ButtonShape,
        variant: ButtonVariant,
        removeStyles: Bool
    ) -> ButtonBorder {
        if let appearance = self.getAppearanceUseCase.execute(
            appearance,
            intent: intent,
            variant: variant
        ) {
            return self.execute(
                theme: theme,
                appearance: appearance,
                removeStyles: removeStyles
            )

        } else {

            guard !removeStyles else {
                return .init()
            }

            let border = theme.border

            return .init(
                width: (variant == .outlined) ? border.width.small : 0,
                radius: border.radius.full
            )
        }
    }

    func execute(
        theme: any Theme,
        appearance: ButtonAppearance,
        removeStyles: Bool
    ) -> ButtonBorder {
        guard !removeStyles else {
            return .init()
        }

        let border = theme.border

        let width: CGFloat = switch appearance {
        case .tertiary, .success, .danger, .ai: border.width.small
        default: .zero
        }

        return .init(
            width: width,
            radius: border.radius.full
        )
    }
}
