//
//  RatingInputViewModel.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
class RatingInputViewModel: RatingViewModel {

    // MARK: - Published Properties

    @Published private(set) var dim: CGFloat = .zero
    @Published private(set) var spacing: CGFloat = .zero

    // MARK: - Properties

    override var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setDim()
            self.setSpacing()
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

    private let getDimUseCase: any RatingInputGetDimUseCaseable
    private let getNewValueUseCase: any RatingInputGetNewValueUseCaseable
    private let getSpacingUseCase: any RatingInputGetSpacingUseCaseable

    // MARK: - Initialization

    init(
        getDimUseCase: any RatingInputGetDimUseCaseable = RatingInputGetDimUseCase(),
        getNewValueUseCase: any RatingInputGetNewValueUseCaseable = RatingInputGetNewValueUseCase(),
        getSpacingUseCase: any RatingInputGetSpacingUseCaseable = RatingInputGetSpacingUseCase()
    ) {
        self.getDimUseCase = getDimUseCase
        self.getNewValueUseCase = getNewValueUseCase
        self.getSpacingUseCase = getSpacingUseCase

        super.init()
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        isEnabled: Bool
    ) {
        self.isEnabled = isEnabled

        self.setup(theme: theme)

        self.setDim()
        self.setSpacing()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

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

    // MARK: - Getter

    func getNewValue(from ratio: CGFloat) -> Double {
        return self.getNewValueUseCase.execute(
            ratio: ratio
        )
    }

    func getIncrementedValue(from value: Double) -> Double? {
        guard let isEnabled else { return nil }

        return self.getNewValueUseCase.executeIncrement(
            value: value,
            isEnabled: isEnabled
        )
    }

    func getDecrementedValue(from value: Double) -> Double? {
        guard let isEnabled else { return nil }

        return self.getNewValueUseCase.executeDecrement(
            value: value,
            isEnabled: isEnabled
        )
    }
}
