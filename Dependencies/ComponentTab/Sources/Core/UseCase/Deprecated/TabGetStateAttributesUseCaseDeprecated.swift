//
//  TabGetStateAttributesUseCaseDeprecated.swift
//  SparkComponentTab
//
//  Created by alican.aycil on 21.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon
import SparkTheming

// sourcery: AutoMockable
protocol TabGetStateAttributesUseCasableDeprecated {
    func execute(theme: any Theme,
                 intent: TabIntent,
                 state: TabStateDeprecated,
                 tabSize: TabSize,
                 hasTitle: Bool) -> TabStateAttributesDeprecated
}

/// TabGetStateAttributesUseCaseDeprecated
/// Use case to determine the attributes of the Tab
/// Functions:
/// - execute: returns attributes for given theme, intent and state
struct TabGetStateAttributesUseCaseDeprecated: TabGetStateAttributesUseCasableDeprecated {

    private let getIntentColorUseCase: any TabGetIntentColorUseCasebleDeprecated
    private let getFontUseCase: any TabGetFontUseCaseableDeprecated

    // MARK: - Initializer
    init(getIntentColorUseCase: any TabGetIntentColorUseCasebleDeprecated = TabGetIntentColorUseCaseDeprecated(),
         getTabFontUseCase: any TabGetFontUseCaseableDeprecated = TabGetFontUseCaseDeprecated()
    ) {
        self.getIntentColorUseCase = getIntentColorUseCase
        self.getFontUseCase = getTabFontUseCase
    }

    // MARK: - Methods
    ///
    /// Calculate the attribute of the tab depending on the theme, intent and state
    ///
    /// - Parameters:
    ///    - theme: current theme
    ///    - intent: `TabIntent`.
    ///    - state: `TabStateDeprecated`.
    ///    - size: `TabSize`
    ///
    /// - Returns: ``TabStateAttributesDeprecated`` return attributes of the tab.
    func execute(theme: any Theme,
                 intent: TabIntent,
                 state: TabStateDeprecated,
                 tabSize: TabSize,
                 hasTitle: Bool
    ) -> TabStateAttributesDeprecated {

        let size = hasTitle ? tabSize : TabSize.md

        let font = self.getFontUseCase.execute(typography: theme.typography, size: size)

        let spacings = TabItemSpacingsDeprecated(
            verticalEdge: theme.layout.spacing.medium,
            horizontalEdge: theme.layout.spacing.large,
            content: theme.layout.spacing.medium
        )

        let colors = TabItemColorsDeprecated(
            label: theme.colors.base.onSurface,
            line: theme.colors.base.outline,
            background: ColorTokenDefault.clear
        )

        let heights = TabItemHeightsDeprecated(
            separatorLineHeight: theme.border.width.small,
            itemHeight: size.itemHeight,
            iconHeight: size.iconHeight
        )

        if !state.isEnabled {
            return TabStateAttributesDeprecated(
                spacings: spacings,
                colors: colors.update(\.opacity, value: theme.dims.dim3),
                heights: heights,
                font: font
            )
        }

        if state.isPressed {
            let pressedColors = TabItemColorsDeprecated(
                label: theme.colors.base.onSurface.opacity(theme.dims.dim1),
                line: theme.colors.base.outline,
                background: theme.colors.states.surfacePressed)

            return TabStateAttributesDeprecated(
                spacings: spacings,
                colors: pressedColors,
                heights: heights,
                font: font
            )
        }

        if state.isSelected {
            let intentColor = self.getIntentColorUseCase.execute(colors: theme.colors, intent: intent)
            let selectedColors = TabItemColorsDeprecated(
                label: intentColor,
                line: intentColor,
                background: ColorTokenDefault.clear
            )
            return TabStateAttributesDeprecated(
                spacings: spacings,
                colors: selectedColors,
                heights: heights.update(\.separatorLineHeight, value: theme.border.width.medium),
                font: font
            )
        }

        return TabStateAttributesDeprecated(
            spacings: spacings,
            colors: colors,
            heights: heights,
            font: font
        )
    }
}

private extension CGFloat {
    static let medium: CGFloat = 40
    static let small: CGFloat = 36
    static let extraSmall: CGFloat = 34

    static let fontMd: CGFloat = 16
    static let fontSm: CGFloat = 14
    static let fontXs: CGFloat = 12
}

extension TabSize {
    var itemHeight: CGFloat {
        switch self {
        case .md, .medium: return .medium
        case .sm, .small: return .small
        case .xs, .xSmall: return .extraSmall
        }
    }
}

private extension TabSize {
    var iconHeight: CGFloat {
        switch self {
        case .md, .medium: return .fontMd
        case .sm, .small: return .fontSm
        case .xs, .xSmall: return .fontXs
       }
    }
}
