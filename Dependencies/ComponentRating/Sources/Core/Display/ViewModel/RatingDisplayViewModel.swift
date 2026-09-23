//
//  RatingDisplayViewModel.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
class RatingDisplayViewModel: RatingViewModel {

    // MARK: - Published Properties

    @Published private(set) var spacings = RatingDisplaySpacings()
    @Published private(set) var textStyles = RatingDisplayTextStyles()

    // MARK: - Properties

    override var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setSpacings()
            self.setTextStyles()
        }
    }

    var size: RatingDisplaySize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setTextStyles()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getSpacingUseCase: any RatingDisplayGetSpacingsUseCaseable
    private let getTextStylesUseCase: any RatingDisplayGetTextStylesUseCaseable

    // MARK: - Initialization

    init(
        getSpacingUseCase: any RatingDisplayGetSpacingsUseCaseable = RatingDisplayGetSpacingsUseCase(),
        getTextStylesUseCase: any RatingDisplayGetTextStylesUseCaseable = RatingDisplayGetTextStylesUseCase()
    ) {
        self.getSpacingUseCase = getSpacingUseCase
        self.getTextStylesUseCase = getTextStylesUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        size: RatingDisplaySize
    ) {
        self.theme = theme
        self.size = size

        self.setup(theme: theme)

        self.setSpacings()
        self.setTextStyles()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setSpacings() {
        guard let theme else { return }

        self.spacings = self.getSpacingUseCase.execute(
            theme: theme
        )
    }

    private func setTextStyles() {
        guard let theme, let size else { return }

        self.textStyles = self.getTextStylesUseCase.execute(
            theme: theme,
            size: size
        )
    }
}
