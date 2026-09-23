//
//  RatingViewModel.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
class RatingViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var colors = RatingColors()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any RatingGetColorsUseCaseable
    private let getFillingRatioUseCase: any RatingGetFillingRatioUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any RatingGetColorsUseCaseable = RatingGetColorsUseCase(),
        getFillingRatioUseCase: any RatingGetFillingRatioUseCaseable = RatingGetFillingRatioUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getFillingRatioUseCase = getFillingRatioUseCase
    }

    // MARK: - Setup

    func setup(theme: any Theme) {
        self.theme = theme

        self.setColors()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColors() {
        guard let theme else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme
        )
    }

    // MARK: - Getter

    func getFillingRatio(
        at index: Int,
        count: Int,
        value: Double
    ) -> CGFloat {
        return self.getFillingRatioUseCase.execute(
            index: index,
            count: count,
            rating: value
        )
    }
}
