//
//  TagUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TagUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Text Only", code: Self.textOnly),
            .init(title: "Text + Icon", code: Self.textIcon),
            .init(title: "Icon Only", code: Self.iconOnly),
            .init(title: "Attributed Text", code: Self.attributedText),
            .init(title: "Attributed Text + Icon", code: Self.attributedTextIcon),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var textOnly: String {
        """
        let tag = SparkUITag(theme: theme)
        tag.text = "My Tag"
        tag.intent = .main
        tag.variant = .filled
        tag.size = .medium
        """
    }

    private static var textIcon: String {
        """
        let tag = SparkUITag(theme: theme)
        tag.text = "My Tag"
        tag.icon = .init(icon: .spark)
        tag.intent = .success
        tag.variant = .tinted
        tag.size = .medium
        """
    }

    private static var iconOnly: String {
        """
        let tag = SparkUITag(theme: theme)
        tag.icon = .init(icon: .spark)
        tag.intent = .main
        tag.variant = .outlined
        tag.size = .small
        tag.accessibilityLabel = "My Tag"
        tag.largeContentTitle = "My Tag"
        """
    }

    private static var attributedText: String {
        """
        let tag = SparkUITag(theme: theme)
        tag.attributedText = NSAttributedString(string: "My Tag")
        tag.intent = .main
        tag.variant = .filled
        """
    }

    private static var attributedTextIcon: String {
        """
        let tag = SparkUITag(theme: theme)
        tag.attributedText = NSAttributedString(string: "My Tag")
        tag.icon = .init(icon: .spark)
        tag.intent = .danger
        tag.variant = .outlined
        """
    }

    private static var fullConfiguration: String {
        """
        let tag = SparkUITag(theme: theme)
        tag.text = "My Tag"
        tag.icon = .init(icon: .spark)
        tag.intent = .main
        tag.size = .large
        tag.variant = .filled
        tag.isHighlighted = true
        tag.accessibilityLabel = "Tag label"
        tag.largeContentTitle = "The purpose of my tag"
        """
    }
}
