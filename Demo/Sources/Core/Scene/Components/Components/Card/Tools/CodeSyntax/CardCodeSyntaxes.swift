//
//  CardCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CardCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Simple Content", code: Self.simpleContent),
            .init(title: "With Action", code: Self.withAction),
            .init(title: "With Backdrop", code: Self.withBackdrop),
            .init(title: "Highlighted Style", code: Self.highlightedStyle),
            .init(title: "No Padding", code: Self.noPadding),
            .init(title: "Different Variants", code: Self.differentVariants),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var simpleContent: String {
        """
        SparkCard(
            content: {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Welcome on Card")
                        .font(.headline)
                    Text("This is the description of the card.")
                        .font(.body)
                }
            }
        )
        .sparkTheme(theme)
        .sparkCardIntent(.main)
        .sparkCardVariant(.filled)
        """
    }

    // swiftlint:disable no_debugging_method
    private static var withAction: String {
        """
        SparkCard(
            content: {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "info.circle")
                        Text("Welcome on Card")
                    }

                    Text("Nam eu sapien finibus, auctor purusan varius, sagittis turpis. Sed ipsum elit, lacinia id porta ut, bibendum at risus.")
                        .multilineTextAlignment(.leading)
                }
            },
            action: {
                // Your action
            }
        )
        .sparkTheme(theme)
        .sparkCardIntent(.support)
        .sparkCardVariant(.filled)
        """
    }

    private static var withBackdrop: String {
        """
        SparkCard(
            content: {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Card with Backdrop")
                        .font(.headline)
                    Text("The backdrop appears at the top of the card.")
                        .font(.body)
                }
            }
        )
        .sparkTheme(theme)
        .sparkCardIntent(.main)
        .sparkCardVariant(.tinted)
        .sparkCardIsBackdrop(true)
        """
    }

    private static var highlightedStyle: String {
        """
        SparkCard(
            content: {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Highlighted Card")
                        .font(.headline)
                    Text("This card has a highlighted style with different corner radius.")
                        .font(.body)
                }
            }
        )
        .sparkTheme(theme)
        .sparkCardIntent(.success)
        .sparkCardVariant(.outlined)
        .sparkCardIsHighlighted(true)
        """
    }

    private static var noPadding: String {
        """
        SparkCard(
            content: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
            }
        )
        .sparkTheme(theme)
        .sparkCardIntent(.main)
        .sparkCardVariant(.filled)
        .sparkCardIsPadding(false)
        """
    }

    private static var differentVariants: String {
        """
        VStack(spacing: 16) {
            // Filled variant
            SparkCard(content: { Text("Filled variant") })
                .sparkTheme(theme)
                .sparkCardIntent(.main)
                .sparkCardVariant(.filled)

            // Outlined variant
            SparkCard(content: { Text("Outlined variant") })
                .sparkTheme(theme)
                .sparkCardIntent(.support)
                .sparkCardVariant(.outlined)

            // Tinted variant
            SparkCard(content: { Text("Tinted variant") })
                .sparkTheme(theme)
                .sparkCardIntent(.success)
                .sparkCardVariant(.tinted)
        }
        """
    }

    private static var fullConfiguration: String {
        """
        SparkCard(
            content: {
                VStack(alignment: .leading, spacing: 16) {
                    SparkTag(
                        theme: theme,
                        intent: .main,
                        variant: .filled,
                        text: "Featured"
                    )

                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            SparkIcon(
                                theme: theme,
                                intent: .main,
                                size: .medium,
                                iconImage: .spark
                            )

                            Text("Complete Card Example")
                        }

                        Text("Nam eu sapien finibus, auctor purusan varius, sagittis turpis. Sed ipsum elit, lacinia id porta ut, bibendum at risus.")
                            .multilineTextAlignment(.leading)
                    }

                    SparkButton("Take Action") {
                        // Button action
                    }
                    .sparkTheme(theme)
                    .sparkButtonIntent(.main)
                    .sparkButtonVariant(.filled)
                    .sparkButtonSize(.medium)
                }
            },
            action: {
                // Your action
            }
        )
        .sparkTheme(theme)
        .sparkCardIntent(.main)
        .sparkCardVariant(.tinted)
        .sparkCardIsBackdrop(true)
        .sparkCardIsHighlighted(true)
        .sparkCardIsPadding(true)
        .disabled(false)
        .accessibilityLabel("Complete card example")
        .accessibilityHidden(false)
        """
    }
}
