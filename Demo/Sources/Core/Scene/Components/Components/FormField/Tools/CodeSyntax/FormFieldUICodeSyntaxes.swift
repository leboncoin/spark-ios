//
//  FormFieldUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FormFieldUICodeSyntaxes {

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
        let textField = UITextField()
        textField.placeholder = "Enter text"

        let formField = FormFieldUIView(
            theme: theme,
            component: textField
        )
        """
    }

    private static var withTitleHelper: String {
        """
        let textField = UITextField()
        textField.placeholder = "Email"

        let formField = FormFieldUIView(
            theme: theme,
            component: textField,
            feedbackState: .default,
            title: "Email",
            helper: "Please provide a valid email",
            isRequired: true
        )
        """
    }

    private static var withErrorState: String {
        """
        let textField = UITextField()
        textField.placeholder = "Email"

        let formField = FormFieldUIView(
            theme: theme,
            component: textField,
            feedbackState: .error,
            title: "Email",
            helper: "Invalid email format",
            isRequired: true
        )

        formField.helperImage = UIImage(systemName: "exclamationmark.circle")
        """
    }

    private static var withClearButton: String {
        """
        let textField = UITextField()
        textField.placeholder = "Email"

        let formField = FormFieldUIView(
            theme: theme,
            component: textField,
            feedbackState: .default,
            title: "Email"
        )

        formField.clearButtonImage = UIImage(systemName: "xmark.circle")
        formField.clearButton.addAction(UIAction(handler: { _ in
            textField.text = ""
        }), for: .touchUpInside)
        """
    }

    private static var withCounter: String {
        """
        let textField = UITextField()
        textField.placeholder = "Bio"

        let formField = FormFieldUIView(
            theme: theme,
            component: textField,
            feedbackState: .default,
            title: "Bio",
            helper: "Tell us about yourself"
        )

        formField.setCounter(on: textField.text, limit: 100)
        """
    }

    // swiftlint:disable no_debugging_method
    private static var fullConfiguration: String {
        """
        let textField = UITextField()
        textField.placeholder = "Email (exemple@mail.fr)"
        textField.addAction(UIAction(handler: { action in
            guard let textField = action.sender as? UITextField else { return }
            // Your action
        }), for: .editingChanged)

        let formField = FormFieldUIView(
            theme: theme,
            component: textField,
            feedbackState: .error,
            title: "Email (exemple@mail.fr)",
            helper: "Please provide a valid email (exemple@mail.fr).",
            isRequired: true
        )

        // Set helper image
        formField.helperImage = UIImage(systemName: "exclamationmark.circle")

        // Configure clear button
        formField.clearButtonImage = UIImage(systemName: "xmark.circle")
        formField.clearButton.addAction(UIAction(handler: { _ in
            textField.text = ""
        }), for: .touchUpInside)

        // Set counter
        formField.setCounter(on: textField.text, limit: 100)

        // Set accessibility labels
        formField.titleLabel.accessibilityLabel = "Email field"
        formField.clearButton.accessibilityLabel = "Clear email"
        formField.helperLabel.accessibilityLabel = "Email validation error"
        formField.secondaryHelperLabel.accessibilityLabel = "Character count"
        formField.secondaryHelperLabel.accessibilityValue = "\\(textField.text?.count ?? 0) of 100"
        """
    }
}
