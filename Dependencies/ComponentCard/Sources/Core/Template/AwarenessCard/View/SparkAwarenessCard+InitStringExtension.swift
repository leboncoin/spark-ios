//
//  SparkAwarenessCard+InitStringExtension.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkAwarenessCard {

    // MARK: Title Only

    /// Creates an awareness card with only a title as string.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - title: The title text of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "info.circle"),
    ///     title: "System Update Available"
    /// )
    /// .sparkTheme(theme)
    /// .sparkCardIntent(.info)
    /// ```
    ///
    /// ## Rendering
    ///
    ///  ![Classic](awareness_card_classic.png)
    ///
    init(
        icon: Image? = nil,
        title: String
    ) where TitleLabel == Text, DescriptionLabel == EmptyView, ActionLabel == EmptyView {
        self.init(
            icon: icon,
            titleLabel: { Text(title) },
            descriptionLabel: { EmptyView() },
            actionLabel: { EmptyView() }
        )
    }

    /// Creates an awareness card with a title as string and action.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - title: The title text of the awareness card.
    ///   - actionLabel: The action label of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "exclamationmark.triangle"),
    ///     title: "Action Required",
    ///     actionLabel: {
    ///         SparkTextLink("Take Action") {
    ///             // Handle action
    ///         }
    ///     }
    /// )
    /// .sparkTheme(theme)
    /// .sparkCardIntent(.alert)
    /// ```
    ///
    /// ## Rendering
    ///
    ///  ![Classic](awareness_card_classic.png)
    ///
    init(
        icon: Image? = nil,
        title: String,
        @ViewBuilder actionLabel: @escaping () -> ActionLabel
    ) where TitleLabel == Text, DescriptionLabel == EmptyView {
        self.init(
            icon: icon,
            titleLabel: { Text(title) },
            descriptionLabel: { EmptyView() },
            actionLabel: actionLabel
        )
    }

    // MARK: Description Only

    /// Creates an awareness card with only a description as string.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - description: The description text of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "info.circle"),
    ///     description: "Your data is being synchronized. This may take a few moments."
    /// )
    /// .sparkTheme(theme)
    /// .sparkCardIntent(.info)
    /// ```
    ///
    /// ## Rendering
    ///
    ///  ![Classic](awareness_card_classic.png)
    ///
    init(
        icon: Image? = nil,
        description: String
    ) where TitleLabel == EmptyView, DescriptionLabel == Text, ActionLabel == EmptyView {
        self.init(
            icon: icon,
            titleLabel: { EmptyView() },
            descriptionLabel: { Text(description) },
            actionLabel: { EmptyView() }
        )
    }

    /// Creates an awareness card with a description as string and action.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - description: The description text of the awareness card.
    ///   - actionLabel: The action label of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "exclamationmark.triangle"),
    ///     description: "Your session will expire soon. Please save your work.",
    ///     actionLabel: {
    ///         SparkTextLink("Extend Session") {
    ///             // Handle action
    ///         }
    ///     }
    /// )
    /// .sparkTheme(theme)
    /// .sparkCardIntent(.alert)
    /// ```
    ///
    /// ## Rendering
    ///
    ///  ![Classic](awareness_card_classic.png)
    ///
    init(
        icon: Image? = nil,
        description: String,
        @ViewBuilder actionLabel: @escaping () -> ActionLabel
    ) where TitleLabel == EmptyView, DescriptionLabel == Text {
        self.init(
            icon: icon,
            titleLabel: { EmptyView() },
            descriptionLabel: { Text(description) },
            actionLabel: actionLabel
        )
    }

    // MARK: Title and Description

    /// Creates an awareness card with a title and description as strings.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - title: The title text of the awareness card.
    ///   - description: The description text of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "lightbulb"),
    ///     title: "Pro Tip",
    ///     description: "Use keyboard shortcuts to speed up your workflow."
    /// )
    /// .sparkTheme(theme)
    /// .sparkCardIntent(.support)
    /// ```
    ///
    /// ## Rendering
    ///
    ///  ![Classic](awareness_card_classic.png)
    ///
    init(
        icon: Image? = nil,
        title: String,
        description: String
    ) where TitleLabel == Text, DescriptionLabel == Text, ActionLabel == EmptyView {
        self.init(
            icon: icon,
            titleLabel: { Text(title) },
            descriptionLabel: { Text(description) },
            actionLabel: { EmptyView() }
        )
    }

    /// Creates an awareness card with a title and description as strings and action.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - title: The title text of the awareness card.
    ///   - description: The description text of the awareness card.
    ///   - actionLabel: The action label of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "star"),
    ///     title: "Premium Feature",
    ///     description: "Upgrade to unlock advanced features and analytics.",
    ///     actionLabel: {
    ///         SparkButton("Upgrade") {
    ///             // Handle action
    ///         }
    ///     }
    /// )
    /// .sparkTheme(theme)
    /// .sparkCardIntent(.accent)
    /// ```
    ///
    /// ## Rendering
    ///
    ///  ![Classic](awareness_card_classic.png)
    ///
    init(
        icon: Image? = nil,
        title: String,
        description: String,
        @ViewBuilder actionLabel: @escaping () -> ActionLabel
    ) where TitleLabel == Text, DescriptionLabel == Text {
        self.init(
            icon: icon,
            titleLabel: { Text(title) },
            descriptionLabel: { Text(description) },
            actionLabel: actionLabel
        )
    }

}
