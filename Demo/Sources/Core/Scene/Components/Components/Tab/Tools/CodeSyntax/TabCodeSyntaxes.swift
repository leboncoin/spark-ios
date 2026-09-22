//
//  TabCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TabCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Text Only", code: Self.textOnly),
            .init(title: "Icons Only", code: Self.iconsOnly),
            .init(title: "With Extra View", code: Self.withExtraView),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var textOnly: String {
        """
        @State private var selection = 1

        SparkTab(selection: $selection) {
            SparkTabItem(tag: 1, text: "First")
            SparkTabItem(tag: 2, text: "Second")
            SparkTabItem(tag: 3, text: "Third")
        }
        .sparkTheme(theme)
        .sparkTabIntent(.main)
        .sparkTabSize(.medium)
        .sparkTabApportionsSegmentWidthsByContent(true)
        """
    }

    private static var iconsOnly: String {
        """
        @State private var selection = 1

        SparkTab(selection: $selection) {
            SparkTabItem(tag: 1, icon: Image(systemName: "house"))
            SparkTabItem(tag: 2, icon: Image(systemName: "star"))
            SparkTabItem(tag: 3, icon: Image(systemName: "person"))
        }
        .sparkTheme(theme)
        .sparkTabIntent(.main)
        .sparkTabSize(.medium)
        .sparkTabApportionsSegmentWidthsByContent(true)
        """
    }

    private static var withExtraView: String {
        """
        @State private var selection = 1

        SparkTab(selection: $selection) {
            SparkTabItem(tag: 1, text: "First", icon: Image(systemName: "house")) {
                Text("99+")
            }
            SparkTabItem(tag: 2, text: "Second", icon: Image(systemName: "star"))
            SparkTabItem(tag: 3, text: "Third", icon: Image(systemName: "person"))
        }
        .sparkTheme(theme)
        .sparkTabIntent(.main)
        .sparkTabSize(.medium)
        .sparkTabApportionsSegmentWidthsByContent(true)
        """
    }

    private static var fullConfiguration: String {
        """
        @State private var selection = 1

        SparkTab(selection: $selection) {
            SparkTabItem(tag: 1, text: "Home", icon: Image(systemName: "house")) {
                SparkBadge(value: 5)
                    .sparkTheme(theme)
                    .sparkBadgeIntent(.support)
                    .sparkBadgeSize(.medium)
                    .sparkBadgeIsBorder(false)
            }
            SparkTabItem(tag: 2, text: "Messages", icon: Image(systemName: "message"))
            SparkTabItem(tag: 3, text: "Profile", icon: Image(systemName: "person"))
        }
        .sparkTheme(theme)
        .sparkTabIntent(.main)
        .sparkTabSize(.medium)
        .sparkTabApportionsSegmentWidthsByContent(true)
        .disabled(false)
        """
    }
}
