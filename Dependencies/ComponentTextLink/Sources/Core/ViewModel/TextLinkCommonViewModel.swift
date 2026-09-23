//
//  TextLinkCommonViewModel.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: imageColor = "Identical"
class TextLinkCommonViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var spacing: CGFloat = .zero
    @Published private(set) var imageSize = TextLinkImageSize()
    @Published private(set) var imageColor: any ColorToken = ColorTokenDefault.clear
    @Published private(set) var dim: CGFloat = .zero
    @Published private(set) var hoverStyle = TextLinkHoverStyle()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setAttributedString()
            self.setSpacing()
            self.setImageSize()
            self.setImageColor()
            self.setDim()
            self.setHoverStyle()
        }
    }

    var intent: TextLinkIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setAttributedString()
            self.setImageColor()
            self.setDim()
            self.setHoverStyle()
        }
    }

    var isHighlighted: Bool = false {
        didSet {
            guard oldValue != self.isHighlighted, self.alreadyUpdateAll else { return }

            self.setAttributedString()
            self.setImageColor()
            self.setDim()
        }
    }

    var text: String? {
        didSet {
            guard oldValue != self.text, self.alreadyUpdateAll else { return }

            self.setAttributedString()
        }
    }

    var textHighlightRange: NSRange? {
        didSet {
            guard oldValue != self.textHighlightRange, self.alreadyUpdateAll else { return }

            self.setAttributedString()
        }
    }

    var typography: TextLinkTypography? {
        didSet {
            guard oldValue != self.typography, self.alreadyUpdateAll else { return }

            self.setAttributedString()
            self.setImageSize()
        }
    }

    var variant: TextLinkVariant? {
        didSet {
            guard oldValue != self.variant, self.alreadyUpdateAll else { return }

            self.setAttributedString()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorUseCase: any TextLinkGetColorUseCaseable
    private let getDimUseCase: any TextLinkGetDimUseCaseable
    private let getHoverStyleUseCase: any TextLinkGetHoverStyleUseCaseable
    private let getImageSizeUseCase: any TextLinkGetImageSizeUseCaseable
    private let getSpacingUseCase: any TextLinkGetSpacingUseCaseable
    private let getTypographiesUseCase: any TextLinkGetTypographiesUseCaseable
    private let getUnderlineStyleUseCase: any TextLinkGetUnderlineStyleUseCaseable

    // MARK: - Initialization

    init(
        getColorUseCase: any TextLinkGetColorUseCaseable = TextLinkGetColorUseCase(),
        getDimUseCase: any TextLinkGetDimUseCaseable = TextLinkGetDimUseCase(),
        getHoverStyleUseCase: any TextLinkGetHoverStyleUseCaseable = TextLinkGetHoverStyleUseCase(),
        getImageSizeUseCase: any TextLinkGetImageSizeUseCaseable = TextLinkGetImageSizeUseCase(),
        getSpacingUseCase: any TextLinkGetSpacingUseCaseable = TextLinkGetSpacingUseCase(),
        getTypographiesUseCase: any TextLinkGetTypographiesUseCaseable = TextLinkGetTypographiesUseCase(),
        getUnderlineStyleUseCase: any TextLinkGetUnderlineStyleUseCaseable = TextLinkGetUnderlineStyleUseCase(),
    ) {
        self.getColorUseCase = getColorUseCase
        self.getDimUseCase = getDimUseCase
        self.getHoverStyleUseCase = getHoverStyleUseCase
        self.getImageSizeUseCase = getImageSizeUseCase
        self.getSpacingUseCase = getSpacingUseCase
        self.getTypographiesUseCase = getTypographiesUseCase
        self.getUnderlineStyleUseCase = getUnderlineStyleUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: TextLinkIntent,
        text: String,
        textHighlightRange: NSRange?,
        typography: TextLinkTypography,
        variant: TextLinkVariant
    ) {
        self.theme = theme
        self.intent = intent
        self.text = text
        self.textHighlightRange = textHighlightRange
        self.typography = typography
        self.variant = variant

        self.setAttributedString()
        self.setSpacing()
        self.setImageSize()
        self.setImageColor()
        self.setDim()
        self.setHoverStyle()

        self.alreadyUpdateAll = true
    }

    // MARK: - Internal Did Update

    func contentSizeCategoryDidUpdate() {
        /// The image size depend of the size of the font.
        /// So each time the content size category changed
        /// We must get the new value from the current dynanic font size
        self.setImageSize()
    }

    // MARK: - Setter

    // Must be override by the UIKit/SwiftUI ViewModels
    func setAttributedString() {
    }

    private func setSpacing() {
        guard let theme else { return }

        self.spacing = self.getSpacingUseCase.execute(
            theme: theme
        )
    }

    private func setImageSize() {
        guard let theme, let typography else { return }

        self.imageSize = self.getImageSizeUseCase.execute(
            theme: theme,
            typography: typography
        )
    }

    private func setImageColor() {
        guard let theme, let intent else { return }

        self.imageColor = self.getColorUseCase.execute(
            theme: theme,
            intent: intent,
            isHighlighted: self.isHighlighted
        )
    }

    private func setDim() {
        guard let theme, let intent else { return }

        self.dim = self.getDimUseCase.execute(
            theme: theme,
            intent: intent,
            isHighlighted: self.isHighlighted
        )
    }

    private func setHoverStyle() {
        guard let theme, let intent else { return }

        self.hoverStyle = self.getHoverStyleUseCase.execute(
            theme: theme,
            intent: intent
        )
    }
}
