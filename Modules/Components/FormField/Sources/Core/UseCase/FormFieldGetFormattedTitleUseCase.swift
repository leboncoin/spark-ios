//
//  FormFieldGetFormattedTitleUseCase.swift
//  SparkComponentFormField
//
//  Created by robin.lemaire on 06/05/25.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SparkTheming
@_spi(SI_SPI) import SparkCommon
import SwiftUI
import UIKit

// sourcery: AutoMockable
protocol FormFieldGetFormattedTitleUseCaseable {
    func execute(for frameworkType: FrameworkType, title: String?, isRequired: Bool, colors: FormFieldColors, fonts: FormFieldFonts) -> AttributedStringEither?
}

struct FormFieldGetFormattedTitleUseCase: FormFieldGetFormattedTitleUseCaseable {

    // MARK: - Constants

    private enum Constants {
        static let require = " *"
    }

    // MARK: - Execute

    func execute(
        for frameworkType: FrameworkType,
        title: String?,
        isRequired: Bool,
        colors: FormFieldColors,
        fonts: FormFieldFonts
    ) -> AttributedStringEither? {
        guard let title else {
            return nil
        }

        switch frameworkType {
        case .uiKit:
            let attributedString = self.createNSAttributedString(
                from: title,
                isRequired: isRequired,
                colors: colors,
                fonts: fonts
            )

            return .left(attributedString)

        case .swiftUI:
            let attributedString = self.createAttributedString(
                from: title,
                isRequired: isRequired,
                colors: colors,
                fonts: fonts
            )

            return .right(attributedString)
        }
    }

    // MARK: - Private

    private func createNSAttributedString(from title: String, isRequired: Bool, colors: FormFieldColors, fonts: FormFieldFonts) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: title, attributes: [
            NSAttributedString.Key.foregroundColor: colors.title.uiColor,
            NSAttributedString.Key.font: fonts.title.uiFont
        ])

        if isRequired {
            let requireAttributedString = NSAttributedString(
                string: Constants.require,
                attributes: [
                    NSAttributedString.Key.foregroundColor: colors.require.uiColor,
                    NSAttributedString.Key.font: fonts.require.uiFont
                ]
            )

            attributedString.append(requireAttributedString)
        }

        return attributedString
    }

    private func createAttributedString(from title: String, isRequired: Bool, colors: FormFieldColors, fonts: FormFieldFonts) -> AttributedString {
        var attributedString = AttributedString(title)
        attributedString.foregroundColor = colors.title.color
        attributedString.font = fonts.title.font

        if isRequired {
            var requireAttributedString = AttributedString(Constants.require)
            requireAttributedString.foregroundColor = colors.require.color
            requireAttributedString.font = fonts.require.font

            return attributedString + requireAttributedString
        } else {
            return attributedString
        }
    }
}
