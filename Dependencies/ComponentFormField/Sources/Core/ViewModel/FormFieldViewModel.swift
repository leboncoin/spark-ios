//
//  FormFieldViewModel.swift
//  SparkComponentFormField
//
//  Created by alican.aycil on 30.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Combine
import SwiftUI
import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkCommon

final class FormFieldViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var formattedTitle: AttributedStringEither?
    @Published private(set) var titleAccessibilityLabel: String?

    @Published private(set) var clearButtonFont: any TypographyFontToken
    @Published private(set) var clearButtonColor: any ColorToken

    @Published var helper: String?
    @Published private(set) var helperFont: any TypographyFontToken
    @Published private(set) var helperColor: any ColorToken

    @Published private(set) var secondaryHelper: String?
    @Published private(set) var secondaryHelperFont: any TypographyFontToken
    @Published private(set) var secondaryHelperColor: any ColorToken

    @Published private(set) var spacing: CGFloat

    var theme: any Theme {
        didSet {
            self.updateColors()
            self.updateFonts()
            self.updateSpacing()
            self.updateTitle()
        }
    }

    var title: String? {
        didSet {
            self.updateTitle()
            self.updateTitleAccessibilityLabel()
        }
    }

    var customTitleAccessibilityLabel: String? {
        didSet {
            self.updateTitleAccessibilityLabel()
        }
    }

    var feedbackState: FormFieldFeedbackState {
        didSet {
            guard feedbackState != oldValue else { return }
            self.updateColors()
        }
    }

    var isRequired: Bool {
        didSet {
            guard isRequired != oldValue else { return }
            self.updateTitle()
            self.updateTitleAccessibilityLabel()
        }
    }

    private let frameworkType: FrameworkType

    private let getColorsUseCase: any FormFieldGetColorsUseCaseable
    private let getFontsUseCase: any FormFieldGetFontsUseCaseable
    private let getFormattedTitleUseCase: any FormFieldGetFormattedTitleUseCaseable
    private let getTitleAccessibilityLabelUseCase: any FormFieldGetTitleAccessibilityLabelUseCaseable

    private var colors: FormFieldColors
    private var fonts: FormFieldFonts

    // MARK: - Init

    init(
        frameworkType: FrameworkType,
        theme: any Theme,
        feedbackState: FormFieldFeedbackState,
        title: String?,
        helper: String?,
        isRequired: Bool = false,
        getColorsUseCase: any FormFieldGetColorsUseCaseable = FormFieldGetColorsUseCase(),
        getFontsUseCase: any FormFieldGetFontsUseCaseable = FormFieldGetFontsUseCase(),
        getFormattedTitleUseCase: any FormFieldGetFormattedTitleUseCaseable = FormFieldGetFormattedTitleUseCase(),
        getTitleAccessibilityLabelUseCase: any FormFieldGetTitleAccessibilityLabelUseCaseable = FormFieldGetTitleAccessibilityLabelUseCase()
    ) {
        self.frameworkType = frameworkType
        self.theme = theme
        self.feedbackState = feedbackState

        self.title = title
        self.helper = helper

        self.isRequired = isRequired

        self.getColorsUseCase = getColorsUseCase
        self.colors = getColorsUseCase.execute(from: theme, feedback: feedbackState)

        self.getFontsUseCase = getFontsUseCase
        self.fonts = getFontsUseCase.execute(from: theme)

        self.spacing = Self.spacing(from: theme)

        self.clearButtonColor = self.colors.clearButton
        self.clearButtonFont = self.fonts.clearButton

        self.helperColor = self.colors.helper
        self.helperFont = self.fonts.helper

        self.secondaryHelperColor = self.colors.secondaryHelper
        self.secondaryHelperFont = self.fonts.secondaryHelper

        self.getFormattedTitleUseCase = getFormattedTitleUseCase
        self.formattedTitle = getFormattedTitleUseCase.execute(
            for: frameworkType,
            title: title,
            isRequired: isRequired,
            colors: self.colors,
            fonts: self.fonts
        )

        self.getTitleAccessibilityLabelUseCase = getTitleAccessibilityLabelUseCase
        self.titleAccessibilityLabel = getTitleAccessibilityLabelUseCase.execute(
            title: title,
            customValue: nil,
            isRequired: isRequired
        )
    }

    // MARK: - Setter

    func setCounter(text: String?, limit: Int?) {
        self.setCounter(textLength: text?.count, limit: limit)
    }

    func setCounter(textLength: Int?, limit: Int?) {
        guard let limit else {
            self.secondaryHelper = nil
            return
        }

        self.secondaryHelper = "\(textLength ?? 0)/\(limit)"
    }

    // MARK: - Private Update

    private func updateTitle() {
        self.formattedTitle = self.getFormattedTitleUseCase.execute(
            for: self.frameworkType,
            title: self.title,
            isRequired: self.isRequired,
            colors: self.colors,
            fonts: self.fonts
        )
    }

    private func updateTitleAccessibilityLabel() {
        self.titleAccessibilityLabel = self.getTitleAccessibilityLabelUseCase.execute(
            title: self.title,
            customValue: self.customTitleAccessibilityLabel,
            isRequired: self.isRequired
        )
    }

    private func updateColors() {
        self.colors = self.getColorsUseCase.execute(from: self.theme, feedback: self.feedbackState)

        self.clearButtonColor = self.colors.clearButton
        self.helperColor = self.colors.helper
        self.secondaryHelperColor = self.colors.secondaryHelper
    }

    private func updateFonts() {
        self.fonts = self.getFontsUseCase.execute(from: self.theme)

        self.clearButtonFont = self.fonts.clearButton
        self.helperFont = self.fonts.helper
        self.secondaryHelperFont = self.fonts.secondaryHelper
    }

    private func updateSpacing() {
        self.spacing = Self.spacing(from: self.theme)
    }

    // MARK: - Static func

    private static func spacing(from theme: any Theme) -> CGFloat {
        return theme.layout.spacing.small
    }
}
