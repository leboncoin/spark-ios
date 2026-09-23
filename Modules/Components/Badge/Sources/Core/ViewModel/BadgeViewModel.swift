//
//  BadgeViewModel.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: textFont = "Identical"
final internal class BadgeViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = BadgeColors()
    @Published private(set) var sizes = BadgeSizes()
    @Published private(set) var cornerRadius: CGFloat = 0
    @Published private(set) var textFont: any TypographyFontToken = TypographyFontTokenClear()
    @Published private(set) var text: String?

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setCornerRadius()
            self.setSizes()
            self.setTextFont()
        }
    }

    var intent: BadgeIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var isBorder: Bool? {
        didSet {
            guard oldValue != self.isBorder, self.alreadyUpdateAll else { return }

            self.setSizes()
        }
    }

    var size: BadgeSize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setSizes()
            self.setTextFont()
        }
    }

    var unit: String? {
        didSet {
            guard oldValue != self.unit, self.alreadyUpdateAll else { return }

            self.setText()
        }
    }

    var value: Int? {
        didSet {
            guard oldValue != self.value, self.alreadyUpdateAll else { return }

            self.setText()
            self.setSizes()
        }
    }

    // MARK: - Private Properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any BadgeGetColorsUseCaseable
    private let getCornerRadiusUseCase: any BadgeGetCornerRadiusUseCaseable
    private let getSizesUseCase: any BadgeGetSizesUseCaseable
    private let getTextFontUseCase: any BadgeGetTextFontUseCaseable
    private let getTextUseCase: any BadgeGetTextUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any BadgeGetColorsUseCaseable = BadgeGetColorsUseCase(),
        getCornerRadiusUseCase: any BadgeGetCornerRadiusUseCaseable = BadgeGetCornerRadiusUseCase(),
        getSizesUseCase: any BadgeGetSizesUseCaseable = BadgeGetSizesUseCase(),
        getTextFontUseCase: any BadgeGetTextFontUseCaseable = BadgeGetTextFontUseCase(),
        getTextUseCase: any BadgeGetTextUseCaseable = BadgeGetTextUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getCornerRadiusUseCase = getCornerRadiusUseCase
        self.getSizesUseCase = getSizesUseCase
        self.getTextFontUseCase = getTextFontUseCase
        self.getTextUseCase = getTextUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: BadgeIntent,
        isBorder: Bool,
        size: BadgeSize,
        value: Int?,
        unit: String?
    ) {
        self.theme = theme
        self.intent = intent
        self.isBorder = isBorder
        self.size = size
        self.value = value
        self.unit = unit

        self.setColors()
        self.setCornerRadius()
        self.setSizes()
        self.setTextFont()
        self.setText()

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
        guard let theme else { return }

        self.cornerRadius = self.getCornerRadiusUseCase.execute(
            theme: theme
        )
    }

    private func setSizes() {
        guard let theme, let isBorder, let size else { return }

        self.sizes = self.getSizesUseCase.execute(
            theme: theme,
            size: size,
            isBorder: isBorder,
            value: self.value
        )
    }

    private func setTextFont() {
        guard let theme, let size else { return }

        self.textFont = self.getTextFontUseCase.execute(
            theme: theme,
            size: size
        )
    }

    private func setText() {
        self.text = self.getTextUseCase.execute(
            value: self.value,
            unit: self.unit
        )
    }
}
