//
//  SparkTag+InitExtension.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 06/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension SparkTag {

    // MARK: - Label Initialization

    /// Creates a Spark tag that generates its label from a localized string key.
    ///
    /// - Parameters:
    ///   - textKey: The key for the tag's localized text, that describes
    ///     the purpose of the tag.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag("My tag")
    ///             .sparkTheme(self.theme)
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a localized text.](tag_with_text.png)
    init(
        _ textKey: LocalizedStringKey
    ) where Label == Text {
        self.init(
            optionalIcon: nil,
            label: { Text(textKey) }
        )
    }

    /// Creates a Spark tag that generates its label from a text.
    ///
    /// - Parameters:
    ///   - text: The text that describes
    ///     the purpose of the tag.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag("My tag")
    ///             .sparkTheme(self.theme)
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a text.](tag_with_text.png)
    init(
        _ text: String
    ) where Label == Text {
        self.init(
            optionalIcon: nil,
            label: { Text(text) }
        )
    }

    /// Creates a Spark tag that generates its label from a custom label.
    ///
    /// - Parameters:
    ///   - label: A view that describes the purpose of the label.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             label: {
    ///                 VStack {
    ///                     Text("Hello")
    ///                     Text("World")
    ///                 }
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a label.](tag_with_label.png)
    init(
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.init(
            optionalIcon: nil,
            label: label
        )
    }

    // MARK: - Icon Initialization

    /// Creates a Spark tag that generates its label from an icon.
    ///
    /// Note : You must provide an *accessibilityLabel* !
    ///
    /// - Parameters:
    ///   - icon: The icon that describe the purpose of the tag.
    ///
    /// Implementation example :
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
    /// ```
    ///
    /// ![Tag rendering with an icon.](tag_with_icon.png)
    init(
        icon: Image
    ) where Label == EmptyView {
        self.init(
            optionalIcon: icon,
            label: { EmptyView() }
        )
    }

    // MARK: - Label + Icon Initialization

    /// Creates a Spark tag that generates its label from a localized string key
    /// and an icon.
    ///
    /// - Parameters:
    ///   - textKey: The key for the tag's localized text, that describes
    ///     the purpose of the tag.
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
    ///             icon: .init(systemName: "checkmark")
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a localized text and icon.](tag_with_text_and_icon.png)
    init(
        _ textKey: LocalizedStringKey,
        icon: Image
    ) where Label == Text {
        self.init(
            optionalIcon: icon,
            label: { Text(textKey) }
        )
    }

    /// Creates a Spark tag that generates its label from a text and an icon.
    ///
    /// - Parameters:
    ///   - text: The text that describes
    ///     the purpose of the tag.
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
    ///             icon: .init(systemName: "checkmark")
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a text and icon.](tag_with_text_and_icon.png)
    init(
        _ text: String,
        icon: Image
    ) where Label == Text {
        self.init(
            optionalIcon: icon,
            label: { Text(text) }
        )
    }

    /// Creates a Spark tag that generates its label from a custom label and an icon.
    ///
    /// - Parameters:
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
    /// ```
    ///
    /// ![Tag rendering with a label and icon.](tag_with_label_and_icon.png)
    init(
        icon: Image,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.init(
            optionalIcon: icon,
            label: label
        )
    }
}
