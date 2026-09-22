//
//  AdaptativeStackUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct AdaptativeStackUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic Horizontal", code: Self.basicHorizontal),
            .init(title: "Basic Vertical", code: Self.basicVertical),
            .init(title: "With Regular Properties", code: Self.withRegularProperties),
            .init(title: "With Accessibility Properties", code: Self.withAccessibilityProperties),
            .init(title: "With Size Class", code: Self.withSizeClass),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var basicHorizontal: String {
        """
        let label1 = UILabel()
        label1.text = "First"

        let label2 = UILabel()
        label2.text = "Second"

        let label3 = UILabel()
        label3.text = "Third"

        let stackView = SparkAdaptiveUIStackView(
            arrangedSubviews: [label1, label2, label3]
        )
        stackView.regularAxis = .horizontal
        stackView.regularSpacing = 8
        """
    }

    private static var basicVertical: String {
        """
        let label1 = UILabel()
        label1.text = "First"

        let label2 = UILabel()
        label2.text = "Second"

        let label3 = UILabel()
        label3.text = "Third"

        let stackView = SparkAdaptiveUIStackView(
            arrangedSubviews: [label1, label2, label3]
        )
        stackView.regularAxis = .vertical
        stackView.regularSpacing = 8
        """
    }

    private static var withRegularProperties: String {
        """
        let label1 = UILabel()
        label1.text = "Home"

        let label2 = UILabel()
        label2.text = "Messages"

        let label3 = UILabel()
        label3.text = "Profile"

        let stackView = SparkAdaptiveUIStackView(
            arrangedSubviews: [label1, label2, label3]
        )
        stackView.regularAxis = .horizontal
        stackView.regularDistribution = .fill
        stackView.regularAlignment = .center
        stackView.regularSpacing = 16
        """
    }

    private static var withAccessibilityProperties: String {
        """
        let label1 = UILabel()
        label1.text = "Home"

        let label2 = UILabel()
        label2.text = "Messages"

        let label3 = UILabel()
        label3.text = "Profile"

        let stackView = SparkAdaptiveUIStackView(
            arrangedSubviews: [label1, label2, label3]
        )
        stackView.regularAxis = .horizontal
        stackView.regularSpacing = 16
        stackView.accessibilityAxis = .vertical
        stackView.accessibilityDistribution = .fill
        stackView.accessibilityAlignment = .leading
        stackView.accessibilitySpacing = 8
        """
    }

    private static var withSizeClass: String {
        """
        let label1 = UILabel()
        label1.text = "Hello"

        let label2 = UILabel()
        label2.text = "Bye"

        let stackView = SparkAdaptiveUIStackView(
            arrangedSubviews: [label1, label2]
        )
        stackView.regularAxis = .horizontal
        stackView.regularSpacing = 8
        stackView.accessibilityAxis = .vertical
        stackView.accessibilitySpacing = 16
        stackView.accessibilityInterfaceSizeClass = .compact
        """
    }

    private static var fullConfiguration: String {
        """
        let label1 = UILabel()
        label1.text = "Home"

        let label2 = UILabel()
        label2.text = "Messages"

        let label3 = UILabel()
        label3.text = "Profile"

        let stackView = SparkAdaptiveUIStackView(
            arrangedSubviews: [label1, label2, label3]
        )
        stackView.regularAxis = .horizontal
        stackView.regularDistribution = .fill
        stackView.regularAlignment = .center
        stackView.regularSpacing = 16
        stackView.accessibilityAxis = .vertical
        stackView.accessibilityDistribution = .fill
        stackView.accessibilityAlignment = .leading
        stackView.accessibilitySpacing = 8
        stackView.accessibilityInterfaceSizeClass = .compact
        """
    }
}
