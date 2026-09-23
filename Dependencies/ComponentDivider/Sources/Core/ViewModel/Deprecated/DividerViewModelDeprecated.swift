//
//  DividerViewModelDeprecated.swift
//  SparkComponentDivider
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

@available(*, deprecated, message: "Not used anymore by SparkDivider or SparkUIDivider")
final class DividerViewModelDeprecated: ObservableObject {

    var theme: any Theme {
        didSet {
            self.textFont = self.theme.typography.body1
            let colors = self.getColorsUseCase.execute(
                colors: self.theme.colors,
                intent: self.intent
            )
            self.textColor = colors.text
            self.separatorColor = colors.separator
            self.spacing = self.theme.layout.spacing.large
        }
    }
    var intent: DividerIntent {
        didSet {
            guard self.intent != oldValue else { return }
            let colors = self.getColorsUseCase.execute(
                colors: self.theme.colors,
                intent: self.intent
            )
            self.textColor = colors.text
            self.separatorColor = colors.separator
        }
    }
    private var getColorsUseCase: any DividierGetColorsUseCasableDeprecated

    @Published var textFont: any TypographyFontToken
    @Published var textColor: any ColorToken
    @Published var separatorColor: any ColorToken
    @Published var spacing: CGFloat

    init(
        theme: any Theme,
        intent: DividerIntent,
        getColorsUseCase: any DividierGetColorsUseCasableDeprecated = DividerGetColorsUseCaseDeprecated()
    ) {
        self.theme = theme
        self.intent = intent
        self.getColorsUseCase = getColorsUseCase

        self.textFont = theme.typography.body1

        let colors = getColorsUseCase.execute(
            colors: theme.colors,
            intent: intent
        )
        self.textColor = colors.text
        self.separatorColor = colors.separator

        self.spacing = theme.layout.spacing.large
    }
}
