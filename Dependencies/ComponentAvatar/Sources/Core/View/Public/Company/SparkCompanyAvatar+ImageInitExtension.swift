//
//  SparkCompanyAvatar+InitExtension.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 03/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkCompanyAvatar {

    /// Initializer with Image, optional action but without corner view.
    /// - Parameters:
    ///   - image: The image to display.
    ///   - action: The action to execute when the avatar is tapped. Optional. Default is *nil*.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkCompanyAvatar(image: Image("company_logo"))
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](avatar_company_image.png)
    ///
    init(
        image: Image,
        action: (() -> Void)? = nil,
    ) where CornerView == EmptyView {
        self.init(
            source: .image(value: image),
            action: action,
            cornerView: { EmptyView() }
        )
    }

    /// Initializer with Image, optional action and corner view.
    /// - Parameters:
    ///   - image: The image to display.
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
    ///         SparkCompanyAvatar(image: Image("company_logo")) {
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
    /// ![Component rendering.](avatar_company_image_corner_badge.png)
    ///
    init(
        image: Image,
        action: (() -> Void)? = nil,
        @ViewBuilder cornerView: @escaping () -> CornerView
    ) {
        self.init(
            source: .image(value: image),
            action: action,
            cornerView: cornerView
        )
    }
}
