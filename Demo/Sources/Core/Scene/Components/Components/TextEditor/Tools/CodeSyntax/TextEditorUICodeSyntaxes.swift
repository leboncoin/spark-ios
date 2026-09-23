//
//  TextEditorUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextEditorUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic", code: Self.basic),
            .init(title: "With Placeholder", code: Self.withPlaceholder),
            .init(title: "With Intent", code: Self.withIntent),
            .init(title: "Read Only", code: Self.readOnly),
            .init(title: "With Text", code: Self.withText),
            .init(title: "With Accessibility", code: Self.withAccessibility),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var basic: String {
        """
        let textEditor = TextEditorUIView(
            theme: theme,
            intent: .neutral
        )
        """
    }

    private static var withPlaceholder: String {
        """
        let textEditor = TextEditorUIView(
            theme: theme,
            intent: .neutral
        )
        textEditor.placeholder = "Enter your text"
        """
    }

    private static var withIntent: String {
        """
        let textEditor = TextEditorUIView(
            theme: theme,
            intent: .success
        )
        textEditor.placeholder = "Enter your message"
        """
    }

    private static var readOnly: String {
        """
        let textEditor = TextEditorUIView(
            theme: theme,
            intent: .neutral
        )
        textEditor.placeholder = "Read only text"
        textEditor.isEditable = false
        """
    }

    private static var withText: String {
        """
        let textEditor = TextEditorUIView(
            theme: theme,
            intent: .neutral
        )
        textEditor.placeholder = "Enter description"
        textEditor.text = "Initial text content"
        """
    }

    private static var withAccessibility: String {
        """
        let textEditor = TextEditorUIView(
            theme: theme,
            intent: .neutral
        )
        textEditor.placeholder = "Description"
        textEditor.accessibilityLabel = "Product description"
        textEditor.accessibilityValue = "Current description text"
        textEditor.accessibilityHint = "Enter a detailed product description"
        """
    }

    private static var fullConfiguration: String {
        """
        let textEditor = TextEditorUIView(
            theme: theme,
            intent: .neutral
        )
        textEditor.placeholder = "Enter your comment"
        textEditor.text = "Initial comment"
        textEditor.isEditable = true
        textEditor.isScrollEnabled = true
        textEditor.isEnabled = true
        textEditor.accessibilityLabel = "Comment field"
        textEditor.accessibilityValue = "User comment"
        textEditor.accessibilityHint = "Type your comment here"
        """
    }
}
