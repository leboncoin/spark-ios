//
//  TagViewModel.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkTheming

/// ViewModel only used by **SwiftUI** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: textFont = "Identical"
final internal class TagViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var border = TagBorder()
    @Published private(set) var colors = TagColors()
    @Published private(set) var spacings = TagSpacings()
    @Published private(set) var height: CGFloat = .zero
    @Published private(set) var textFont: any TypographyFontToken = TypographyFontTokenClear()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
            self.setSpacings()
            self.setTextFont()
        }
    }

    var intent: TagIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var size: TagSize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setHeight()
        }
    }

    var variant: TagVariant? {
        didSet {
            guard oldValue != self.variant, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    // MARK: - Private Properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getBorderUseCase: any TagGetBorderUseCaseable
    private let getColorsUseCase: any TagGetColorsUseCaseable
    private let getHeightUseCase: any TagGetHeightUseCaseable
    private let getSpacingsUseCase: any TagGetSpacingsUseCaseable
    private let getTextFontUseCase: any TagGetTextFontUseCaseable

    // MARK: - Initialization

    init(
        getBorderUseCase: any TagGetBorderUseCaseable = TagGetBorderUseCase(),
        getColorsUseCase: any TagGetColorsUseCaseable = TagGetColorsUseCase(),
        getHeightUseCase: any TagGetHeightUseCaseable = TagGetHeightUseCase(),
        getSpacingsUseCase: any TagGetSpacingsUseCaseable = TagGetSpacingsUseCase(),
        getTextFontUseCase: any TagGetTextFontUseCaseable = TagGetTextFontUseCase()
    ) {
        self.getBorderUseCase = getBorderUseCase
        self.getColorsUseCase = getColorsUseCase
        self.getHeightUseCase = getHeightUseCase
        self.getSpacingsUseCase = getSpacingsUseCase
        self.getTextFontUseCase = getTextFontUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: TagIntent,
        size: TagSize,
        variant: TagVariant
    ) {
        self.theme = theme
        self.intent = intent
        self.size = size
        self.variant = variant

        self.setBorder()
        self.setColors()
        self.setSpacings()
        self.setHeight()
        self.setTextFont()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setBorder() {
        guard let theme, let size else {
            return
        }

        self.border = self.getBorderUseCase.execute(
            theme: theme,
            size: size
        )
    }

    private func setColors() {
        guard let theme, let intent, let variant else {
            return
        }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            intent: intent,
            variant: variant
        )
    }

    private func setSpacings() {
        guard let theme else {
            return
        }

        self.spacings = self.getSpacingsUseCase.execute(theme: theme)
    }

    private func setHeight() {
        guard let size else {
            return
        }

        self.height = self.getHeightUseCase.execute(size: size)
    }

    private func setTextFont() {
        guard let theme else {
            return
        }

        self.textFont = self.getTextFontUseCase.execute(theme: theme)
    }
}
