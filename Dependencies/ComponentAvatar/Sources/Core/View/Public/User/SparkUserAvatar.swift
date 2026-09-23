//
//  SparkUserAvatar.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
import SparkComponentBadge
@_spi(SI_SPI) import SparkCommon

/// The Spark Avatar component that displays a user representation with optional image, initials, badge, and action button.
///
/// Avatars are visual representations of private and professional users. They help humanize and personalize the platform experience.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkUserAvatar(username: "Bob Doe", image: Image("avatar"))
///             .sparkTheme(self.theme)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component uses these EnvironmentValues:
/// - **theme**: ``sparkTheme(_:)`` (View extension)
/// - **actionType**: ``sparkAvatarActionType(_:)`` (View extension)
/// - **isBorder**: ``sparkAvatarIsBorder(_:)`` (View extension)
/// - **size**: ``sparkAvatarSize(_:)`` (View extension)
///
/// > If these values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// The avatar view is identified by ``AvatarAccessibilityIdentifier/view``.
///
/// ## Rendering
///
/// | Placeholder | Image |
/// |:---:|:---:|
/// | ![Component rendering with placeholder](avatar_user_placeholder.png) | ![Component rendering with image](avatar_user_image.png) |
///
/// | Badge | Badge | Button
/// |:---:|:---:|:---:|
/// | ![Component rendering with badge](avatar_user_image_corner_badge.png) | ![Component rendering with badge](avatar_user_placeholder_corner_badge.png) | ![Component rendering with button](avatar_user_placeholder_corner_button.png) |
///
public struct SparkUserAvatar<CornerView>: View where CornerView: View {

    // MARK: - Properties

    private let source: AvatarSource
    private var placeholder: String
    private var cornerView: () -> CornerView
    private let action: (() -> Void)?

    // MARK: - Initialization

    init(
        source: AvatarSource,
        placeholder: String,
        action: (() -> Void)?,
        @ViewBuilder cornerView: @escaping () -> CornerView
    ) {
        self.source = source
        self.placeholder = placeholder
        self.action = action
        self.cornerView = cornerView
    }

    // MARK: - View

    public var body: some View {
        Avatar(
            source: self.source,
            contentType: .user,
            action: self.action,
            placeholder: {
                Text(self.placeholder.initial)
            },
            cornerView: self.cornerView
        )
    }
}
