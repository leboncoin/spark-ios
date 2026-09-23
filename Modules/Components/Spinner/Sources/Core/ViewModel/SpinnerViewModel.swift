//
//  SpinnerViewModel.swift
//  SparkComponentSpinner
//
//  Created by robin.lemaire on 10/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: colorToken = "Identical"
final class SpinnerViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colorToken: any ColorToken = ColorTokenClear()
    @Published private(set) var contentSize: CGFloat = 0

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColorToken()
        }
    }

    var intent: SpinnerIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColorToken()
        }
    }

    var size: SpinnerSize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setContentSize()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getSizeUseCase: any SpinnerGetSizeUseCaseable
    private let getColorUseCase: any SpinnerGetColorUseCaseable

    // MARK: - Initialization

    init(
        getSizeUseCase: any SpinnerGetSizeUseCaseable = SpinnerGetSizeUseCase(),
        getColorUseCase: any SpinnerGetColorUseCaseable = SpinnerGetColorUseCase()
    ) {
        self.getSizeUseCase = getSizeUseCase
        self.getColorUseCase = getColorUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: SpinnerIntent,
        size: SpinnerSize
    ) {
        self.theme = theme
        self.intent = intent
        self.size = size

        self.setColorToken()
        self.setContentSize()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColorToken() {
        guard let theme, let intent else { return }

        self.colorToken = self.getColorUseCase.execute(
            theme: theme,
            intent: intent
        )
    }

    private func setContentSize() {
        guard let size else { return }

        self.contentSize = self.getSizeUseCase.execute(
            size: size
        )
    }
}
