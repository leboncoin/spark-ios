//
//  TextFieldViewModelForAddons.swift
//  SparkTextField
//
//  Created by louis.borlee on 14/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
import Combine
import SparkTheming

final class TextFieldViewModelForAddons: TextInputUIViewModel {

    override var backgroundColor: any ColorToken {
        get {
            return ColorTokenDefault.clear
        }
        set {
            self.addonsBackgroundColor = newValue
        }
    }

    override var dim: CGFloat {
        get {
            return 1.0
        }
        set {
            self.addonsDim = newValue
        }
    }

    @Published private(set) var addonsBackgroundColor: any ColorToken = ColorTokenDefault.clear
    @Published private(set) var addonsBorderWidth: CGFloat = .zero
    @Published private(set) var addonsBorderRadius: CGFloat = .zero
    @Published private(set) var addonsLeftSpacing: CGFloat = .zero
    @Published private(set) var addonsContentSpacing: CGFloat = .zero
    @Published private(set) var addonsRightSpacing: CGFloat = .zero
    @Published private(set) var addonsDim: CGFloat = 1.0

    init(
        theme: any Theme,
        intent: TextFieldIntent,
        getColorsUseCase: TextInputGetColorsUseCaseable = TextInputGetColorsUseCase(),
        getBorderLayoutUseCase: TextInputGetBorderLayoutUseCaseable = TextInputGetBorderLayoutUseCase(),
        getSpacingsUseCase: TextInputGetSpacingsUseCaseable = TextInputGetSpacingsUseCase()
    ) {
        super.init(
            theme: theme,
            intent: intent,
            borderStyle: .none,
            getColorsUseCase: getColorsUseCase,
            getBorderLayoutUseCase: getBorderLayoutUseCase,
            getSpacingsUseCase: getSpacingsUseCase)

        self.addonsBackgroundColor = super.backgroundColor
        self.setBorderLayout()
        self.setSpacings()
        self.addonsDim = super.dim
    }

    override func setBorderLayout() {
        let borderLayout = self.getBorderLayoutUseCase.execute(
            theme: self.theme,
            borderStyle: .roundedRect,
            isFocused: self.isFocused
        )

        self.addonsBorderWidth = borderLayout.width
        self.addonsBorderRadius = borderLayout.radius
    }

    override func setSpacings() {
        let spacings = self.getSpacingsUseCase.execute(
            theme: self.theme,
            borderStyle: .roundedRect)
        self.addonsLeftSpacing = spacings.horizontal
        self.addonsContentSpacing = spacings.content
        self.addonsRightSpacing = spacings.horizontal
    }
}
