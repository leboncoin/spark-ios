//
//  SparkUserAvatar+InitExtension.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 03/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkUserAvatar {

    /// Initializer with URL, optional action but without corner view.
    /// - Parameters:
    ///   - url: The URL of the image to display.
    ///   - placeholder: The placeholder text to display (typically initials).
    ///   - action: The action to execute when the avatar is tapped. Optional. Default is *nil*.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkUserAvatar(
    ///             url: URL(string: "https://example.com/avatar.jpg")!,
    ///             placeholder: "Bob Doe"
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// | Placeholder | Image |
    /// |:---:|:---:|
    /// | ![Component rendering with placeholder](avatar_user_placeholder.png) | ![Component rendering with image](avatar_user_image.png) |
    ///
    init(
        url: URL,
        placeholder: String,
        action: (() -> Void)? = nil,
    ) where CornerView == EmptyView {
        self.init(
            source: .url(value: url),
            placeholder: placeholder,
            action: action,
            cornerView: { EmptyView() }
        )
    }

    /// Initializer with URL, placeholder, optional action and corner view.
    /// - Parameters:
    ///   - url: The URL of the image to display.
    ///   - placeholder: The placeholder text to display (typically initials).
    ///   - action: The action to execute when the avatar is tapped. Optional. Default is *nil*.
    ///   - cornerView: The view to display in the bottom-trailing corner (e.g., badge).
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkUserAvatar(
    ///             url: URL(string: "https://example.com/avatar.jpg")!,
    ///             placeholder: "Bob Doe"
    ///         ) {
    ///             SparkBadge(value: 5)
    ///                 .sparkBadgeIntent(.main)
    ///         }
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// | Placeholder | Image |
    /// |:---:|:---:|
    /// | ![Component rendering with placeholder](avatar_user_placeholder_corner_badge.png) | ![Component rendering with image](avatar_user_image_corner_badge.png) |
    ///
    init(
        url: URL,
        placeholder: String,
        action: (() -> Void)? = nil,
        @ViewBuilder cornerView: @escaping () -> CornerView
    ) {
        self.init(
            source: .url(value: url),
            placeholder: placeholder,
            action: action,
            cornerView: cornerView
        )
    }
}
