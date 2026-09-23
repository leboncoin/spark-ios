//
//  TextInputViewModel.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 16/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// UseCase only used by **SwiftUI** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
internal class TextInputViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var borderLayout = TextInputBorderLayout()
    @Published private(set) var colors = TextInputColors()
    @Published private(set) var dim: CGFloat = 1
    @Published private(set) var font: Font = .body
    @Published private(set) var spacings = TextInputSpacings() {
        didSet {
            self.spacingDidUpdate()
        }
    }

    // MARK: - Properties

    private var alreadyUpdateAll = false

    var theme: (any Theme)? {
        didSet {
            guard self.alreadyUpdateAll else { return }

            self.setColors()
            self.setBorderLayout()
            self.setSpacings()
            self.setDim()
            self.setFont()
        }
    }

    var intent: TextInputIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }
            self.setColors()
        }
    }

    var isFocused: Bool? {
        didSet {
            guard oldValue != self.isFocused, self.alreadyUpdateAll else { return }
            self.setColors()
            self.setBorderLayout()
        }
    }

    var isEnabled: Bool? {
        didSet {
            guard oldValue != self.isEnabled, self.alreadyUpdateAll else { return }
            self.setColors()
            self.setDim()
        }
    }

    var isReadOnly: Bool? {
        didSet {
            guard oldValue != self.isReadOnly, self.alreadyUpdateAll else { return }
            self.setColors()
        }
    }

    // MARK: - Use Case Properties

    private let getBorderLayoutUseCase: any TextInputGetBorderLayoutUseCaseable
    private let getColorsUseCase: any TextInputGetColorsUseCaseable
    private let getDimUseCase: any TextInputGetDimUseCaseable
    private let getFontUseCase: any TextInputGetFontUseCaseable
    private let getSpacingsUseCase: any TextInputGetSpacingsUseCaseable

    // MARK: - Initialization

    init(
        getBorderLayoutUseCase: any TextInputGetBorderLayoutUseCaseable = TextInputGetBorderLayoutUseCase(),
        getColorsUseCase: any TextInputGetColorsUseCaseable = TextInputGetColorsUseCase(),
        getDimUseCase: any TextInputGetDimUseCaseable = TextInputGetDimUseCase(),
        getFontUseCase: any TextInputGetFontUseCaseable = TextInputGetFontUseCase(),
        getSpacingsUseCase: any TextInputGetSpacingsUseCaseable = TextInputGetSpacingsUseCase()
    ) {
        self.getBorderLayoutUseCase = getBorderLayoutUseCase
        self.getColorsUseCase = getColorsUseCase
        self.getDimUseCase = getDimUseCase
        self.getFontUseCase = getFontUseCase
        self.getSpacingsUseCase = getSpacingsUseCase
    }

    func updateAll(
        theme: any Theme,
        intent: TextInputIntent,
        isReadOnly: Bool,
        isFocused: Bool,
        isEnabled: Bool
    ) {
        self.theme = theme
        self.intent = intent
        self.isReadOnly = isReadOnly
        self.isFocused = isFocused
        self.isEnabled = isEnabled

        self.setColors()
        self.setBorderLayout()
        self.setSpacings()
        self.setDim()
        self.setFont()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColors() {
        guard let theme,
              let intent,
              let isFocused,
              let isEnabled,
              let isReadOnly else {
            return
        }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            intent: intent,
            isFocused: isFocused,
            isEnabled: isEnabled,
            isReadOnly: isReadOnly
        )
    }

    private func setBorderLayout() {
        guard let theme, let isFocused else {
            return
        }

        self.borderLayout = self.getBorderLayoutUseCase.execute(
            theme: theme,
            isFocused: isFocused
        )
    }

    private func setSpacings() {
        guard let theme else {
            return
        }

        self.spacings = self.getSpacingsUseCase.execute(
            theme: theme
        )
    }

    private func setDim() {
        guard let theme, let isEnabled else {
            return
        }

        self.dim = self.getDimUseCase.execute(
            theme: theme,
            isEnabled: isEnabled
        )
    }

    private func setFont() {
        guard let theme else {
            return
        }

        self.font = self.getFontUseCase.executeFont(theme: theme)
    }

    // MARK: - Update

    func spacingDidUpdate() {
    }
}
