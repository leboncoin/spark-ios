//
//  SparkCompanyAvatar+InitExtension.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 03/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkCompanyAvatar {

    /// Initializer with URL, optional action but without corner view.
    /// - Parameters:
    ///   - url: The URL of the image to display.
    ///   - action: The action to execute when the avatar is tapped. Optional. Default is *nil*.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkCompanyAvatar(url: URL(string: "https://example.com/logo.jpg")!)
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// | Placeholder | Image |
    /// |:---:|:---:|
    /// | ![Component rendering with placeholder](avatar_company_placeholder.png) | ![Component rendering with image](avatar_company_image.png) |
    ///
    init(
        url: URL,
        action: (() -> Void)? = nil,
    ) where CornerView == EmptyView {
        self.init(
            source: .url(value: url),
            action: action,
            cornerView: { EmptyView() }
        )
    }

    /// Initializer with URL, optional action and corner view.
    /// - Parameters:
    ///   - url: The URL of the image to display.
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
    ///         SparkCompanyAvatar(url: URL(string: "https://example.com/logo.jpg")!) {
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
    /// | ![Component rendering with placeholder](avatar_company_placeholder_corner_badge.png) | ![Component rendering with image](avatar_company_image_corner_badge.png) | 
    ///
    init(
        url: URL,
        action: (() -> Void)? = nil,
        @ViewBuilder cornerView: @escaping () -> CornerView
    ) {
        self.init(
            source: .url(value: url),
            action: action,
            cornerView: cornerView
        )
    }
}
