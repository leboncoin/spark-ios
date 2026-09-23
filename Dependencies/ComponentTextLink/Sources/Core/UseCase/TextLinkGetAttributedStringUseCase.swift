//
//  TextLinkGetAttributedStringUseCase.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TextLinkGetAttributedStringUseCaseable {

    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: TextLinkIntent,
        variant: TextLinkVariant,
        typography: TextLinkTypography,
        text: String,
        textHighlightRange: NSRange?,
        isHighlighted: Bool
    ) -> AttributedString

    // sourcery: theme = "Identical"
    func executeUI(
        theme: any Theme,
        intent: TextLinkIntent,
        variant: TextLinkVariant,
        typography: TextLinkTypography,
        text: String,
        textHighlightRange: NSRange?,
        isHighlighted: Bool
    ) -> NSAttributedString
}

struct TextLinkGetAttributedStringUseCase: TextLinkGetAttributedStringUseCaseable {

    // MARK: - Properties

    private let colorUseCase: any TextLinkGetColorUseCaseable
    private let typographiesUseCase: any TextLinkGetTypographiesUseCaseable
    private let getUnderlineStyleUseCase: any TextLinkGetUnderlineStyleUseCaseable

    // MARK: - Initialization

    init(
        colorUseCase: any TextLinkGetColorUseCaseable = TextLinkGetColorUseCase(),
        typographiesUseCase: any TextLinkGetTypographiesUseCaseable = TextLinkGetTypographiesUseCase(),
        getUnderlineStyleUseCase: any TextLinkGetUnderlineStyleUseCaseable = TextLinkGetUnderlineStyleUseCase()
    ) {
        self.colorUseCase = colorUseCase
        self.typographiesUseCase = typographiesUseCase
        self.getUnderlineStyleUseCase = getUnderlineStyleUseCase
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: TextLinkIntent,
        variant: TextLinkVariant,
        typography: TextLinkTypography,
        text: String,
        textHighlightRange: NSRange?,
        isHighlighted: Bool
    ) -> AttributedString {
        let properties = self.properties(
            theme: theme,
            intent: intent,
            variant: variant,
            typography: typography,
            isHighlighted: isHighlighted
        )

        var attributedString = AttributedString(text)
        attributedString.foregroundColor = properties.colorToken.color

        if let textHighlightRangeTemp = textHighlightRange,
           let textHighlightRange = Range(textHighlightRangeTemp, in: attributedString) {

            attributedString.font = properties.typographies.normal.font

            attributedString[textHighlightRange].font = properties.typographies.highlight.font
            attributedString[textHighlightRange].underlineStyle = properties.underlineStyle

        } else {
            attributedString.font = properties.typographies.highlight.font
            attributedString.underlineStyle = properties.underlineStyle
        }

        return attributedString
    }

    func executeUI(
        theme: any Theme,
        intent: TextLinkIntent,
        variant: TextLinkVariant,
        typography: TextLinkTypography,
        text: String,
        textHighlightRange: NSRange?,
        isHighlighted: Bool
    ) -> NSAttributedString {
        let properties = self.properties(
            theme: theme,
            intent: intent,
            variant: variant,
            typography: typography,
            isHighlighted: isHighlighted
        )

        var attributedString: NSMutableAttributedString
        let textColor = properties.colorToken.uiColor

        var highlightAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: textColor,
            .font: properties.typographies.highlight.uiFont
        ]

        if let underlineStyle = properties.underlineStyle {
            highlightAttributes[.underlineStyle] = underlineStyle.rawValue
            highlightAttributes[.underlineColor] = textColor
        }

        if let textHighlightRange, text.count >= textHighlightRange.upperBound {
            let normalAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: textColor,
                .font: properties.typographies.normal.uiFont
            ]

            attributedString = NSMutableAttributedString(
                string: text,
                attributes: normalAttributes
            )

            attributedString.addAttributes(
                highlightAttributes,
                range: textHighlightRange
            )

        } else {
            attributedString = NSMutableAttributedString(
                string: text,
                attributes: highlightAttributes
            )
        }

        return attributedString
    }

    // MARK: - Private Methods

    private typealias Properties = (
        colorToken: any ColorToken,
        typographies: TextLinkTypographies,
        underlineStyle: NSUnderlineStyle?
    )

    private func properties(
        theme: any Theme,
        intent: TextLinkIntent,
        variant: TextLinkVariant,
        typography: TextLinkTypography,
        isHighlighted: Bool
    ) -> Properties {

        let colors = self.colorUseCase.execute(
            theme: theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        let typographies = self.typographiesUseCase.execute(
            theme: theme,
            typography: typography)

        let underlineStyle = self.getUnderlineStyleUseCase.execute(
            variant: variant,
            isHighlighted: isHighlighted
        )

        return (colors, typographies, underlineStyle)
    }
}
