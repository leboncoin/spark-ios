//
//  ChipViewModel.swift
//  SparkCore
//
//  Created by michael.zimmermann on 02.05.23.
//  Copyright © 2023 Adevinta. All rights reserved.
//

import Foundation

class ChipViewModel<Badge>: ObservableObject {

    // MARK: - Properties Injected
    private (set) var theme: Theme
    private (set) var variant: ChipVariant
    private (set) var intent: ChipIntent
    private (set) var alignment: ChipAlignment
    private let useCase: GetChipColorsUseCasable

    // MARK: - State Properties
    var isEnabled: Bool = true {
        didSet {
            guard isEnabled != oldValue else { return }
            self.updateColors()
        }
    }
    var isPressed: Bool = false {
        didSet {
            guard isPressed != oldValue else { return }
            self.updateColors()
        }
    }

    // MARK: - Published Properties
    @Published var spacing: CGFloat
    @Published var padding: CGFloat
    @Published var borderRadius: CGFloat
    @Published var font: TypographyFontToken
    @Published var colors: ChipStateColors
    @Published var isIconLeading: Bool
    @Published var badge: Badge? = nil

    // MARK: - Computed variables
    var isBorderDashed: Bool {
        return self.variant.isDashedBorder
    }
    var isBordered: Bool {
        return self.variant.isBordered
    }

    // MARK: - Initializers
    convenience init(theme: Theme,
                     variant: ChipVariant,
                     intent: ChipIntent,
                     alignment: ChipAlignment) {
        self.init(theme: theme,
                  variant: variant,
                  intent: intent,
                  alignment: alignment,
                  useCase: GetChipColorsUseCase())
    }

    init(theme: Theme,
         variant: ChipVariant,
         intent: ChipIntent,
         alignment: ChipAlignment,
         useCase: GetChipColorsUseCasable) {
        self.theme = theme
        self.variant = variant
        self.intent = intent
        self.useCase = useCase
        self.alignment = alignment
        self.colors = useCase.execute(theme: theme, variant: variant, intent: intent, state: .default)
        self.spacing = self.theme.layout.spacing.small
        self.padding = self.theme.layout.spacing.medium
        self.borderRadius = self.theme.border.radius.medium
        self.font = self.theme.typography.body2
        self.isIconLeading = alignment.isIconLeading
    }

    func set(theme: Theme) {
        self.theme = theme
        self.themeDidUpdate()
    }

    func set(variant: ChipVariant) {
        guard self.variant != variant else { return }

        self.variant = variant
        self.variantDidUpdate()
    }

    func set(intent: ChipIntent) {
        guard self.intent != intent else { return }

        self.intent = intent
        self.intentColorsDidUpdate()
    }

    func set(alignment: ChipAlignment) {
        guard self.alignment != alignment else { return }

        self.alignment = alignment
        self.isIconLeading = alignment.isIconLeading
    }

    // MARK: - Private functions
    private func updateColors() {
        let state = ChipState(isEnabled: self.isEnabled, isPressed: self.isPressed)
        self.colors = self.useCase.execute(theme: self.theme, variant: self.variant, intent: self.intent, state: state)
    }

    private func themeDidUpdate() {
        self.updateColors()

        self.spacing = self.theme.layout.spacing.small
        self.padding = self.theme.layout.spacing.medium
        self.borderRadius = self.theme.border.radius.medium
        self.font = self.theme.typography.body2
    }

    private func variantDidUpdate() {
        self.updateColors()
    }

    private func intentColorsDidUpdate() {
        self.updateColors()
    }
}

private extension ChipVariant {
    var isBordered: Bool {
        return self == .dashed || self == .outlined
    }

    var isDashedBorder: Bool {
        return self == .dashed
    }
}

private extension ChipAlignment {
    var isIconLeading: Bool {
        return self == .leadingIcon
    }
}
