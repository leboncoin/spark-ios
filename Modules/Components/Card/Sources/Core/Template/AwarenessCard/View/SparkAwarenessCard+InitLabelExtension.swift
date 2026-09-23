//
//  SparkAwarenessCard+InitLabelExtension.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkAwarenessCard {

    // MARK: Title Only

    /// Creates an awareness card with only a title.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - titleLabel: The title label of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "info.circle"),
    ///     titleLabel: {
    ///         Text("System Update Available")
    ///             .fontWeight(.semibold)
    ///     }
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
        @ViewBuilder titleLabel: @escaping () -> TitleLabel
    ) where DescriptionLabel == EmptyView, ActionLabel == EmptyView {
        self.init(
            icon: icon,
            titleLabel: titleLabel,
            descriptionLabel: { EmptyView() },
            actionLabel: { EmptyView() }
        )
    }

    /// Creates an awareness card with a title and action.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - titleLabel: The title label of the awareness card.
    ///   - actionLabel: The action label of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "exclamationmark.triangle"),
    ///     titleLabel: {
    ///         Text("Action Required")
    ///     },
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
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder actionLabel: @escaping () -> ActionLabel
    ) where DescriptionLabel == EmptyView {
        self.init(
            icon: icon,
            titleLabel: titleLabel,
            descriptionLabel: { EmptyView() },
            actionLabel: actionLabel
        )
    }

    // MARK: Description Only

    /// Creates an awareness card with only a description.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - descriptionLabel: The description label of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "info.circle"),
    ///     descriptionLabel: {
    ///         Text("Your data is being synchronized. This may take a few moments.")
    ///             .font(.body)
    ///     }
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
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel
    ) where TitleLabel == EmptyView, ActionLabel == EmptyView {
        self.init(
            icon: icon,
            titleLabel: { EmptyView() },
            descriptionLabel: descriptionLabel,
            actionLabel: { EmptyView() }
        )
    }

    /// Creates an awareness card with a description and action.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - descriptionLabel: The description label of the awareness card.
    ///   - actionLabel: The action label of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "exclamationmark.triangle"),
    ///     descriptionLabel: {
    ///         Text("Your session will expire soon. Please save your work.")
    ///     },
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
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel,
        @ViewBuilder actionLabel: @escaping () -> ActionLabel
    ) where TitleLabel == EmptyView {
        self.init(
            icon: icon,
            titleLabel: { EmptyView() },
            descriptionLabel: descriptionLabel,
            actionLabel: actionLabel
        )
    }

    // MARK: Title and Description

    /// Creates an awareness card with a title and description.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - titleLabel: The title label of the awareness card.
    ///   - descriptionLabel: The description label of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "lightbulb"),
    ///     titleLabel: {
    ///         Text("Pro Tip")
    ///             .fontWeight(.bold)
    ///     },
    ///     descriptionLabel: {
    ///         Text("Use keyboard shortcuts to speed up your workflow.")
    ///     }
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
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel
    ) where ActionLabel == EmptyView {
        self.init(
            icon: icon,
            titleLabel: titleLabel,
            descriptionLabel: descriptionLabel,
            actionLabel: { EmptyView() }
        )
    }
}
