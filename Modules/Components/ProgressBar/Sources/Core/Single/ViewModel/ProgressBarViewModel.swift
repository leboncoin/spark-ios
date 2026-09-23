//
//  ProgressBarViewModel.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
class ProgressBarViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = ProgressBarColors()
    @Published private(set) var cornerRadius: CGFloat = .zero

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setCornerRadius()
        }
    }

    var intent: ProgressBarIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var shape: ProgressBarShape? {
        didSet {
            guard oldValue != self.shape, self.alreadyUpdateAll else { return }

            self.setCornerRadius()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any ProgressBarGetColorsUseCaseable
    private let getCornerRadiusUseCase: any ProgressBarGetCornerRadiusUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any ProgressBarGetColorsUseCaseable = ProgressBarGetColorsUseCase(),
        getCornerRadiusUseCase: any ProgressBarGetCornerRadiusUseCaseable = ProgressBarGetCornerRadiusUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getCornerRadiusUseCase = getCornerRadiusUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: ProgressBarIntent,
        shape: ProgressBarShape
    ) {
        self.theme = theme
        self.intent = intent
        self.shape = shape

        self.setColors()
        self.setCornerRadius()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColors() {
        guard let theme, let intent else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            intent: intent
        )
    }

    private func setCornerRadius() {
        guard let theme, let shape else { return }

        self.cornerRadius = self.getCornerRadiusUseCase.execute(
            theme: theme,
            shape: shape
        )
    }
}
