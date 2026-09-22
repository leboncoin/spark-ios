//
//  FormFieldCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FormFieldCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic", code: Self.basic),
            .init(title: "With Title & Helper", code: Self.withTitleHelper),
            .init(title: "With Error State", code: Self.withErrorState),
            .init(title: "With Clear Button", code: Self.withClearButton),
            .init(title: "With Counter", code: Self.withCounter),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var basic: String {
        """
        @State private var text: String = ""

        FormFieldView(
            theme: theme,
            component: {
                TextField("Enter text", text: $text)
            }
        )
        """
    }

    private static var withTitleHelper: String {
        """
        @State private var text: String = ""

        FormFieldView(
            theme: theme,
            feedbackState: .default,
            title: "Email",
            helper: "Please provide a valid email",
            isRequired: true,
            component: {
                TextField("Email", text: $text)
            }
        )
        """
    }

    private static var withErrorState: String {
        """
        @State private var text: String = ""

        FormFieldView(
            theme: theme,
            feedbackState: .error,
            title: "Email",
            helper: "Invalid email format",
            helperImage: Image(systemName: "exclamationmark.circle"),
            isRequired: true,
            component: {
                TextField("Email", text: $text)
            }
        )
        """
    }

    private static var withClearButton: String {
        """
        @State private var text: String = ""

        FormFieldView(
            theme: theme,
            feedbackState: .default,
            title: "Email",
            component: {
                TextField("Email", text: $text)
            }
        )
        .clearButton(
            title: "Clear",
            icon: Image(systemName: "xmark.circle")
        ) {
            text = ""
        }
        """
    }

    private static var withCounter: String {
        """
        @State private var text: String = ""

        FormFieldView(
            theme: theme,
            feedbackState: .default,
            title: "Bio",
            helper: "Tell us about yourself",
            component: {
                TextField("Bio", text: $text)
            }
        )
        .counter(on: text, limit: 100)
        """
    }

    private static var fullConfiguration: String {
        """
        @State private var text: String = ""

        FormFieldView(
            theme: theme,
            feedbackState: .error,
            title: "Email (exemple@mail.fr)",
            helper: "Please provide a valid email (exemple@mail.fr).",
            helperImage: Image(systemName: "exclamationmark.circle"),
            isRequired: true,
            component: {
                TextField("Email (exemple@mail.fr)", text: $text)
            }
        )
        .clearButton(
            title: "Clear",
            icon: Image(systemName: "xmark.circle")
        ) {
            text = ""
        }
        .counter(on: text, limit: 100)
        .titleAccessibilityLabel("Email field")
        .clearButtonAccessibilityLabel("Clear email")
        .helperAccessibilityLabel("Email validation error")
        .secondaryHelperAccessibilityLabel("Character count")
        .secondaryHelperAccessibilityValue("\\(text.count) of 100")
        """
    }
}
