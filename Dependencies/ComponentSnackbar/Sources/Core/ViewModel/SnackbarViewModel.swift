//
//  SnackbarViewModel.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class SnackbarViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var border = SnackbarBorder()
    @Published private(set) var colors = SnackbarColors()
    @Published private(set) var intents = SnackbarIntents()
    @Published private(set) var layout = SnackbarLayout()
    @Published private(set) var typographies = SnackbarTypographies()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
            self.setLayout()
            self.setTypographies()
        }
    }

    var intent: SnackbarIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
            self.setIntents()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getBorderUseCase: any SnackbarGetBorderUseCaseable
    private let getColorsUseCase: any SnackbarGetColorsUseCaseable
    private let getIntentsUseCase: any SnackbarGetIntentsUseCaseable
    private let getLayoutUseCase: any SnackbarGetLayoutUseCaseable
    private let getTypographiesUseCase: any SnackbarGetTypographiesUseCaseable

    // MARK: - Initialization

    init(
        getBorderUseCase: any SnackbarGetBorderUseCaseable = SnackbarGetBorderUseCase(),
        getColorsUseCase: any SnackbarGetColorsUseCaseable = SnackbarGetColorsUseCase(),
        getIntentsUseCase: any SnackbarGetIntentsUseCaseable = SnackbarGetIntentsUseCase(),
        getLayoutUseCase: any SnackbarGetLayoutUseCaseable = SnackbarGetLayoutUseCase(),
        getTypographiesUseCase: any SnackbarGetTypographiesUseCaseable = SnackbarGetTypographiesUseCase()
    ) {
        self.getBorderUseCase = getBorderUseCase
        self.getColorsUseCase = getColorsUseCase
        self.getIntentsUseCase = getIntentsUseCase
        self.getLayoutUseCase = getLayoutUseCase
        self.getTypographiesUseCase = getTypographiesUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: SnackbarIntent
    ) {
        self.theme = theme
        self.intent = intent

        self.setBorder()
        self.setColors()
        self.setIntents()
        self.setLayout()
        self.setTypographies()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setBorder() {
        guard let theme else { return }

        self.border = self.getBorderUseCase.execute(theme: theme)
    }

    private func setColors() {
        guard let theme, let intent else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            intent: intent
        )
    }

    private func setIntents() {
        guard let intent else { return }

        self.intents = self.getIntentsUseCase.execute(intent: intent)
    }

    private func setLayout() {
        guard let theme else { return }

        self.layout = self.getLayoutUseCase.execute(theme: theme)
    }

    private func setTypographies() {
        guard let theme else { return }

        self.typographies = self.getTypographiesUseCase.execute(theme: theme)
    }
}
