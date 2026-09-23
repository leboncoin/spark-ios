
//
//  SparkUserAvatar+InitExtension.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 03/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkUserAvatar {

    /// Initializer with Image, optional action but without corner view.
    /// - Parameters:
    ///   - image: The image to display.
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
    ///             image: Image("avatar"),
    ///             placeholder: "Bob Doe"
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](avatar_user_image.png)
    ///
    init(
        image: Image,
        placeholder: String,
        action: (() -> Void)? = nil,
    ) where CornerView == EmptyView {
        self.init(
            source: .image(value: image),
            placeholder: placeholder,
            action: action,
            cornerView: { EmptyView() }
        )
    }

    /// Initializer with Image, placeholder, optional action and corner view.
    /// - Parameters:
    ///   - image: The image to display.
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
    ///             image: Image("avatar"),
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
    /// ![Component rendering.](avatar_user_image_corner_badge.png)
    ///
    init(
        image: Image,
        placeholder: String,
        action: (() -> Void)? = nil,
        @ViewBuilder cornerView: @escaping () -> CornerView
    ) {
        self.init(
            source: .image(value: image),
            placeholder: placeholder,
            action: action,
            cornerView: cornerView
        )
    }
}
