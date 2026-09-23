//
//  TextLinkCodeSyntax.swift
//  SparkDemo
//
//  Created by robin.lemaire on 19/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextLinkCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Text Only", code: Self.textOnly),
            .init(title: "Text + Image", code: Self.textImage),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var textOnly: String {
        """
        SparkTextLink(
            "My TextLink",
            action: {
                // Your action
            }
        )
        .sparkTheme(theme)
        """
    }

    private static var textImage: String {
        """
        SparkTextLink(
            "My TextLink",
            image: Image(systemName: "pencil"),
            action: {
                // Your action
            }
        )
        .sparkTheme(theme)
        .sparkTextLinkIntent(.main)
        .sparkTextLinkAlignment(.leadingImage)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkTextLink(
            "My TextLink",
            image: Image(systemName: "pencil"),
            action: {
                // Your action
            }
        )
        .sparkTheme(theme)
        .sparkTextLinkAlignment(.leadingImage)
        .sparkTextLinkHighlightRange(NSRange(location: 0, length: 2))
        .sparkTextLinkIntent(.main)
        .sparkTextLinkTypography(.callout)
        .sparkTextLinkVariant(.underline)
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        .accessibilityLabel("My custom label")
        """
    }
}
