//
//  DividerViewModel.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: textFont = "Identical"
final class DividerViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = DividerColors()
    @Published private(set) var separatorWidthTypes = DividerSeparatorWidthTypes()
    @Published private(set) var spacing: CGFloat = 0
    @Published private(set) var textFont: any TypographyFontToken = TypographyFontTokenClear()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setSpacing()
            self.setTextFont()
        }
    }

    var alignment: DividerAlignment? {
        didSet {
            guard oldValue != self.alignment, self.alreadyUpdateAll else { return }

            self.setSeparatorWidthTypes()
        }
    }

    var axis: DividerAxis? {
        didSet {
            guard oldValue != self.axis, self.alreadyUpdateAll else { return }

            self.setSeparatorWidthTypes()
        }
    }

    var intent: DividerIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any DividerGetColorsUseCaseable
    private let getSeparatorWidthTypesUseCase: any DividerGetSeparatorWidthTypesUseCaseable
    private let getSpacingUseCase: any DividerGetSpacingUseCaseable
    private let getTextFontUseCase: any DividerGetTextFontUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any DividerGetColorsUseCaseable = DividerGetColorsUseCase(),
        getSeparatorWidthTypesUseCase: any DividerGetSeparatorWidthTypesUseCaseable = DividerGetSeparatorWidthTypesUseCase(),
        getSpacingUseCase: any DividerGetSpacingUseCaseable = DividerGetSpacingUseCase(),
        getTextFontUseCase: any DividerGetTextFontUseCaseable = DividerGetTextFontUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getSeparatorWidthTypesUseCase = getSeparatorWidthTypesUseCase
        self.getSpacingUseCase = getSpacingUseCase
        self.getTextFontUseCase = getTextFontUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        alignment: DividerAlignment,
        axis: DividerAxis,
        intent: DividerIntent
    ) {
        self.theme = theme
        self.alignment = alignment
        self.axis = axis
        self.intent = intent

        self.setColors()
        self.setSeparatorWidthTypes()
        self.setSpacing()
        self.setTextFont()

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

    private func setSeparatorWidthTypes() {
        guard let alignment, let axis else { return }

        self.separatorWidthTypes = self.getSeparatorWidthTypesUseCase.execute(
            alignment: alignment,
            axis: axis
        )
    }

    private func setSpacing() {
        guard let theme else { return }

        self.spacing = self.getSpacingUseCase.execute(
            theme: theme
        )
    }

    private func setTextFont() {
        guard let theme else { return }

        self.textFont = self.getTextFontUseCase.execute(
            theme: theme
        )
    }
}
