//
//  CornerRadiusCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CornerRadiusCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Simple Corner Radius", code: Self.simpleCornerRadius),
            .init(title: "Corner Radius with isHighlighted", code: Self.cornerRadiusWithHighlight),
            .init(title: "Corner Radius without Scaling", code: Self.cornerRadiusWithoutScaling),
            .init(title: "Uneven Corners", code: Self.unevenCorners),
            .init(title: "Top & Bottom Radius", code: Self.topBottomRadius),
            .init(title: "Leading & Trailing Radius", code: Self.leadingTrailingRadius),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var simpleCornerRadius: String {
        """
        Rectangle()
            .fill(Color.blue)
            .sparkCornerRadius(12)
            .sparkTheme(theme)
        """
    }

    private static var cornerRadiusWithHighlight: String {
        """
        Rectangle()
            .fill(Color.blue)
            .sparkCornerRadius(
                12,
                isHighlighted: true
            )
            .sparkTheme(theme)
        """
    }

    private static var cornerRadiusWithoutScaling: String {
        """
        Rectangle()
            .fill(Color.blue)
            .sparkCornerRadius(
                12,
                isScaled: false
            )
            .sparkTheme(theme)
        """
    }

    private static var unevenCorners: String {
        """
        Rectangle()
            .fill(Color.blue)
            .sparkCornerRadius(
                topLeading: 24,
                topTrailing: 16,
                bottomTrailing: 8,
                bottomLeading: 4
            )
            .sparkTheme(theme)
        """
    }

    private static var topBottomRadius: String {
        """
        Rectangle()
            .fill(Color.blue)
            .sparkCornerRadius(
                top: 16,
                bottom: 8
            )
            .sparkTheme(theme)
        """
    }

    private static var leadingTrailingRadius: String {
        """
        Rectangle()
            .fill(Color.blue)
            .sparkCornerRadius(
                leading: 8,
                trailing: 16
            )
            .sparkTheme(theme)
        """
    }

    private static var fullConfiguration: String {
        """
        Rectangle()
            .fill(Color.blue)
            .sparkCornerRadius(
                topLeading: 24,
                topTrailing: 16,
                bottomTrailing: 8,
                bottomLeading: 4,
                isHighlighted: true,
                isScaled: true
            )
            .sparkTheme(theme)
        """
    }
}
