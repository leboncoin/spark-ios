//
//  SparkBadge.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

/// A badge is a visual indicator for numeric values such as tallies and scores.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     var theme: any Theme
///
///     var body: some View {
///         SparkBadge()
///         .sparkTheme(self.theme)
///         .sparkBadgeIsBorder(false)
///         .sparkBadgeIntent(.main)
///         .sparkBadgeSize(.medium)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **badgeIsBorder** : ``sparkBadgeIsBorder(_:)`` (View extension)
/// - **badgeIntent** : ``sparkBadgeIntent(_:)`` (View extension)
/// - **badgeSize** : ``sparkBadgeSize(_:)`` (View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// You can set theses EnvironmentValues directly after created like this :
/// ```swift
/// struct MyView: View {
///     var theme: any Theme
///
///     var body: some View {
///         SparkBadge()
///         .sparkTheme(self.theme)
///         .sparkBadgeIsBorder(false)
///         .sparkBadgeIntent(.main)
///         .sparkBadgeSize(.medium)
///     }
/// }
/// ```
///
/// You can also set theses EnvironmentValues on the parent, all child badges will be automatically updated :
/// ```swift
/// struct MyView: View {
///     var theme: any Theme
///
///     var body: some View {
///         HStack {
///             SparkBadge()
///
///             SparkBadge(value: 49)
///
///             // The .neutral intent will be set only for this badge.
///             SparkBadge(value: 49, unit: "k")
///                 .sparkBadgeIntent(.neutral)
///         }
///         .sparkTheme(self.theme)
///         .sparkBadgeIsBorder(false)
///         .sparkBadgeIntent(.main)
///         .sparkBadgeSize(.medium)
///     }
/// }
/// ```
///
/// ## Accessibility
///
/// By default, the accessibility label is equals to the value + unit.
/// You can set an another `accessibilityLabel(text:)` to override
/// the default value.
///
/// ## Attach
///
/// It is possible to attach the view with a ``BadgePosition`` to a view.
///
/// ```swift
/// Rectangle()
///    .fill(.blue)
///    .frame(size: 40)
///    .attachSparkBadge(position: attachPosition) {
///        SparkBadge(value: 49)
///    }
/// ```
///
/// Attached (trailing and top right corner):
///
/// ![Component rendering.](badge_with_value_attach_trailing.png)
///
/// ![Component rendering.](badge_with_value_attach_topTrailingCorner.png)
///
/// ## Rendering
///
/// With a value (medium and small sizes):
///
/// ![Component rendering.](badge_with_value_medium.png)
///
/// ![Component rendering.](badge_with_value_small.png)
///
/// With a value and an unit:
/// ![Component rendering.](badge_with_unit.png)
///
/// Without a value (medium and small sizes):
/// 
/// ![Component rendering.](badge_without_value_medium.png)
///
/// ![Component rendering.](badge_without_value_small.png)
///
public struct SparkBadge: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.badgeIsBorder) private var isBorder
    @Environment(\.badgeIntent) private var intent
    @Environment(\.badgeSize) private var size

    @StateObject private var viewModel = BadgeViewModel()

    let value: Int?
    let unit: String?

    // MARK: - Initialization

    /// Create a badge witout value.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkBadge()
    ///         .sparkTheme(self.theme)
    ///         .sparkBadgeIsBorder(false)
    ///         .sparkBadgeIntent(.main)
    ///         .sparkBadgeSize(.medium)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](badge_without_value_medium.png)
    ///
    public init() {
        self.value = nil
        self.unit = nil
    }

    /// Create a badge witout value.
    ///
    /// - Parameters:
    ///   - value: The value of the badge.
    ///   - unit: The unit of the badge. Displayed on the right of the value.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkBadge(value: 49, unit: "k")
    ///         .sparkTheme(self.theme)
    ///         .sparkBadgeIsBorder(false)
    ///         .sparkBadgeIntent(.main)
    ///         .sparkBadgeSize(.medium)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](badge_with_value_medium.png)
    ///
    public init(value: Int, unit: String? = nil) {
        self.value = value
        self.unit = unit
    }

    // MARK: - View

    public var body: some View {
        ZStack {
            if let text = self.viewModel.text {
                Text(text)
                    .font(self.viewModel.textFont)
                    .foregroundStyle(self.viewModel.colors.foreground)
                    .sparkPadding(.horizontal, self.viewModel.sizes.horizontalSpacing)
                    .sparkFrame(height: self.viewModel.sizes.content)
                    .sparkFrame(minWidth: self.viewModel.sizes.content)
                    .background(self.viewModel.colors.background)
                    .accessibilityIdentifier(BadgeAccessibilityIdentifier.text)
            } else {
                RoundedRectangle(cornerRadius: self.viewModel.cornerRadius)
                    .fill(self.viewModel.colors.background.color)
                    .sparkFrame(size: self.viewModel.sizes.content)
            }
        }
        .sparkBorder(
            width: self.viewModel.sizes.border,
            radius: self.viewModel.cornerRadius,
            colorToken: self.viewModel.colors.border,
            position: .inner
        )
        .fixedSize()
        .accessibilityIdentifier(BadgeAccessibilityIdentifier.view)
        .accessibilityLabel(text: self.viewModel.text)
        .dynamicTypeSize(...DynamicTypeSize.accessibility3)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                intent: self.intent,
                isBorder: self.isBorder,
                size: self.size,
                value: self.value,
                unit: self.unit
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.isBorder) { isBorder in
            self.viewModel.isBorder = isBorder
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
        .onChange(of: self.value) { value in
            self.viewModel.value = value
        }
        .onChange(of: self.unit) { unit in
            self.viewModel.unit = unit
        }
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func accessibilityLabel(text: String?) -> some View {
        if let text {
            self.accessibilityLabel(text)
        } else {
            self
        }
    }
}

// MARK: - Preview

#Preview {
    SparkBadge()
}
