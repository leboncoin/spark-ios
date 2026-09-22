//
//  CardViewModel.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class CardViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var border = CardBorder()
    @Published private(set) var colors = CardColors()
    @Published private(set) var dim: CGFloat = 0
    @Published private(set) var layout = CardLayout()
    @Published private(set) var typographies = CardTypographies()
    @Published private(set) var headerColors = CardHeaderColors()

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
            self.setDim()
            self.setLayout()
            self.setTypographies()
            self.setHeaderColors()
        }
    }

    var intent: CardIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
            self.setHeaderColors()
        }
    }

    var isEnabled: Bool? {
        didSet {
            guard oldValue != self.isEnabled, self.alreadyUpdateAll else { return }

            self.setDim()
        }
    }

    var padding: CardPadding? {
        didSet {
            guard oldValue != self.padding, self.alreadyUpdateAll else { return }

            self.setLayout()
        }
    }

    var isPressed: Bool = false {
        didSet {
            guard oldValue != self.isPressed, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var variant: CardVariant? {
        didSet {
            guard oldValue != self.variant, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
            self.setHeaderColors()
        }
    }

    var isHeader: Bool? {
        didSet {
            guard oldValue != self.isHeader, self.alreadyUpdateAll else { return }

            self.setBorder()
        }
    }

    var headerPosition: CardHeaderPosition? {
        didSet {
            guard oldValue != self.headerPosition, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setLayout()
            self.setTypographies()
            self.setHeaderColors()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any CardGetColorsUseCaseable
    private let getBorderUseCase: any CardGetBorderUseCaseable
    private let getDimUseCase: any CardGetDimUseCaseable
    private let getLayoutUseCase: any CardGetLayoutUseCaseable
    private let getTypographiesUseCase: any CardGetTypographiesUseCaseable
    private let getHeaderColorsUseCase: any CardGetHeaderColorsUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any CardGetColorsUseCaseable = CardGetColorsUseCase(),
        getBorderUseCase: any CardGetBorderUseCaseable = CardGetBorderUseCase(),
        getDimUseCase: any CardGetDimUseCaseable = CardGetDimUseCase(),
        getLayoutUseCase: any CardGetLayoutUseCaseable = CardGetLayoutUseCase(),
        getTypographiesUseCase: any CardGetTypographiesUseCaseable = CardGetTypographiesUseCase(),
        getHeaderColorsUseCase: any CardGetHeaderColorsUseCaseable = CardGetHeaderColorsUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getBorderUseCase = getBorderUseCase
        self.getDimUseCase = getDimUseCase
        self.getLayoutUseCase = getLayoutUseCase
        self.getTypographiesUseCase = getTypographiesUseCase
        self.getHeaderColorsUseCase = getHeaderColorsUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: CardIntent,
        isEnabled: Bool,
        padding: CardPadding,
        variant: CardVariant,
        isHeader: Bool,
        headerPosition: CardHeaderPosition
    ) {
        self.theme = theme
        self.intent = intent
        self.isEnabled = isEnabled
        self.padding = padding
        self.variant = variant
        self.isHeader = isHeader
        self.headerPosition = headerPosition

        self.setBorder()
        self.setColors()
        self.setDim()
        self.setLayout()
        self.setTypographies()
        self.setHeaderColors()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setBorder() {
        guard let theme, let variant, let isHeader, let headerPosition else { return }

        self.border = self.getBorderUseCase.execute(
            theme: theme,
            variant: variant,
            isHeader: isHeader,
            headerPosition: headerPosition
        )
    }
    private func setColors() {
        guard let theme, let intent, let variant else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
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
        guard let theme, let padding, let headerPosition else { return }

        self.layout = self.getLayoutUseCase.execute(
            theme: theme,
            padding: padding,
            headerPosition: headerPosition
        )
    }

    private func setTypographies() {
        guard let theme, let headerPosition else { return }

        self.typographies = self.getTypographiesUseCase.execute(
            theme: theme,
            headerPosition: headerPosition
        )
    }

    private func setHeaderColors() {
        guard let theme, let intent, let variant, let headerPosition else { return }

        self.headerColors = self.getHeaderColorsUseCase.execute(
            theme: theme,
            intent: intent,
            variant: variant,
            headerPosition: headerPosition
        )
    }
}
