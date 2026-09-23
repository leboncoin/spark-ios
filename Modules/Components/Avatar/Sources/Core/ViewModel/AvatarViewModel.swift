//
//  AvatarViewModel.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 29/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class AvatarViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = AvatarColors()
    @Published private(set) var border = AvatarBorder()
    @Published private(set) var dim: CGFloat = .zero
    @Published private(set) var sizes = AvatarSizes()
    @Published private(set) var layout = AvatarLayout()
    @Published private(set) var typographies = AvatarTypographies()
    @Published private(set) var scaleEffect: CGFloat = 1.0

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            self.setBorder()
            self.setDim()
            self.setLayout()
            self.setTypographies()
        }
    }

    var contentType: AvatarContentType? {
        didSet {
            guard oldValue != self.contentType, self.alreadyUpdateAll else { return }

            self.setColors()
            self.setBorder()
        }
    }

    var size: AvatarSize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setSizes()
            self.setTypographies()
            self.setScaleEffect()
        }
    }

    var isBorder: Bool? {
        didSet {
            guard oldValue != self.isBorder, self.alreadyUpdateAll else { return }

            self.setBorder()
        }
    }

    var isPressed: Bool = false {
        didSet {
            guard oldValue != self.isPressed, self.alreadyUpdateAll else { return }

            self.setColors()
            self.setScaleEffect()
        }
    }

    var isEnabled: Bool? {
        didSet {
            guard oldValue != self.isEnabled, self.alreadyUpdateAll else { return }

            self.setDim()
        }
    }

    // MARK: - Private Properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any AvatarGetColorsUseCaseable
    private let getBorderUseCase: any AvatarGetBorderUseCaseable
    private let getDimUseCase: any AvatarGetDimUseCaseable
    private let getSizesUseCase: any AvatarGetSizesUseCaseable
    private let getLayoutUseCase: any AvatarGetLayoutUseCaseable
    private let getTypographiesUseCase: any AvatarGetTypographiesUseCaseable
    private let getScaleEffectUseCase: any AvatarGetScaleEffectUseCaseable
    private let getCornerViewOffsetUseCase: any AvatarGetCornerViewOffsetUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any AvatarGetColorsUseCaseable = AvatarGetColorsUseCase(),
        getBorderUseCase: any AvatarGetBorderUseCaseable = AvatarGetBorderUseCase(),
        getDimUseCase: any AvatarGetDimUseCaseable = AvatarGetDimUseCase(),
        getSizesUseCase: any AvatarGetSizesUseCaseable = AvatarGetSizesUseCase(),
        getLayoutUseCase: any AvatarGetLayoutUseCaseable = AvatarGetLayoutUseCase(),
        getTypographiesUseCase: any AvatarGetTypographiesUseCaseable = AvatarGetTypographiesUseCase(),
        getScaleEffectUseCase: any AvatarGetScaleEffectUseCaseable = AvatarGetScaleEffectUseCase(),
        getCornerViewOffsetUseCase: any AvatarGetCornerViewOffsetUseCaseable = AvatarGetCornerViewOffsetUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getBorderUseCase = getBorderUseCase
        self.getDimUseCase = getDimUseCase
        self.getSizesUseCase = getSizesUseCase
        self.getLayoutUseCase = getLayoutUseCase
        self.getTypographiesUseCase = getTypographiesUseCase
        self.getScaleEffectUseCase = getScaleEffectUseCase
        self.getCornerViewOffsetUseCase = getCornerViewOffsetUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        contentType: AvatarContentType,
        size: AvatarSize,
        isBorder: Bool,
        isEnabled: Bool
    ) {
        self.theme = theme
        self.contentType = contentType
        self.size = size
        self.isBorder = isBorder
        self.isEnabled = isEnabled

        self.setColors()
        self.setBorder()
        self.setDim()
        self.setSizes()
        self.setLayout()
        self.setTypographies()
        self.setScaleEffect()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setColors() {
        guard let theme, let contentType else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            contentType: contentType,
            isPressed: self.isPressed
        )
    }

    private func setBorder() {
        guard let theme, let isBorder, let size, let contentType else { return }

        self.border = self.getBorderUseCase.execute(
            theme: theme,
            isBorder: isBorder,
            size: size,
            contentType: contentType
        )
    }

    private func setSizes() {
        guard let size else { return }

        self.sizes = self.getSizesUseCase.execute(
            size: size
        )
    }

    private func setLayout() {
        guard let theme else { return }

        self.layout = self.getLayoutUseCase.execute(
            theme: theme
        )
    }

    private func setTypographies() {
        guard let theme, let size else { return }

        self.typographies = self.getTypographiesUseCase.execute(
            theme: theme,
            size: size
        )
    }

    private func setDim() {
        guard let theme, let isEnabled else { return }

        self.dim = self.getDimUseCase.execute(
            theme: theme,
            isEnabled: isEnabled
        )
    }

    private func setScaleEffect() {
        guard let size else { return }

        self.scaleEffect = self.getScaleEffectUseCase.execute(
            size: size,
            isPressed: self.isPressed
        )
    }

    // MARK: - Getter

    func getCornerViewOffset(cornerViewSize: CGSize?) -> CGSize {
        guard let contentType else { return .zero }

        return self.getCornerViewOffsetUseCase.execute(
            contentType: contentType,
            avatarSize: self.sizes.size,
            cornerViewSize: cornerViewSize
        )
    }
}
