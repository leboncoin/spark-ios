//
//  TextInputViewModel.swift
//  Spark
//
//  Created by louis.borlee on 01/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// UseCase only used by **UIKit** View.
class TextInputUIViewModel: ObservableObject {

    // MARK: - Published Properties

    // Colors
    @Published private(set) var textColor: any ColorToken
    @Published private(set) var placeholderColor: any ColorToken
    @Published var borderColor: any ColorToken
    @Published var backgroundColor: any ColorToken

    // BorderLayout
    @Published private(set) var borderRadius: CGFloat
    @Published private(set) var borderWidth: CGFloat

    // Spacings
    @Published private(set) var leftSpacing: CGFloat
    @Published private(set) var contentSpacing: CGFloat
    @Published private(set) var rightSpacing: CGFloat

    @Published var dim: CGFloat

    @Published private(set) var font: any TypographyFontToken

    // MARK: - Properties

    let getColorsUseCase: any TextInputGetColorsUseCaseable
    let getBorderLayoutUseCase: any TextInputGetBorderLayoutUseCaseable
    let getSpacingsUseCase: any TextInputGetSpacingsUseCaseable

    var theme: any Theme {
        didSet {
            self.setColors()
            self.setBorderLayout()
            self.setSpacings()
            self.setDim()
            self.setFont()
        }
    }

    var intent: TextInputIntent {
        didSet {
            guard oldValue != self.intent else { return }
            self.setColors()
        }
    }

    var borderStyle: TextInputBorderStyle {
        didSet {
            guard oldValue != self.borderStyle else { return }
            self.setBorderLayout()
            self.setSpacings()
        }
    }

    var isFocused: Bool = false {
        didSet {
            guard oldValue != self.isFocused && !self.isReadOnly else { return }
            self.setColors()
            self.setBorderLayout()
        }
    }

    var isEnabled: Bool = true {
        didSet {
            guard oldValue != self.isEnabled else { return }
            self.setColors()
            self.setDim()
        }
    }

    var isReadOnly: Bool = false {
        didSet {
            guard oldValue != self.isReadOnly else { return }
            self.setColors()
        }
    }

    // MARK: - Initialization

    init(
        theme: any Theme,
        intent: TextInputIntent,
        borderStyle: TextInputBorderStyle,
        getColorsUseCase: any TextInputGetColorsUseCaseable = TextInputGetColorsUseCase(),
        getBorderLayoutUseCase: any TextInputGetBorderLayoutUseCaseable = TextInputGetBorderLayoutUseCase(),
        getSpacingsUseCase: any TextInputGetSpacingsUseCaseable = TextInputGetSpacingsUseCase()
    ) {
        self.theme = theme
        self.intent = intent
        self.borderStyle = borderStyle

        self.getColorsUseCase = getColorsUseCase
        self.getBorderLayoutUseCase = getBorderLayoutUseCase
        self.getSpacingsUseCase = getSpacingsUseCase

        // Colors
        let colors = getColorsUseCase.execute(
            theme: theme,
            intent: intent,
            isFocused: self.isFocused,
            isEnabled: self.isEnabled,
            isReadOnly: self.isReadOnly
        )
        self.textColor = colors.text
        self.placeholderColor = colors.placeholder
        self.borderColor = colors.border
        self.backgroundColor = colors.background

        // BorderLayout
        let borderLayout = getBorderLayoutUseCase.execute(
            theme: theme,
            borderStyle: borderStyle,
            isFocused: self.isFocused
        )
        self.borderWidth = borderLayout.width
        self.borderRadius = borderLayout.radius

        // Spacings
        let spacings = getSpacingsUseCase.execute(theme: theme, borderStyle: borderStyle)
        self.leftSpacing = spacings.horizontal
        self.contentSpacing = spacings.content
        self.rightSpacing = spacings.horizontal

        self.dim = theme.dims.none

        self.font = theme.typography.body1
    }

    // MARK: - Private & Internal Setter

    private func setColors() {
        // Colors
        let colors = self.getColorsUseCase.execute(
            theme: self.theme,
            intent: self.intent,
            isFocused: self.isFocused,
            isEnabled: self.isEnabled,
            isReadOnly: self.isReadOnly
        )
        self.textColor = colors.text
        self.placeholderColor = colors.placeholder
        self.borderColor = colors.border
        self.backgroundColor = colors.background
    }

    internal func setBorderLayout() {
        let borderLayout = self.getBorderLayoutUseCase.execute(
            theme: self.theme,
            borderStyle: self.borderStyle, // .none
            isFocused: self.isFocused
        )
        self.borderWidth = borderLayout.width
        self.borderRadius = borderLayout.radius
    }

    internal func setSpacings() {
        let spacings = self.getSpacingsUseCase.execute(theme: self.theme, borderStyle: self.borderStyle)
        self.leftSpacing = spacings.horizontal
        self.contentSpacing = spacings.content
        self.rightSpacing = spacings.horizontal
    }

    private func setDim() {
        self.dim = self.isEnabled ? self.theme.dims.none : self.theme.dims.dim3
    }

    internal func setFont() {
        self.font = self.theme.typography.body1
    }
}
