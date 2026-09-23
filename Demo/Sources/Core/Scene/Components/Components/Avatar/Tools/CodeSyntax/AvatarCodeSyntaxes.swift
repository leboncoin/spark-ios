//
//  AvatarCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct AvatarCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "User Avatar with Image", code: Self.userAvatarWithImage),
            .init(title: "User Avatar with URL", code: Self.userAvatarWithURL),
            .init(title: "User Avatar with Corner Badge", code: Self.userAvatarWithCornerBadge),
            .init(title: "User Avatar with Action Button", code: Self.userAvatarWithActionButton),
            .init(title: "Company Avatar with Image", code: Self.companyAvatarWithImage),
            .init(title: "Company Avatar with URL", code: Self.companyAvatarWithURL),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var userAvatarWithImage: String {
        """
        SparkUserAvatar(
            image: Image("avatar"),
            placeholder: "Bob Doe"
        )
        .sparkTheme(theme)
        """
    }

    private static var userAvatarWithURL: String {
        """
        SparkUserAvatar(
            url: URL(string: "https://example.com/avatar.jpg")!,
            placeholder: "Bob Doe"
        )
        .sparkTheme(theme)
        """
    }

    private static var userAvatarWithCornerBadge: String {
        """
        SparkUserAvatar(
            image: Image("avatar"),
            placeholder: "Bob Doe"
        ) {
            SparkBadge(value: 5)
                .sparkBadgeIntent(.main)
        }
        .sparkTheme(theme)
        """
    }

    private static var userAvatarWithActionButton: String {
        """
        SparkUserAvatar(
            image: Image("avatar"),
            placeholder: "Bob Doe",
            action: {
                // Your Action
            }
        )
        .sparkTheme(theme)
        .sparkAvatarActionType(.edit)
        """
    }

    private static var companyAvatarWithImage: String {
        """
        SparkCompanyAvatar(
            image: Image("company_logo")
        )
            .sparkTheme(theme)
        """
    }

    private static var companyAvatarWithURL: String {
        """
        SparkCompanyAvatar(
            url: URL(string: "https://example.com/logo.jpg")!
        )
            .sparkTheme(theme)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkUserAvatar(
            url: URL(string: "https://example.com/avatar.jpg")!,
            placeholder: "Bob Doe"
        )
        .sparkTheme(theme)
        .sparkAvatarSize(.xl)
        .sparkAvatarActionType(.edit)
        .sparkAvatarIsBorder(true)
        .accessibilityLabel("User profile avatar")
        """
    }
}
