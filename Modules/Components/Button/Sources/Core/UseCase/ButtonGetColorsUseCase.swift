//
//  ButtonGetContextColorsUseCase.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetColorsUseCaseable {
    @available(*, deprecated, message: "Replace with func with appearance parameter")
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        appearance: ButtonAppearance?,
        intent: ButtonIntent,
        variant: ButtonVariant,
        isPressed: Bool
    ) -> ButtonColors

    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        appearance: ButtonAppearance,
        isPressed: Bool
    ) -> ButtonColors
}

struct ButtonGetColorsUseCase: ButtonGetColorsUseCaseable {

    // MARK: - Private properties

    private let getContrastUseCase: any ButtonGetVariantUseCaseable
    private let getFilledUseCase: any ButtonGetVariantUseCaseable
    private let getGhostUseCase: any ButtonGetVariantUseCaseable
    private let getOutlinedUseCase: any ButtonGetVariantUseCaseable
    private let getTintedUseCase: any ButtonGetVariantUseCaseable
    private let getAppearanceUseCase: any ButtonGetAppearanceUseCaseable

    // MARK: - Initialization

    init(
        getContrastUseCase: any ButtonGetVariantUseCaseable = ButtonVariantGetContrastUseCase(),
        getFilledUseCase: any ButtonGetVariantUseCaseable = ButtonGetVariantFilledUseCase(),
        getGhostUseCase: any ButtonGetVariantUseCaseable = ButtonGetVariantGhostUseCase(),
        getOutlinedUseCase: any ButtonGetVariantUseCaseable = ButtonGetVariantOutlinedUseCase(),
        getTintedUseCase: any ButtonGetVariantUseCaseable = ButtonGetVariantTintedUseCase(),
        getAppearanceUseCase: any ButtonGetAppearanceUseCaseable = ButtonGetAppearanceUseCase()
    ) {
        self.getContrastUseCase = getContrastUseCase
        self.getFilledUseCase = getFilledUseCase
        self.getGhostUseCase = getGhostUseCase
        self.getOutlinedUseCase = getOutlinedUseCase
        self.getTintedUseCase = getTintedUseCase
        self.getAppearanceUseCase = getAppearanceUseCase
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        appearance: ButtonAppearance?,
        intent: ButtonIntent,
        variant: ButtonVariant,
        isPressed: Bool
    ) -> ButtonColors {
        if let appearance = self.getAppearanceUseCase.execute(
            appearance,
            intent: intent,
            variant: variant
        ) {
            return self.execute(
                theme: theme,
                appearance: appearance,
                isPressed: isPressed
            )

        } else {

            let useCase: ButtonGetVariantUseCaseable
            switch variant {
            case .contrast:
                useCase = self.getContrastUseCase
            case .filled:
                useCase = self.getFilledUseCase
            case .ghost:
                useCase = self.getGhostUseCase
            case .outlined:
                useCase = self.getOutlinedUseCase
            case .tinted:
                useCase = self.getTintedUseCase
            }

            return useCase.execute(
                theme: theme,
                intent: intent,
                isPressed: isPressed
            )
        }
    }

    func execute(
        theme: any Theme,
        appearance: ButtonAppearance,
        isPressed: Bool
    ) -> ButtonColors {
        let colors = theme.colors

        return switch appearance {
        case .primary:
                .init(
                    tintColor: colors.main.onMain,
                    backgroundColor: isPressed ? colors.states.mainPressed : colors.main.main,
                    borderColor: ColorTokenDefault.clear
                )

        case .secondary:
                .init(
                    tintColor: colors.support.onSupport,
                    backgroundColor: isPressed ? colors.states.supportPressed : colors.support.support,
                    borderColor: ColorTokenDefault.clear
                )

        case .tertiary:
                .init(
                    tintColor: colors.base.onSurface,
                    backgroundColor: isPressed ? colors.states.surfacePressed : ColorTokenDefault.clear,
                    borderColor: colors.base.outline
                )

        case .contrast:
                .init(
                    tintColor: colors.base.onSurface,
                    backgroundColor: isPressed ? colors.states.surfacePressed : colors.base.surface,
                    borderColor: ColorTokenDefault.clear
                )

        case .ghost:
                .init(
                    tintColor: colors.base.onSurface,
                    backgroundColor: isPressed ? colors.states.surfacePressed : ColorTokenDefault.clear,
                    borderColor: ColorTokenDefault.clear
                )

        case .success:
                .init(
                    tintColor: colors.feedback.success,
                    backgroundColor: isPressed ? colors.states.successPressed.opacity(theme.dims.dim5) : ColorTokenDefault.clear,
                    borderColor: colors.base.outline
                )

        case .danger:
                .init(
                    tintColor: colors.feedback.error,
                    backgroundColor: isPressed ? colors.states.errorPressed.opacity(theme.dims.dim5) : ColorTokenDefault.clear,
                    borderColor: colors.base.outline
                )

        case .boost:
                .init(
                    tintColor: colors.accent.onAccent,
                    backgroundColor: isPressed ? colors.states.accentPressed : colors.accent.accent,
                    borderColor: ColorTokenDefault.clear
                )

        case .ai:
                .init(
                    tintColor: colors.ai.onAIContainer,
                    iconColor: colors.ai.ai,
                    backgroundColor: isPressed ? colors.states.aiContainerPressed : colors.ai.aiContainer,
                    borderColor: colors.ai.ai
                )
        }
    }
}
