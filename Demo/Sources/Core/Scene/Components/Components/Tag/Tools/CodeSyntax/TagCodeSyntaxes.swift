//
//  TagCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TagCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Text Only", code: Self.textOnly),
            .init(title: "Text + Icon", code: Self.textIcon),
            .init(title: "Icon Only", code: Self.iconOnly),
            .init(title: "Custom Label", code: Self.customLabel),
            .init(title: "Custom Label + Icon", code: Self.customLabelIcon),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var textOnly: String {
        """
        SparkTag("My Tag")
            .sparkTheme(theme)
            .sparkTagIntent(.main)
            .sparkTagVariant(.filled)
            .sparkTagSize(.medium)
        """
    }

    private static var textIcon: String {
        """
        SparkTag(
            "My Tag",
            icon: .init(icon: .spark)
        )
        .sparkTheme(theme)
        .sparkTagIntent(.success)
        .sparkTagVariant(.tinted)
        .sparkTagSize(.medium)
        """
    }

    private static var iconOnly: String {
        """
        SparkTag(icon: .init(icon: .spark))
            .sparkTheme(theme)
            .sparkTagIntent(.main)
            .sparkTagVariant(.outlined)
            .sparkTagSize(.small)
            .accessibilityLabel("My Tag")
            .sparkAccessibilityLargeContentText("My Tag")
        """
    }

    private static var customLabel: String {
        """
        SparkTag {
            VStack {
                Text("Hello")
                Text("World")
            }
        }
        .sparkTheme(theme)
        .sparkTagIntent(.main)
        .sparkTagVariant(.filled)
        """
    }

    private static var customLabelIcon: String {
        """
        SparkTag(
            icon: .init(icon: .spark),
            label: {
                VStack {
                    Text("Hello")
                    Text("World")
                }
            }
        )
        .sparkTheme(theme)
        .sparkTagIntent(.main)
        .sparkTagVariant(.filled)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkTag(
            "My Tag",
            icon: .init(icon: .spark)
        )
        .sparkTheme(theme)
        .sparkTagIntent(.main)
        .sparkTagSize(.medium)
        .sparkTagVariant(.filled)
        .sparkTagIsHighlighted(true)
        .accessibilityLabel("Tag label")
        .sparkAccessibilityLargeContentText("The purpose of my tag")
        """
    }
}
