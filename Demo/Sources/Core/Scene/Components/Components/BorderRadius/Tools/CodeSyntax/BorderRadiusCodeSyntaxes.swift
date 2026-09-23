//
//  BorderRadiusCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BorderRadiusCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Simple Border + Radius", code: Self.simpleBorderRadius),
            .init(title: "Border with Dash", code: Self.borderWithDash),
            .init(title: "Border with isHighlighted", code: Self.borderWithHighlight),
            .init(title: "Border with Position", code: Self.borderWithPosition),
            .init(title: "Uneven Corners", code: Self.unevenCorners),
            .init(title: "Top & Bottom Radius", code: Self.topBottomRadius),
            .init(title: "Leading & Trailing Radius", code: Self.leadingTrailingRadius),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var simpleBorderRadius: String {
        """
        Rectangle()
            .fill(theme.colors.support.supportVariant.color)
            .sparkBorder(
                width: theme.border.width.medium,
                radius: theme.border.radius.medium,
                colorToken: theme.colors.main.main
            )
        """
    }

    private static var borderWithDash: String {
        """
        Rectangle()
            .fill(theme.colors.support.supportVariant.color)
            .sparkBorder(
                width: theme.border.width.medium,
                radius: theme.border.radius.medium,
                dash: 4,
                colorToken: theme.colors.main.main
            )
        """
    }

    private static var borderWithHighlight: String {
        """
        Rectangle()
            .fill(theme.colors.support.supportVariant.color)
            .sparkBorder(
                width: theme.border.width.medium,
                radius: theme.border.radius.medium,
                isHighlighted: true,
                colorToken: theme.colors.main.main
            )
        """
    }

    private static var borderWithPosition: String {
        """
        Rectangle()
            .fill(theme.colors.support.supportVariant.color)
            .sparkBorder(
                width: theme.border.width.medium,
                radius: theme.border.radius.medium,
                colorToken: theme.colors.main.main,
                position: .inside
            )
        """
    }

    private static var unevenCorners: String {
        """
        Rectangle()
            .fill(theme.colors.support.supportVariant.color)
            .sparkBorder(
                width: theme.border.width.medium,
                topLeadingRadius: 8,
                topTrailingRadius: 16,
                bottomTrailingRadius: 8,
                bottomLeadingRadius: 16,
                colorToken: theme.colors.main.main
            )
        """
    }

    private static var topBottomRadius: String {
        """
        Rectangle()
            .fill(theme.colors.support.supportVariant.color)
            .sparkBorder(
                width: theme.border.width.medium,
                topRadius: 16,
                bottomRadius: 8,
                colorToken: theme.colors.main.main
            )
        """
    }

    private static var leadingTrailingRadius: String {
        """
        Rectangle()
            .fill(theme.colors.support.supportVariant.color)
            .sparkBorder(
                width: theme.border.width.medium,
                leadingRadius: 8,
                trailingRadius: 16,
                colorToken: theme.colors.main.main
            )
        """
    }

    private static var fullConfiguration: String {
        """
        Rectangle()
            .fill(theme.colors.support.supportVariant.color)
            .sparkBorder(
                width: theme.border.width.medium,
                radius: theme.border.radius.medium,
                dash: 4,
                isHighlighted: true,
                colorToken: theme.colors.main.main,
                position: .outside,
                isScaled: true
            )
        """
    }
}
