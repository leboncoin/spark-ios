//
//  SparkButton+InitMenuExtension.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 16/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkButton {

    // MARK: - Initialization

    /// Creates a menu button with a text label.
    ///
    /// This initializer creates a button that displays a menu with a list of menu items when tapped,
    /// similar to the native SwiftUI Menu component.
    ///
    /// - Parameters:
    ///   - title: The text label to display on the menu button.
    ///   - content: A view builder that creates the menu content (a list of buttons).
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton("Options") {
    ///     Button("Edit") { }
    ///     Button("Delete") { }
    ///     Button("Share") { }
    /// }
    /// .sparkTheme(self.theme)
    /// .sparkButtonIntent(.main)
    /// ```
    ///
    init(
        _ title: String,
        @ViewBuilder content: @escaping () -> Content
    ) where Label == Text, ImageLabel == EmptyView {
        self.init(
            type: .button,
            label: { Text(title) },
            image: { EmptyView() },
            content: content
        )
    }

    /// Creates a menu button with a text label and an icon.
    ///
    /// This initializer creates a button that displays a menu with a list of menu items when tapped,
    /// similar to the native SwiftUI Menu component.
    ///
    /// - Parameters:
    ///   - title: The text label to display on the menu button.
    ///   - image: The icon image to display alongside the text.
    ///   - content: A view builder that creates the menu content (a list of buttons).
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(
    ///     "Actions",
    ///     image: Image(systemName: "ellipsis.circle")
    /// ) {
    ///     Button("Edit") { }
    ///     Button("Delete") { }
    ///     Button("Share") { }
    /// }
    /// .sparkTheme(self.theme)
    /// .sparkButtonIntent(.support)
    /// .sparkButtonAlignment(.leadingImage)
    /// ```
    ///
    init(
        _ title: String,
        image: Image,
        @ViewBuilder content: @escaping () -> Content
    ) where Label == Text, ImageLabel == SparkButtonImage {
        self.init(
            type: .button,
            label: { Text(title) },
            image: { SparkButtonImage(image: image) },
            content: content
        )
    }

    /// Creates an icon-only menu button.
    ///
    /// This initializer creates a button that displays a menu with a list of menu items when tapped,
    /// similar to the native SwiftUI Menu component.
    ///
    /// - Parameters:
    ///   - image: The icon image to display.
    ///   - content: A view builder that creates the menu content (a list of buttons).
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(Image(systemName: "ellipsis")) {
    ///     Button("Edit") { }
    ///     Button("Delete") { }
    ///     Button("Share") { }
    /// }
    /// .sparkTheme(self.theme)
    /// .sparkButtonIntent(.support)
    /// .sparkButtonSize(.small)
    /// ```
    ///
    init(
        _ image: Image,
        @ViewBuilder content: @escaping () -> Content
    ) where Label == EmptyView, ImageLabel == SparkButtonImage {
        self.init(
            type: .iconButton,
            label: { EmptyView() },
            image: { SparkButtonImage(image: image) },
            content: content
        )
    }

    /// Creates a menu button with a custom label.
    ///
    /// Use this initializer when you need complete control over the menu button's label content.
    /// This initializer creates a button that displays a menu with a list of menu items when tapped,
    /// similar to the native SwiftUI Menu component.
    ///
    /// - Parameters:
    ///   - content: A view builder that creates the menu content (a list of buttons).
    ///   - label: A view builder that creates the button's label.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(
    ///     content: {
    ///         Button("Edit") { }
    ///         Button("Delete") { }
    ///     },
    ///     label: {
    ///         VStack {
    ///             Text("Custom")
    ///             Text("Menu")
    ///         }
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    init(
        @ViewBuilder content: @escaping () -> Content,
        label: @escaping () -> Label
    ) where ImageLabel == EmptyView {
        self.init(
            type: .button,
            label: label,
            image: { EmptyView() },
            content: content
        )
    }

    /// Creates a menu button with a custom label and an icon.
    ///
    /// Use this initializer when you need a custom label alongside an icon.
    /// This initializer creates a button that displays a menu with a list of menu items when tapped,
    /// similar to the native SwiftUI Menu component.
    ///
    /// - Parameters:
    ///   - image: The icon image to display alongside the label.
    ///   - content: A view builder that creates the menu content (a list of buttons).
    ///   - label: A view builder that creates the button's label.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(
    ///     Image(systemName: "star.fill"),
    ///     content: {
    ///         Button("Rate 5 stars") { }
    ///         Button("Rate 4 stars") { }
    ///         Button("Rate 3 stars") { }
    ///     },
    ///     label: {
    ///         VStack {
    ///             Text("Rate")
    ///             Text("this item")
    ///         }
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    init(
        _ image: Image,
        @ViewBuilder content: @escaping () -> Content,
        label: @escaping () -> Label
    ) where ImageLabel == SparkButtonImage {
        self.init(
            type: .button,
            label: label,
            image: { SparkButtonImage(image: image) },
            content: content
        )
    }

    /// Creates a menu button with a text label and a custom image view.
    ///
    /// Use this initializer when you need full control over the image rendering,
    /// such as applying custom animations or effects to the icon.
    /// This initializer creates a button that displays a menu with a list of menu items when tapped,
    /// similar to the native SwiftUI Menu component.
    ///
    /// - Parameters:
    ///   - title: The text label to display on the menu button.
    ///   - content: A view builder that creates the menu content (a list of buttons).
    ///   - image: A view builder that creates the custom image content.
    ///   Use the ``SparkButtonImage``  to implement the image.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(
    ///     "Notify",
    ///     content: {
    ///         Button("Enable") { }
    ///         Button("Disable") { }
    ///     },
    ///     image: {
    ///         SparkButtonImage(image: Image(systemName: "bell.fill"))
    ///             .scaleEffect(self.isAnimating ? 1.2 : 1.0)
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    init(
        _ title: String,
        @ViewBuilder content: @escaping () -> Content,
        image: @escaping () -> ImageLabel
    ) where Label == Text {
        self.init(
            type: .button,
            label: { Text(title) },
            image: image,
            content: content
        )
    }

    /// Creates an icon-only menu button with a custom image view.
    ///
    /// Use this initializer when you need full control over the image rendering,
    /// such as applying custom animations or effects to the icon.
    /// This initializer creates a button that displays a menu with a list of menu items when tapped,
    /// similar to the native SwiftUI Menu component.
    ///
    /// - Parameters:
    ///   - content: A view builder that creates the menu content (a list of buttons).
    ///   - image: A view builder that creates the custom image content.
    ///   Use the ``SparkButtonImage``  to implement the image.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(
    ///     content: {
    ///         Button("Edit") { }
    ///         Button("Delete") { }
    ///     },
    ///     image: {
    ///         SparkButtonImage(image: Image(systemName: "ellipsis"))
    ///             .rotationEffect(.degrees(self.rotation))
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    init(
        @ViewBuilder content: @escaping () -> Content,
        image: @escaping () -> ImageLabel
    ) where Label == EmptyView {
        self.init(
            type: .iconButton,
            label: { EmptyView() },
            image: image,
            content: content
        )
    }

    /// Creates a menu button with a custom label and a custom image view.
    ///
    /// Use this initializer when you need full control over both the label and image rendering,
    /// such as applying custom animations or effects.
    /// This initializer creates a button that displays a menu with a list of menu items when tapped,
    /// similar to the native SwiftUI Menu component.
    ///
    /// - Parameters:
    ///   - content: A view builder that creates the menu content (a list of buttons).
    ///   - label: A view builder that creates the button's label.
    ///   - image: A view builder that creates the custom image content.
    ///   Use the ``SparkButtonImage``  to implement the image.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(
    ///     content: {
    ///         Button("Option 1") { }
    ///         Button("Option 2") { }
    ///     },
    ///     label: {
    ///         Text("Custom Label")
    ///     },
    ///     image: {
    ///         SparkButtonImage(image: Image(systemName: "star.fill"))
    ///             .opacity(self.isHighlighted ? 1.0 : 0.5)
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    init(
        @ViewBuilder content: @escaping () -> Content,
        label: @escaping () -> Label,
        image: @escaping () -> ImageLabel
    ) {
        self.init(
            type: .button,
            label: label,
            image: image,
            content: content
        )
    }
}
