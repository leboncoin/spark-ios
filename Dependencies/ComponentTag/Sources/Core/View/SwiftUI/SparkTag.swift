//
//  SparkTag.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 04/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark Tag is used to label content and help users quickly recognize info
/// about them: Categories, Status...
/// Can be applied with different colors and designs that are associated
/// with a content due to its characteristics: new content, unvisited content,
/// featured content...
///
/// Users can’t interact with Tag except for accessibility.
///
/// There is some possibilities to init the component :
/// - With a **localized string key** or a **string**:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTag("My tag")
///         .sparkTheme(self.theme)
///     }
/// }     
/// ```
/// ![Tag rendering with a localized text.](tag_with_text.png)
///
/// - With a **label**:
///
/// **Use it carefully with Spark font and color !**
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTag {
///             VStack {
///                 Text("Hello")
///                 Text("World")
///             }
///         }
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
/// ![Tag rendering with a label.](tag_with_label.png)
///
/// - With an **icon**:
///
/// **You must set the _accessibilityLabel_ and a _sparkAccessibilityLargeContentText_**.
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTag(
///             icon: .init(systemName: "checkmark")
///         )
///         .sparkTheme(self.theme)
///         .accessibilityLabel("My Tag")
///         .sparkAccessibilityLargeContentText("My Tag")
///     }
/// }
/// ```
/// ![Tag rendering with an icon.](tag_with_icon.png)
///
/// - With a **localized string key** or a **string** and an **icon**:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTag(
///             "My tag",
///             icon: .init(systemName: "checkmark")
///         )
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
/// ![Tag rendering with a localized text and icon.](tag_with_text_and_icon.png)
///
/// - With a **localized string key** or a **string** and an **icon**:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTag(
///             icon: .init(systemName: "checkmark"),
///             label: {
///                 VStack {
///                     Text("Hello")
///                     Text("World")
///                 }
///             }
///         )
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
/// ![Tag rendering with a label and icon.](tag_with_label_and_icon.png)
///
/// Some environment values are used by the ``SparkTag``:
/// - Intent:
/// ```swift
/// SparkTag("My tag")
/// .sparkTheme(self.theme)
/// .sparkTagIntent(.success)
/// ```
/// 
/// - Size:
/// ```swift
/// SparkTag("My tag")
/// .sparkTheme(self.theme)
/// .sparkTagSize(.large)
/// ```
///
/// - Variant:
/// ```swift
/// SparkTag("My tag")
/// .sparkTheme(self.theme)
/// .sparkTagVariant(.tinted)
/// ```
///
/// - Is Highlighted:
/// ```swift
/// SparkTag("My tag")
/// .sparkTheme(self.theme)
/// .sparkTagIsHighlighted(true)
/// ```
/// ![Tag rendering with when us highlighted is true.](tag_with_is_highlighted.png)
///
/// - Accessibility Large Content Text:
/// ```swift
/// SparkTag(icon: .init(systemName: "checkmark"))
/// .sparkTheme(self.theme)
/// .sparkAccessibilityLargeContentText("The purpose of my tag")
/// ```
public struct SparkTag<Label>: View where Label: View {

    // MARK: - Type Alias

    private typealias AccessibilityIdentifier = TagAccessibilityIdentifier

    // MARK: - Private Properties

    @available(*, deprecated, message: "Remove the deprecated and this property ASAP. (02/01/2026")
    private var deprecatedTheme: (any Theme)?

    let label: () -> Label
    let icon: Image?

    @StateObject private var viewModel = TagViewModel()

    @Environment(\.theme) private var theme
    @Environment(\.tagIntent) private var intent
    @Environment(\.tagSize) private var size
    @Environment(\.tagVariant) private var variant
    @Environment(\.tagIsHighlighted) private var isHighlighted
    @Environment(\.accessibilityLargeContentText) private var largeContentText

    // MARK: - Initialization

    init(
        optionalIcon icon: Image?,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.icon = icon
        self.label = label
    }

    // MARK: - Deprecated Initialization

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    init(
        deprecatedTheme: any Theme,
        icon: Image?,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.deprecatedTheme = deprecatedTheme
        self.icon = icon
        self.label = label
    }

    // MARK: - View

    public var body: some View {
        SparkHStack(spacing: self.viewModel.spacings.horizontalSpacing) {
            // Optional icon image
            self.icon?
                .resizable()
                .scaledToFit()
                .sparkFrame(
                    height: TagConstants.iconSize,
                    relativeTo: .body
                )
                .foregroundStyle(self.viewModel.colors.iconColor)
                .accessibilityIdentifier(AccessibilityIdentifier.iconImage)
                .accessibilityHidden(true)

            // Optional Text
            self.label()
                .font(self.viewModel.textFont)
                .foregroundStyle(self.viewModel.colors.textColor)
                .lineLimit(1)
                .truncationMode(.tail)
                .accessibilityIdentifier(AccessibilityIdentifier.text)
        }
        .sparkPadding(.init(
            horizontal: self.viewModel.spacings.horizontalPadding
        ))
        .sparkFrame(
            height: self.viewModel.height,
            relativeTo: .title3
        )
        .background(self.viewModel.colors.backgroundColor)
        .sparkBorder(
            width: self.viewModel.border.width,
            radius: self.viewModel.border.radius,
            isHighlighted: self.isHighlighted,
            colorToken: self.viewModel.colors.borderColor
        )
        .accessibilityElement(children: .combine)
        .accessibilityShowsLargeContentViewer() {
            self.icon

            if let largeContentText {
                Text(largeContentText)
            } else {
                self.label()
            }
        }
        .dynamicTypeSize(...DynamicTypeSize.accessibility3)
        .onAppear() {
            self.viewModel.setup(
                theme: self.deprecatedTheme ?? self.theme.value,
                intent: self.intent,
                size: self.size,
                variant: self.variant
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
        .onChange(of: self.variant) { variant in
            self.viewModel.variant = variant
        }
    }
}
