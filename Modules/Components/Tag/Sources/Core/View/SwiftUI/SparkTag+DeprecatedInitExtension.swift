//
//  SparkTag+DeprecatedInitExtension.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 06/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

public extension SparkTag {

    /// Creates a Spark tag that generates its label from a localized string key.
    ///
    /// - Parameters:
    ///   - textKey: The key for the tag's localized text, that describes
    ///     the purpose of the tag.
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             "My tag",
    ///             theme: self.theme
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a localized text.](tag_with_text.png)
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    init(
        _ textKey: LocalizedStringKey,
        theme: any Theme,
    ) where Label == Text {
        self.init(
            deprecatedTheme: theme,
            icon: nil,
            label: { Text(textKey) }
        )
    }

    /// Creates a Spark tag that generates its label from a text.
    ///
    /// - Parameters:
    ///   - text: The text that describes
    ///     the purpose of the tag.
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             "My tag",
    ///             theme: self.theme
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a text.](tag_with_text.png)
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    init(
        _ text: String,
        theme: any Theme,
    ) where Label == Text {
        self.init(
            deprecatedTheme: theme,
            icon: nil,
            label: { Text(text) }
        )
    }

    /// Creates a Spark tag that generates its label from a custom label.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///   - label: A view that describes the purpose of the label.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             theme: self.theme,
    ///             label: {
    ///                 VStack {
    ///                     Text("Hello")
    ///                     Text("World")
    ///                 }
    ///             }
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a label.](tag_with_label.png)
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    init(
        theme: any Theme,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.init(
            deprecatedTheme: theme,
            icon: nil,
            label: label
        )
    }

    /// Creates a Spark tag that generates its label from an icon.
    ///
    /// Note : You must provide an *accessibilityLabel* !
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///   - icon: The icon that describe the purpose of the tag.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             theme: self.theme,
    ///             icon: .init(systemName: "checkmark")
    ///         )
    ///         .accessibilityLabel("My Tag")
    ///         .sparkAccessibilityLargeContentText("My Tag")
    ///     }
    /// ```
    ///
    /// ![Tag rendering with an icon.](tag_with_icon.png)
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    init(
        theme: any Theme,
        icon: Image,
    ) where Label == EmptyView {
        self.init(
            deprecatedTheme: theme,
            icon: icon,
            label: { EmptyView() }
        )
    }

    /// Creates a Spark tag that generates its label from a localized string key
    /// and an icon.
    ///
    /// - Parameters:
    ///   - textKey: The key for the tag's localized text, that describes
    ///     the purpose of the tag.
    ///   - theme: The current theme.
    ///   - icon: The icon that describe the purpose of the tag.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             "My tag",
    ///             icon: .init(systemName: "checkmark"),
    ///             theme: self.theme
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a localized text and icon.](tag_with_text_and_icon.png)
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    init(
        _ textKey: LocalizedStringKey,
        icon: Image,
        theme: any Theme,
    ) where Label == Text {
        self.init(
            deprecatedTheme: theme,
            icon: icon,
            label: { Text(textKey) }
        )
    }

    /// Creates a Spark tag that generates its label from a text and an icon.
    ///
    /// - Parameters:
    ///   - text: The text that describes
    ///     the purpose of the tag.
    ///   - theme: The current theme.
    ///   - icon: The icon that describe the purpose of the tag.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             "My tag",
    ///             icon: .init(systemName: "checkmark"),
    ///             theme: self.theme
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a text and icon.](tag_with_text_and_icon.png)
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    init(
        _ text: String,
        icon: Image,
        theme: any Theme,
    ) where Label == Text {
        self.init(
            deprecatedTheme: theme,
            icon: icon,
            label: { Text(text) }
        )
    }

    /// Creates a Spark tag that generates its label from a custom label and an icon.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///   - icon: The icon that describe the purpose of the tag.
    ///   - label: A view that describes the purpose of the label.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             theme: self.theme,
    ///             icon: .init(systemName: "checkmark"),
    ///             label: {
    ///                 VStack {
    ///                     Text("Hello")
    ///                     Text("World")
    ///                 }
    ///             }
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a label and icon.](tag_with_label_and_icon.png)
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    init(
        theme: any Theme,
        icon: Image,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.init(
            deprecatedTheme: theme,
            icon: icon,
            label: label
        )
    }
}
