//
//  MicroAnimationCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct MicroAnimationCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic - Play Once", code: Self.basicPlayOnce),
            .init(title: "Basic - With Delay", code: Self.basicWithDelay),
            .init(title: "Repeat - Limited", code: Self.repeatLimited),
            .init(title: "Repeat - Unlimited", code: Self.repeatUnlimited),
            .init(title: "With Completion", code: Self.withCompletion),
            .init(title: "Full Configuration", code: Self.fullConfiguration),
            .init(title: "Multiple Views", code: Self.multipleViews)
        ]
    }()

    // MARK: - Private Properties

    private static var basicPlayOnce: String {
        """
        @State private var isPlayed: Bool = false

        IconView(icon: .bellOutline)
            .animate(
                type: .bell,
                play: isPlayed
            )
        """
    }

    private static var basicWithDelay: String {
        """
        @State private var isPlayed: Bool = false

        IconView(icon: .bellOutline)
            .animate(
                type: .bell,
                play: isPlayed,
                delay: 0.5
            )
        """
    }

    private static var repeatLimited: String {
        """
        @State private var isPlayed: Bool = false

        SparkButton(
            "Notify",
            image: Image(icon: .bellOutline)
        ) {
            isPlayed = true
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.main)
        .animate(
            type: .bell,
            play: isPlayed,
            repeat: .limited(3)
        ) {
            isPlayed = false
        }
        """
    }

    private static var repeatUnlimited: String {
        """
        @State private var isPlayed: Bool = false

        SparkButton(
            "Alert",
            image: Image(icon: .bellOutline)
        ) {
            isPlayed = true
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.support)
        .animate(
            type: .bell,
            play: isPlayed,
            repeat: .unlimited
        )
        """
    }

    private static var withCompletion: String {
        """
        @State private var isPlayed: Bool = false
        @State private var animationCount: Int = 0

        IconView(icon: .bellOutline)
            .animate(
                type: .bell,
                play: isPlayed,
                repeat: .limited(2)
            ) {
                animationCount += 1
                isPlayed = false
            }
        """
    }

    private static var fullConfiguration: String {
        """
        @State private var isPlayed: Bool = false

        SparkButton(
            "Start",
            image: Image(icon: .bellOutline)
        ) {
            isPlayed = true
        }
        .sparkTheme(theme)
        .sparkButtonIntent(.main)
        .sparkButtonVariant(.filled)
        .sparkButtonSize(.medium)
        .animate(
            type: .bell,
            play: isPlayed,
            delay: 0.2,
            repeat: .limited(5)
        ) {
            isPlayed = false
        }
        """
    }

    private static var multipleViews: String {
        """
        @State private var isPlayed: Bool = false

        VStack(spacing: 20) {
            // Icon with animation
            IconView(icon: .bellOutline)
                .animate(
                    type: .bell,
                    play: isPlayed,
                    repeat: .limited(3)
                ) {
                    isPlayed = false
                }

            // Button with animated icon
            SparkButton(
                "Notify",
                image: Image(icon: .bellOutline)
            ) {
                isPlayed.toggle()
            }
            .sparkTheme(theme)
            .sparkButtonIntent(.support)
            .animate(
                type: .bell,
                play: isPlayed,
                delay: 0.1,
                repeat: .unlimited
            )

            // Control button
            Button("Start Animation") {
                isPlayed = true
            }
            .disabled(isPlayed)
        }
        """
    }
}
