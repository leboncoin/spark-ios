//
//  IconViewModel.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: tintColorToken = "Identical"
final class IconViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var tintColorToken: any ColorToken = ColorTokenClear()
    @Published private(set) var contentSize: CGFloat = 0

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setTintColorToken()
        }
    }

    var intent: IconIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setTintColorToken()
        }
    }

    var size: IconSize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setContentSize()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getSizeUseCase: any IconGetSizeUseCaseable
    private let getTintColorUseCase: any IconGetTintColorUseCaseable

    // MARK: - Initialization

    init(
        getSizeUseCase: any IconGetSizeUseCaseable = IconGetSizeUseCase(),
        getTintColorUseCase: any IconGetTintColorUseCaseable = IconGetTintColorUseCase()
    ) {
        self.getSizeUseCase = getSizeUseCase
        self.getTintColorUseCase = getTintColorUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: IconIntent,
        size: IconSize
    ) {
        self.theme = theme
        self.intent = intent
        self.size = size

        self.setTintColorToken()
        self.setContentSize()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setTintColorToken() {
        guard let theme, let intent else { return }

        self.tintColorToken = self.getTintColorUseCase.execute(
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
