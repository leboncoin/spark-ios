//
//  SliderViewModel.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class SliderViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = SliderColors()
    @Published private(set) var dim: CGFloat = .zero
    @Published private(set) var spacing: CGFloat = .zero
    @Published private(set) var typographies = SliderTypographies()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setDim()
            self.setSpacing()
            self.setTypographies()
        }
    }

    var intent: SliderIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var isFloatingValueLabel: Bool? {
        didSet {
            guard oldValue != self.isFloatingValueLabel, self.alreadyUpdateAll else { return }

            self.setTypographies()
        }
    }

    var isEnabled: Bool? {
        didSet {
            guard oldValue != self.isEnabled, self.alreadyUpdateAll else { return }

            self.setDim()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any SliderGetColorsUseCaseable
    private let getDimUseCase: any SliderGetDimUseCaseable
    private let getSpacingUseCase: any SliderGetSpacingUseCaseable
    private let getTypographiesUseCase: any SliderGetTypographiesUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any SliderGetColorsUseCaseable = SliderGetColorsUseCase(),
        getDimUseCase: any SliderGetDimUseCaseable = SliderGetDimUseCase(),
        getSpacingUseCase: any SliderGetSpacingUseCaseable = SliderGetSpacingUseCase(),
        getTypographiesUseCase: any SliderGetTypographiesUseCaseable = SliderGetTypographiesUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getDimUseCase = getDimUseCase
        self.getSpacingUseCase = getSpacingUseCase
        self.getTypographiesUseCase = getTypographiesUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: SliderIntent,
        isFloatingValueLabel: Bool,
        isEnabled: Bool
    ) {
        self.theme = theme
        self.intent = intent
        self.isFloatingValueLabel = isFloatingValueLabel
        self.isEnabled = isEnabled

        self.setColors()
        self.setDim()
        self.setSpacing()
        self.setTypographies()

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

    private func setDim() {
        guard let theme, let isEnabled else { return }

        self.dim = self.getDimUseCase.execute(
            theme: theme,
            isEnabled: isEnabled
        )
    }

    private func setSpacing() {
        guard let theme else { return }

        self.spacing = self.getSpacingUseCase.execute(
            theme: theme
        )
    }

    private func setTypographies() {
        guard let theme, let isFloatingValueLabel else { return }

        self.typographies = self.getTypographiesUseCase.execute(
            theme: theme,
            isFloatingValueLabel: isFloatingValueLabel
        )
    }
}
