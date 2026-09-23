//
//  MicroAnimationUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct MicroAnimationUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic - Single View", code: Self.basicSingleView),
            .init(title: "Basic - Multiple Views", code: Self.basicMultipleViews),
            .init(title: "With Delay", code: Self.withDelay),
            .init(title: "Repeat - Limited", code: Self.repeatLimited),
            .init(title: "Repeat - Unlimited", code: Self.repeatUnlimited),
            .init(title: "With Completion", code: Self.withCompletion),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var basicSingleView: String {
        """
        let iconView = SparkUIIcon(
            icon: .bellOutline,
            intent: .support,
            size: .medium
        )

        UIView.animate(
            type: .bell,
            on: iconView
        )
        """
    }

    private static var basicMultipleViews: String {
        """
        let iconView1 = SparkUIIcon(
            icon: .bellOutline,
            intent: .support,
            size: .medium
        )

        let iconView2 = SparkUIIcon(
            icon: .bellOutline,
            intent: .main,
            size: .large
        )

        UIView.animate(
            type: .bell,
            on: [iconView1, iconView2]
        )
        """
    }

    private static var withDelay: String {
        """
        let iconView = SparkUIIcon(
            icon: .bellOutline,
            intent: .support,
            size: .medium
        )

        UIView.animate(
            type: .bell,
            on: iconView,
            delay: 0.5
        )
        """
    }

    private static var repeatLimited: String {
        """
        let button = SparkUIButton(
            theme: theme,
            intent: .main,
            variant: .filled,
            size: .medium,
            shape: .rounded,
            alignment: .leadingImage
        )
        button.setTitle("Notify", for: .normal)
        button.setImage(.bellOutline, for: .normal)

        UIView.animate(
            type: .bell,
            on: button.imageView,
            repeat: .limited(3)
        )
        """
    }

    private static var repeatUnlimited: String {
        """
        let iconView = SparkUIIcon(
            icon: .bellOutline,
            intent: .support,
            size: .medium
        )

        UIView.animate(
            type: .bell,
            on: iconView,
            repeat: .unlimited
        )
        """
    }

    // swiftlint:disable no_debugging_method
    private static var withCompletion: String {
        """
        let iconView = SparkUIIcon(
            icon: .bellOutline,
            intent: .support,
            size: .medium
        )

        UIView.animate(
            type: .bell,
            on: iconView,
            repeat: .limited(2)
        ) { finished in
            // Your action
        }
        """
    }

    private static var fullConfiguration: String {
        """
        // Create animated components
        let iconView = SparkUIIcon(
            icon: .bellOutline,
            intent: .support,
            size: .medium
        )

        let button = SparkUIButton(
            theme: theme,
            intent: .main,
            variant: .filled,
            size: .medium,
            shape: .rounded,
            alignment: .leadingImage
        )
        button.setTitle("Alert", for: .normal)
        button.setImage(.bellOutline, for: .normal)

        // Apply bell animation with all parameters
        UIView.animate(
            type: .bell,
            on: [
                iconView,
                button.imageView
            ],
            delay: 0.3,
            repeat: .limited(5)
        ) { finished in
            // Your action
        }
        """
    }
}
