//
//  BorderUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BorderUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Simple Border + Radius", code: Self.simpleBorderRadius),
            .init(title: "Border with isHighlighted", code: Self.borderWithHighlight),
            .init(title: "Border with Dash", code: Self.borderWithDash),
            .init(title: "Corner Radius Only", code: Self.cornerRadiusOnly),
            .init(title: "Corner Radius with isHighlighted", code: Self.cornerRadiusWithHighlight),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var simpleBorderRadius: String {
        """
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.sparkBorderRadius(
            width: 2,
            radius: 8,
            colorToken: theme.colors.main.main
        )
        """
    }

    private static var borderWithHighlight: String {
        """
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.sparkBorderRadius(
            width: 2,
            radius: 8,
            isHighlighted: true,
            colorToken: theme.colors.main.main
        )
        """
    }

    private static var borderWithDash: String {
        """
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.sparkBorderRadius(
            width: 2,
            radius: 8,
            dash: 4,
            colorToken: theme.colors.main.main
        )
        """
    }

    private static var cornerRadiusOnly: String {
        """
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.sparkCornerRadius(12)
        """
    }

    private static var cornerRadiusWithHighlight: String {
        """
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.sparkCornerRadius(
            12,
            isHighlighted: true
        )
        """
    }

    private static var fullConfiguration: String {
        """
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.sparkBorderRadius(
            width: 4,
            radius: 12,
            dash: 8,
            colorToken: theme.colors.feedback.error,
            cornerCurve: .continuous,
            masksToBounds: true
        )
        """
    }
}
