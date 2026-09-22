//
//  TextFieldUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextFieldUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic", code: Self.basic),
            .init(title: "With Left View", code: Self.withLeftView),
            .init(title: "With Right View", code: Self.withRightView),
            .init(title: "With Both Views", code: Self.withBothViews),
            .init(title: "Secure Entry", code: Self.secureEntry),
            .init(title: "Read Only", code: Self.readOnly),
            .init(title: "With Clear Button", code: Self.withClearButton),
            .init(title: "Disabled", code: Self.disabled),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var basic: String {
        """
        let textField = TextFieldUIView(
            theme: theme,
            intent: .neutral
        )
        textField.placeholder = "Placeholder"
        """
    }

    private static var withLeftView: String {
        """
        let textField = TextFieldUIView(
            theme: theme,
            intent: .neutral
        )
        textField.placeholder = "Search"

        let leftImageView = UIImageView(
            image: UIImage(systemName: "magnifyingglass")
        )
        textField.leftView = leftImageView
        textField.leftViewMode = .always
        """
    }

    private static var withRightView: String {
        """
        let textField = TextFieldUIView(
            theme: theme,
            intent: .neutral
        )
        textField.placeholder = "Enter text"

        let rightImageView = UIImageView(
            image: UIImage(systemName: "xmark.circle.fill")
        )
        textField.rightView = rightImageView
        textField.rightViewMode = .whileEditing
        """
    }

    private static var withBothViews: String {
        """
        let textField = TextFieldUIView(
            theme: theme,
            intent: .neutral
        )
        textField.placeholder = "Search"

        let leftImageView = UIImageView(
            image: UIImage(systemName: "magnifyingglass")
        )
        textField.leftView = leftImageView
        textField.leftViewMode = .always

        let rightImageView = UIImageView(
            image: UIImage(systemName: "xmark.circle.fill")
        )
        textField.rightView = rightImageView
        textField.rightViewMode = .whileEditing
        """
    }

    private static var secureEntry: String {
        """
        let textField = TextFieldUIView(
            theme: theme,
            intent: .neutral
        )
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        """
    }

    private static var readOnly: String {
        """
        let textField = TextFieldUIView(
            theme: theme,
            intent: .neutral
        )
        textField.placeholder = "Read only field"
        textField.isReadOnly = true
        """
    }

    private static var withClearButton: String {
        """
        let textField = TextFieldUIView(
            theme: theme,
            intent: .neutral
        )
        textField.placeholder = "Text with clear"
        textField.clearButtonMode = .whileEditing
        """
    }

    private static var disabled: String {
        """
        let textField = TextFieldUIView(
            theme: theme,
            intent: .neutral
        )
        textField.placeholder = "Disabled field"
        textField.isEnabled = false
        """
    }

    private static var fullConfiguration: String {
        """
        let textField = TextFieldUIView(
            theme: theme,
            intent: .success
        )
        textField.placeholder = "Full example"
        textField.isSecureTextEntry = false
        textField.isReadOnly = false
        textField.clearButtonMode = .whileEditing
        textField.isEnabled = true

        let leftImageView = UIImageView(
            image: UIImage(systemName: "magnifyingglass")
        )
        textField.leftView = leftImageView
        textField.leftViewMode = .always

        let rightImageView = UIImageView(
            image: UIImage(systemName: "xmark.circle.fill")
        )
        textField.rightView = rightImageView
        textField.rightViewMode = .whileEditing

        textField.accessibilityLabel = "Text field label"
        """
    }
}
