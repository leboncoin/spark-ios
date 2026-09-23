//
//  DividerUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct DividerUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Without Text", code: Self.withoutText),
            .init(title: "With Text", code: Self.withText),
            .init(title: "With Attributed Text", code: Self.withAttributedText),
            .init(title: "Vertical Divider", code: Self.verticalDivider),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var withoutText: String {
        """
        let divider = SparkUIDivider(theme: theme)
        divider.intent = .outline
        divider.axis = .horizontal
        """
    }

    private static var withText: String {
        """
        let divider = SparkUIDivider(theme: theme)
        divider.text = "My text"
        divider.intent = .outlineHigh
        divider.axis = .horizontal
        divider.alignment = .center
        """
    }

    private static var withAttributedText: String {
        """
        let divider = SparkUIDivider(theme: theme)
        let attributedText = NSAttributedString(
            string: "Styled text",
            attributes: [.foregroundColor: UIColor.blue]
        )
        divider.attributedText = attributedText
        divider.intent = .outline
        divider.axis = .horizontal
        divider.alignment = .leading
        """
    }

    private static var verticalDivider: String {
        """
        let divider = SparkUIDivider(theme: theme)
        divider.text = "Section"
        divider.intent = .outline
        divider.axis = .vertical
        divider.alignment = .top
        """
    }

    private static var fullConfiguration: String {
        """
        let divider = SparkUIDivider(theme: theme)
        divider.alignment = .center
        divider.axis = .horizontal
        divider.intent = .outlineHigh
        divider.text = "Section Divider"
        divider.accessibilityLabel = "Custom divider label"
        """
    }
}
