//
//  SparkButton+InitExtension.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 16/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkButton where Content == EmptyView {

    // MARK: - Initialization

    /// Creates a button with a text label.
    ///
    /// - Parameters:
    ///   - title: The text label to display on the button.
    ///   - role: An optional semantic role that describes the button's purpose. Optional. Default is *nil*.
    ///   - action: The action to perform when the button is tapped.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton("Submit") {
    ///     // Your action
    /// }
    /// .sparkTheme(self.theme)
    /// .sparkButtonIntent(.main)
    /// ```
    ///
    init(
        _ title: String,
        role: ButtonRole? = nil,
        action: @escaping @MainActor () -> Void
    ) where Label == Text, ImageLabel == EmptyView {
        self.init(
            type: .button,
            role: role,
            action: action,
            label: { Text(title) },
            image: { EmptyView() }
        )
    }

    /// Creates a button with a text label and an icon.
    ///
    /// - Parameters:
    ///   - title: The text label to display on the button.
    ///   - image: The icon image to display alongside the text.
    ///   - role: An optional semantic role that describes the button's purpose. Optional. Default is *nil*.
    ///   - action: The action to perform when the button is tapped.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(
    ///     "Save",
    ///     image: Image(systemName: "checkmark")
    /// ) {
    ///     // Your action
    /// }
    /// .sparkTheme(self.theme)
    /// .sparkButtonIntent(.support)
    /// .sparkButtonAlignment(.leadingImage)
    /// ```
    ///
    init(
        _ title: String,
        image: Image,
        role: ButtonRole? = nil,
        action: @escaping @MainActor () -> Void
    ) where Label == Text, ImageLabel == SparkButtonImage {
        self.init(
            type: .button,
            role: role,
            action: action,
            label: { Text(title) },
            image: { SparkButtonImage(image: image) }
        )
    }

    /// Creates an icon-only button.
    ///
    /// - Parameters:
    ///   - image: The icon image to display.
    ///   - role: An optional semantic role that describes the button's purpose. Optional. Default is *nil*.
    ///   - action: The action to perform when the button is tapped.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(Image(systemName: "heart.fill")) {
    ///     // Your action
    /// }
    /// .sparkTheme(self.theme)
    /// .sparkButtonIntent(.support)
    /// .sparkButtonSize(.small)
    /// ```
    ///
    init(
        _ image: Image,
        role: ButtonRole? = nil,
        action: @escaping @MainActor () -> Void
    ) where Label == EmptyView, ImageLabel == SparkButtonImage {
        self.init(
            type: .iconButton,
            role: role,
            action: action,
            label: { EmptyView() },
            image: { SparkButtonImage(image: image) }
        )
    }

    /// Creates a button with a custom label.
    ///
    /// Use this initializer when you need complete control over the button's label content.
    ///
    /// - Parameters:
    ///   - role: An optional semantic role that describes the button's purpose. Optional. Default is *nil*.
    ///   - action: The action to perform when the button is tapped.
    ///   - label: A view builder that creates the button's label.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(action: {
    ///     // Your action
    /// }) {
    ///     VStack {
    ///         Text("Custom")
    ///         Text("Label")
    ///     }
    /// }
    /// .sparkTheme(self.theme)
    /// ```
    ///
    init(
        role: ButtonRole? = nil,
        action: @escaping @MainActor () -> Void,
        label: @escaping () -> Label
    ) where ImageLabel == EmptyView {
        self.init(
            type: .button,
            role: role,
            action: action,
            label: label,
            image: { EmptyView() }
        )
    }

    /// Creates a button with a custom label and an icon.
    ///
    /// Use this initializer when you need a custom label alongside an icon.
    ///
    /// - Parameters:
    ///   - image: The icon image to display alongside the label.
    ///   - role: An optional semantic role that describes the button's purpose. Optional. Default is *nil*.
    ///   - action: The action to perform when the button is tapped.
    ///   - label: A view builder that creates the button's label.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(
    ///     Image(systemName: "star.fill"),
    ///     action: {
    ///         // Your action
    ///     }
    /// ) {
    ///     VStack {
    ///         Text("Rate")
    ///         Text("5 stars")
    ///     }
    /// }
    /// .sparkTheme(self.theme)
    /// ```
    ///
    init(
        _ image: Image,
        role: ButtonRole? = nil,
        action: @escaping @MainActor () -> Void,
        label: @escaping () -> Label
    ) where ImageLabel == SparkButtonImage {
        self.init(
            type: .button,
            role: role,
            action: action,
            label: label,
            image: { SparkButtonImage(image: image) }
        )
    }

    /// Creates a button with a text label and a custom image view.
    ///
    /// Use this initializer when you need full control over the image rendering,
    /// such as applying custom animations or effects to the icon.
    ///
    /// - Parameters:
    ///   - title: The text label to display on the button.
    ///   - role: An optional semantic role that describes the button's purpose. Optional. Default is *nil*.
    ///   - action: The action to perform when the button is tapped.
    ///   - image: A view builder that creates the custom image content.
    ///   Use the ``SparkButtonImage``  to implement the image.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(
    ///     "Notify",
    ///     action: {
    ///         // Your action
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
        role: ButtonRole? = nil,
        action: @escaping @MainActor () -> Void,
        image: @escaping () -> ImageLabel
    ) where Label == Text {
        self.init(
            type: .button,
            role: role,
            action: action,
            label: { Text(title) },
            image: image
        )
    }

    /// Creates an icon-only button with a custom image view.
    ///
    /// Use this initializer when you need full control over the image rendering,
    /// such as applying custom animations or effects to the icon.
    ///
    /// - Parameters:
    ///   - role: An optional semantic role that describes the button's purpose. Optional. Default is *nil*.
    ///   - action: The action to perform when the button is tapped.
    ///   - image: A view builder that creates the custom image content.
    ///   Use the ``SparkButtonImage``  to implement the image.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(
    ///     action: {
    ///         // Your action
    ///     },
    ///     image: {
    ///         SparkButtonImage(image: Image(systemName: "bell.fill"))
    ///             .rotationEffect(.degrees(self.rotation))
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    init(
        role: ButtonRole? = nil,
        action: @escaping @MainActor () -> Void,
        image: @escaping () -> ImageLabel
    ) where Label == EmptyView {
        self.init(
            type: .iconButton,
            role: role,
            action: action,
            label: { EmptyView() },
            image: image
        )
    }

    /// Creates a button with a custom label and a custom image view.
    ///
    /// Use this initializer when you need full control over both the label and image rendering,
    /// such as applying custom animations or effects.
    ///
    /// - Parameters:
    ///   - role: An optional semantic role that describes the button's purpose. Optional. Default is *nil*.
    ///   - action: The action to perform when the button is tapped.
    ///   - label: A view builder that creates the button's label.
    ///   - image: A view builder that creates the custom image content.
    ///   Use the ``SparkButtonImage``  to implement the image.   
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkButton(
    ///     action: {
    ///         // Your action
    ///     },
    ///     label: {
    ///         Text("Custom Label")
    ///     },
    ///     image: {
    ///         SparkButtonImage(image: Image(systemName: "star.fill"))
    ///             .scaleEffect(self.isAnimating ? 1.2 : 1.0)         
    ///     }
    /// )
    /// .sparkTheme(self.theme)
    /// ```
    ///
    init(
        role: ButtonRole? = nil,
        action: @escaping @MainActor () -> Void,
        label: @escaping () -> Label,
        image: @escaping () -> ImageLabel
    ) {
        self.init(
            type: .button,
            role: role,
            action: action,
            label: label,
            image: image
        )
    }
}
