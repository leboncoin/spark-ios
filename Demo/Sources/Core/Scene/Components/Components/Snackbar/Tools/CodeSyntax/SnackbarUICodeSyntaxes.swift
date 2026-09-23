//
//  SnackbarUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SnackbarUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic Snackbar", code: Self.basicSnackbar),
            .init(title: "With Icon", code: Self.withIcon),
            .init(title: "With Action Button", code: Self.withActionButton),
            .init(title: "Different Alignment", code: Self.differentAlignment)
        ]
    }()

    // MARK: - Private Properties

    private static var basicSnackbar: String {
        """
        let snackbar = SparkUISnackbar(theme: theme)
        snackbar.title = "Upload complete"
        snackbar.message = "Your file has been uploaded successfully"
        snackbar.intent = .success
        view.addSubview(snackbar)
        """
    }

    private static var withIcon: String {
        """
        let snackbar = SparkUISnackbar(theme: theme)
        snackbar.icon = UIImage(systemName: "wifi.slash")
        snackbar.title = "Connection lost"
        snackbar.message = "Unable to reach the server"
        snackbar.intent = .error
        view.addSubview(snackbar)
        """
    }

    private static var withActionButton: String {
        """
        let snackbar = SparkUISnackbar(theme: theme)
        snackbar.icon = UIImage(systemName: "trash")
        snackbar.title = "Item deleted"
        snackbar.message = "The item has been removed"
        snackbar.intent = .alert

        let button = SparkUIButton(theme: theme)
        button.setTitle("Undo", for: .normal)
        button.variant = .ghost
        button.addAction(UIAction { _ in
            // Undo action
        }, for: .touchUpInside)
        snackbar.button = button

        view.addSubview(snackbar)
        """
    }

    private static var differentAlignment: String {
        """
        let snackbar = SparkUISnackbar(theme: theme)
        snackbar.title = "Settings saved"
        snackbar.message = "Your preferences have been updated"
        snackbar.intent = .success
        snackbar.alignment = .vertical
        view.addSubview(snackbar)
        """
    }
}
