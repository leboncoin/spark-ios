//
//  ButtonViewModel.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: titleFontToken = "Identical"
final class ButtonViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var border = ButtonBorder()
    @Published private(set) var colors = ButtonColors()
    @Published private(set) var dim: CGFloat = .zero
    @Published private(set) var titleFontToken: any TypographyFontToken = TypographyFontTokenClear()
    @Published private(set) var layout = ButtonLayout()
    @Published private(set) var showContent: Bool = true
    @Published private(set) var sizes = ButtonSizes()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
            self.setTitleFontToken()
            self.setLayout()
            self.setDim()
        }
    }

    var appearance: ButtonAppearance? {
        didSet {
            guard oldValue != self.appearance, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
        }
    }

    var intent: ButtonIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
        }
    }

    var variant: ButtonVariant? {
        didSet {
            guard oldValue != self.variant, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
        }
    }

    var shape: ButtonShape? {
        didSet {
            guard oldValue != self.shape, self.alreadyUpdateAll else { return }

            self.setBorder()
        }
    }

    var size: ButtonSize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setSizes()
        }
    }

    var contentVisibility: ButtonContentVisibility? {
        didSet {
            guard oldValue != self.contentVisibility, self.alreadyUpdateAll else { return }

            self.setLayout()
            self.setSizes()
            self.setShowContent()
        }
    }

    var type: ButtonType? {
        didSet {
            guard oldValue != self.type, self.alreadyUpdateAll else { return }

            self.setLayout()
            self.setSizes()
            self.setShowContent()
        }
    }

    var removeStyles: Bool? {
        didSet {
            guard oldValue != self.removeStyles, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setSizes()
        }
    }

    var isEnabled: Bool? {
        didSet {
            guard oldValue != self.isEnabled, self.alreadyUpdateAll else { return }

            self.setDim()
        }
    }

    var isLoading: Bool? {
        didSet {
            guard oldValue != self.isLoading, self.alreadyUpdateAll else { return }

            self.setShowContent()
            self.setSizes()
        }
    }

    var isPressed: Bool = false {
        didSet {
            guard oldValue != self.isPressed, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getBorderUseCase: any ButtonGetBorderUseCaseable
    private let getColorsUseCase: any ButtonGetColorsUseCaseable
    private let getDimUseCase: any ButttonGetDimUseCaseable
    private let getSpacingsUseCase: any ButtonGetSpacingsUseCaseable
    private let getSizesUseCase: any ButtonGetSizesUseCaseable
    private let getTitleFontTokenUseCase: any ButtonGetTitleFontTokenUseCaseable
    private let getShowContentUseCase: any ButtonGetShowContentUseCaseable

    // MARK: - Initialization

    init(
        getBorderUseCase: any ButtonGetBorderUseCaseable = ButtonGetBorderUseCase(),
        getColorsUseCase: any ButtonGetColorsUseCaseable = ButtonGetColorsUseCase(),
        getDimUseCase: any ButttonGetDimUseCaseable = ButttonGetDimUseCase(),
        getSpacingsUseCase: any ButtonGetSpacingsUseCaseable = ButtonGetSpacingsUseCase(),
        getSizesUseCase: any ButtonGetSizesUseCaseable = ButtonGetSizesUseCase(),
        getTitleFontTokenUseCase: any ButtonGetTitleFontTokenUseCaseable = ButtonGetTitleFontTokenUseCase(),
        getShowContentUseCase: any ButtonGetShowContentUseCaseable = ButtonGetShowContentUseCase()
    ) {
        self.getBorderUseCase = getBorderUseCase
        self.getColorsUseCase = getColorsUseCase
        self.getDimUseCase = getDimUseCase
        self.getSpacingsUseCase = getSpacingsUseCase
        self.getSizesUseCase = getSizesUseCase
        self.getTitleFontTokenUseCase = getTitleFontTokenUseCase
        self.getShowContentUseCase = getShowContentUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        appearance: ButtonAppearance?, // TODO: Remove ASAP the optional
        intent: ButtonIntent,
        variant: ButtonVariant,
        shape: ButtonShape,
        size: ButtonSize,
        type: ButtonType,
        contentVisibility: ButtonContentVisibility,
        removeStyles: Bool,
        isEnabled: Bool,
        isLoading: Bool
    ) {
        self.theme = theme
        self.appearance = appearance
        self.intent = intent
        self.variant = variant
        self.shape = shape
        self.size = size
        self.type = type
        self.contentVisibility = contentVisibility
        self.removeStyles = removeStyles
        self.isEnabled = isEnabled
        self.isLoading = isLoading

        self.setBorder()
        self.setColors()
        self.setDim()
        self.setLayout()
        self.setSizes()
        self.setTitleFontToken()
        self.setShowContent()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setBorder() {
        guard let theme,
              let intent,
              let shape,
              let variant,
              let removeStyles else {
            return
        }

        self.border = self.getBorderUseCase.execute(
            theme: theme,
            appearance: self.appearance,
            intent: intent,
            shape: shape,
            variant: variant,
            removeStyles: removeStyles
        )
    }

    private func setColors() {
        guard let theme, let intent, let variant else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            appearance: self.appearance,
            intent: intent,
            variant: variant,
            isPressed: self.isPressed
        )
    }

    private func setDim() {
        guard let theme, let isEnabled else { return }

        self.dim = self.getDimUseCase.execute(
            theme: theme,
            isEnabled: isEnabled
        )
    }

    private func setLayout() {
        guard let theme, let type, let contentVisibility else { return }

        self.layout = self.getSpacingsUseCase.execute(
            theme: theme,
            type: type,
            contentVisibility: contentVisibility
        )
    }

    private func setSizes() {
        guard let size, let type, let contentVisibility, let removeStyles, let isLoading else { return }

        self.sizes = self.getSizesUseCase.execute(
            size: size,
            type: type,
            contentVisibility: contentVisibility,
            removeStyles: removeStyles,
            isLoading: isLoading
        )
    }

    private func setTitleFontToken() {
        guard let theme else { return }

        self.titleFontToken = self.getTitleFontTokenUseCase.execute(
            theme: theme
        )
    }

    private func setShowContent() {
        guard let type, let contentVisibility, let isLoading else { return }

        self.showContent = self.getShowContentUseCase.execute(
            type: type,
            contentVisibility: contentVisibility,
            isLoading: isLoading
        )
    }
}

