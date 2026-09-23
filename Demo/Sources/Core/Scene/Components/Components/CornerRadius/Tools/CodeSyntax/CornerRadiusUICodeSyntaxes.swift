//
//  CornerRadiusUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CornerRadiusUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Simple Corner Radius", code: Self.simpleCornerRadius),
            .init(title: "Corner Radius with isHighlighted", code: Self.cornerRadiusWithHighlight),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var simpleCornerRadius: String {
        """
        let view = UIView()
        view.backgroundColor = .blue
        view.sparkCornerRadius(theme.border.radius.medium)
        """
    }

    private static var cornerRadiusWithHighlight: String {
        """
        let view = UIView()
        view.backgroundColor = .blue
        view.sparkCornerRadius(
            theme.border.radius.medium,
            isHighlighted: true
        )
        """
    }

    private static var fullConfiguration: String {
        """
        let view = UIView()
        view.backgroundColor = .blue
        view.sparkCornerRadius(
            theme.border.radius.large,
            isHighlighted: true,
            cornerCurve: .continuous
        )
        """
    }
}
