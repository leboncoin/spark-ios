//
//  SnackbarViewModelDeprecated.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 04/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import Combine
import SparkTheming
import SparkComponentButton

@available(*, deprecated, message: "This view model is no longer used and will be removed in a future version.")
final class SnackbarViewModelDeprecated: ObservableObject {

    var theme: any Theme {
        didSet {
            self.refresh()
            self.textFont = self.theme.typography.body2
        }
    }
    var variant: SnackbarVariant {
        didSet {
            guard self.variant != oldValue else { return }
            self.refresh()
        }
    }
    var intent: SnackbarIntent {
        didSet {
            guard self.intent != oldValue else { return }
            self.refresh()
        }
    }

    @Published private(set) var textFont: any TypographyFontToken

    @Published private(set) var buttonIntent: ButtonIntent
    @Published private(set) var buttonVariant: ButtonVariant

    @Published private(set) var border = SnackbarBorder()
    @Published private(set) var colors = SnackbarColors()

    private let getColorsUseCase: any SnackbarGetColorsUseCaseable
    private let getButtonTypeUseCase: any SnackbarGetButtonTypeUseCasableDeprecated
    private let getBorderUseCase: any SnackbarGetBorderUseCaseable

    init(
        theme: any Theme,
        variant: SnackbarVariant,
        intent: SnackbarIntent,
        getColorsUseCase: any SnackbarGetColorsUseCaseable = SnackbarGetColorsUseCase(),
        getButtonTypeUseCase: any SnackbarGetButtonTypeUseCasableDeprecated = SnackbarGetButtonTypeUseCaseDeprecated(),
        getBorderUseCase: any SnackbarGetBorderUseCaseable = SnackbarGetBorderUseCase()
    ) {
        self.theme = theme

        self.variant = variant
        self.intent = intent

        self.getColorsUseCase = getColorsUseCase
        self.getButtonTypeUseCase = getButtonTypeUseCase
        self.getBorderUseCase = getBorderUseCase

        self.textFont = theme.typography.body2

        let colors = getColorsUseCase.execute(
            theme: theme,
            intent: intent
        )
        self.colors = colors

        let buttonType = getButtonTypeUseCase.execute(
            intent: intent,
            variant: variant
        )
        self.buttonIntent = buttonType.intent
        self.buttonVariant = buttonType.variant

        self.border = getBorderUseCase.execute(theme: theme)
    }

    private func refresh() {
        let colors = self.getColorsUseCase.execute(
            theme: self.theme,
            intent: self.intent
        )
        self.colors = colors

        let buttonType = self.getButtonTypeUseCase.execute(
            intent: self.intent,
            variant: self.variant
        )
        self.buttonIntent = buttonType.intent
        self.buttonVariant = buttonType.variant
        self.border = self.getBorderUseCase.execute(theme: theme)
    }
}
