//
//  TextLinkUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 19/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextLinkUICodeSyntaxes {

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
        let textLink = SparkUITextLink(theme: theme)
        textLink.text = "My TextLink"

        textLink.addAction(.init(handler: { _ in
            // Your action
        }), for: .touchUpInside)
        """
    }

    private static var textImage: String {
        """
        let textLink = SparkUITextLink(theme: theme)
        textLink.text = "My TextLink"
        textLink.image = UIImage(systemName: "pencil")
        textLink.alignment = .leadingImage
        textLink.intent = .main

        textLink.addAction(.init(handler: { _ in
            // Your action
        }), for: .touchUpInside)
        """
    }

    private static var fullConfiguration: String {
        """
        let textLink = SparkUITextLink(theme: theme)
        textLink.text = "My TextLink"
        textLink.image = UIImage(systemName: "pencil")
        textLink.alignment = .leadingImage
        textLink.intent = .main
        textLink.variant = .underline
        textLink.typography = .callout
        textLink.textHighlightRange = NSRange(location: 0, length: 2)
        textLink.textLabel.textAlignment = .left
        textLink.textLabel.lineBreakMode = .byTruncatingTail
        textLink.textLabel.numberOfLines = 2
        textLink.accessibilityLabel = "My custom label"

        textLink.addAction(.init(handler: { _ in
            // Your action
        }), for: .touchUpInside)
        """
    }
}
