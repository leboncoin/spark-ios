//
//  TextEditorCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextEditorCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic", code: Self.basic),
            .init(title: "With Theme Environment", code: Self.withThemeEnvironment),
            .init(title: "With Intent", code: Self.withIntent),
            .init(title: "Read Only", code: Self.readOnly),
            .init(title: "With Accessibility", code: Self.withAccessibility),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var basic: String {
        """
        SparkTextEditor(
            "Enter your text",
            text: $text
        )
        .sparkTheme(theme)
        """
    }

    private static var withThemeEnvironment: String {
        """
        SparkTextEditor(
            "Enter your text",
            text: $text
        )
        .sparkTheme(theme)
        .sparkTextEditorIntent(.neutral)
        """
    }

    private static var withIntent: String {
        """
        SparkTextEditor(
            "Enter your message",
            text: $text
        )
        .sparkTheme(theme)
        .sparkTextEditorIntent(.success)
        """
    }

    private static var readOnly: String {
        """
        SparkTextEditor(
            "Read only text",
            text: $text
        )
        .sparkTheme(theme)
        .sparkTextEditorIntent(.neutral)
        .sparkTextEditorReadOnly(true)
        """
    }

    private static var withAccessibility: String {
        """
        SparkTextEditor(
            "Description",
            text: $text
        )
        .sparkTheme(theme)
        .sparkTextEditorIntent(.neutral)
        .sparkTextEditorAccessibilityLabel("Product description")
        .sparkTextEditorAccessibilityValue("Current description text")
        .sparkTextEditorAccessibilityHint("Enter a detailed product description")
        """
    }

    private static var fullConfiguration: String {
        """
        SparkTextEditor(
            "Enter your comment",
            text: $text
        )
        .sparkTheme(theme)
        .sparkTextEditorIntent(.neutral)
        .sparkTextEditorReadOnly(false)
        .disabled(false)
        .sparkTextEditorAccessibilityLabel("Comment field")
        .sparkTextEditorAccessibilityValue("User comment")
        .sparkTextEditorAccessibilityHint("Type your comment here")
        """
    }
}
