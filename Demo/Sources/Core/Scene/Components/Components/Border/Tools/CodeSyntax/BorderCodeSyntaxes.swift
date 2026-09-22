//
//  BorderCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BorderCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Simple Border", code: Self.simpleBorder),
            .init(title: "Border with Dash", code: Self.borderWithDash),
            .init(title: "Border with Position", code: Self.borderWithPosition),
            .init(title: "Border without Scaling", code: Self.borderWithoutScaling),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var simpleBorder: String {
        """
        Rectangle()
            .fill(.background)
            .frame(height: 48)
            .sparkBorder(
                width: 2,
                colorToken: theme.colors.main.main
            )
        """
    }

    private static var borderWithDash: String {
        """
        Rectangle()
            .fill(.background)
            .frame(height: 48)
            .sparkBorder(
                width: 2,
                dash: 4,
                colorToken: theme.colors.main.main
            )
        """
    }

    private static var borderWithPosition: String {
        """
        Rectangle()
            .fill(.background)
            .frame(height: 48)
            .sparkBorder(
                width: 2,
                colorToken: theme.colors.main.main,
                position: .inside
            )
        """
    }

    private static var borderWithoutScaling: String {
        """
        Rectangle()
            .fill(.background)
            .frame(height: 48)
            .sparkBorder(
                width: 2,
                colorToken: theme.colors.main.main,
                isScaled: false
            )
        """
    }

    private static var fullConfiguration: String {
        """
        Rectangle()
            .fill(.background)
            .frame(height: 48)
            .sparkBorder(
                width: 4,
                dash: 8,
                colorToken: theme.colors.feedback.error,
                position: .outside,
                isScaled: true
            )
        """
    }
}
