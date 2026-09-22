//
//  SnackbarCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SnackbarCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Title & Description", code: Self.titleAndDescription),
            .init(title: "With Icon", code: Self.withIcon),
            .init(title: "With Action Button", code: Self.withActionButton),
            .init(title: "Description Only", code: Self.descriptionOnly),
            .init(title: "Description with Button", code: Self.descriptionWithButton),
            .init(title: "Custom Title & Description", code: Self.customTitleAndDescription),
            .init(title: "Custom Description Only", code: Self.customDescriptionOnly),
            .init(title: "Custom Description with Button", code: Self.customDescriptionWithButton),
            .init(title: "Custom All with Button", code: Self.customAllWithButton)
        ]
    }()

    // MARK: - Private Properties

    private static var titleAndDescription: String {
        """
        VStack {
            Text("My content")
            Spacer()
        }
        .sparkSnackbar(
            title: "Upload complete",
            description: "Your file has been uploaded successfully",
            isPresented: self.$showSnackbar,
            autoDismissDelay: .default
        )
        .sparkTheme(self.theme)
        .sparkSnackbarIntent(.success)
        """
    }

    private static var withIcon: String {
        """
        VStack {
            Text("My content")
            Spacer()
        }
        .sparkSnackbar(
            Image(systemName: "checkmark.circle"),
            title: "Email sent",
            description: "Your message was sent successfully",
            isPresented: self.$showSnackbar,
            autoDismissDelay: .default
        )
        .sparkTheme(self.theme)
        .sparkSnackbarIntent(.success)
        """
    }

    private static var withActionButton: String {
        """
        VStack {
            Text("My content")
            Spacer()
        }
        .sparkSnackbar(
            Image(systemName: "envelope.fill"),
            title: "Email sent",
            description: "Your message was sent successfully",
            isPresented: self.$showSnackbar,
            autoDismissDelay: .default,
            button: {
                SparkButton("View") {
                    // View action
                }
                .sparkButtonVariant(.ghost)
            }
        )
        .sparkTheme(self.theme)
        .sparkSnackbarIntent(.success)
        """
    }

    private static var descriptionOnly: String {
        """
        VStack {
            Text("My content")
            Spacer()
        }
        .sparkSnackbar(
            Image(systemName: "checkmark.circle"),
            description: "File saved successfully",
            isPresented: self.$showSnackbar,
            autoDismissDelay: .default
        )
        .sparkTheme(self.theme)
        .sparkSnackbarIntent(.success)
        """
    }

    private static var descriptionWithButton: String {
        """
        VStack {
            Text("My content")
            Spacer()
        }
        .sparkSnackbar(
            Image(systemName: "trash"),
            description: "Item deleted",
            isPresented: self.$showSnackbar,
            autoDismissDelay: .default,
            button: {
                SparkButton("Undo") {
                    // Undo action
                }
                .sparkButtonVariant(.ghost)
            }
        )
        .sparkTheme(self.theme)
        .sparkSnackbarIntent(.alert)
        """
    }

    private static var customTitleAndDescription: String {
        """
        VStack {
            Text("My content")
            Spacer()
        }
        .sparkSnackbar(
            Image(systemName: "bell.fill"),
            isPresented: self.$showSnackbar,
            autoDismissDelay: .default,
            titleLabel: {
                Text("New Message")
                    .bold()
            },
            descriptionLabel: {
                VStack(alignment: .leading) {
                    Text("John Doe")
                    Text("Hello, how are you?")
                }
            }
        )
        .sparkTheme(self.theme)
        .sparkSnackbarIntent(.info)
        """
    }

    private static var customDescriptionOnly: String {
        """
        VStack {
            Text("My content")
            Spacer()
        }
        .sparkSnackbar(
            Image(systemName: "info.circle"),
            isPresented: self.$showSnackbar,
            autoDismissDelay: .default,
            descriptionLabel: {
                VStack(alignment: .leading, spacing: 4) {
                    Text("System update available")
                    Text("Version 2.0.1")
                        .font(.caption)
                }
            }
        )
        .sparkTheme(self.theme)
        .sparkSnackbarIntent(.info)
        """
    }

    private static var customDescriptionWithButton: String {
        """
        VStack {
            Text("My content")
            Spacer()
        }
        .sparkSnackbar(
            Image(systemName: "photo"),
            isPresented: self.$showSnackbar,
            autoDismissDelay: .default,
            descriptionLabel: {
                HStack {
                    Text("Photo uploaded")
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                }
            },
            button: {
                SparkButton("View") {
                    // View action
                }
                .sparkButtonVariant(.ghost)
            }
        )
        .sparkTheme(self.theme)
        .sparkSnackbarIntent(.success)
        """
    }

    private static var customAllWithButton: String {
        """
        VStack {
            Text("My content")
            Spacer()
        }
        .sparkSnackbar(
            Image(systemName: "star.fill"),
            isPresented: self.$showSnackbar,
            autoDismissDelay: .default,
            titleLabel: {
                Text("Achievement Unlocked")
                    .bold()
            },
            descriptionLabel: {
                VStack(alignment: .leading) {
                    Text("Level 10 reached!")
                    Text("Keep up the great work")
                }
            },
            button: {
                SparkButton("View") {
                    // View action
                }
                .sparkButtonVariant(.ghost)
            }
        )
        .sparkTheme(self.theme)
        .sparkSnackbarIntent(.success)
        """
    }
}
