//
//  ProgressBarUIViewModel.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
class ProgressBarUIViewModel: ProgressBarViewModel {

    // MARK: - Published Properties

    @Published private(set) var indicatorIsHidden = true

    // MARK: - Properties

    var value: CGFloat? {
        didSet {
            guard oldValue != self.value, self.alreadyUpdateAll else { return }

            self.setIndicatorIsHidden()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getIsIndicatorHiddenUseCase: any ProgressBarGetIsIndicatorHiddenUseCaseable

    // MARK: - Initialization

    init(getIsIndicatorHiddenUseCase: any ProgressBarGetIsIndicatorHiddenUseCaseable = ProgressBarGetIsIndicatorHiddenUseCase()) {
        self.getIsIndicatorHiddenUseCase = getIsIndicatorHiddenUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: ProgressBarIntent,
        shape: ProgressBarShape,
        value: CGFloat
    ) {
        self.value = value
        self.setup(
            theme: theme,
            intent: intent,
            shape: shape
        )

        self.setIndicatorIsHidden()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setIndicatorIsHidden() {
        guard let value else { return }

        self.indicatorIsHidden = self.getIsIndicatorHiddenUseCase.execute(value: value)
    }
}
