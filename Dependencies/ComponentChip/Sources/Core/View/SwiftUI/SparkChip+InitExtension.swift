//
//  SparkChip+InitExtension.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 24/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

public extension SparkChip {

    // MARK: - Initialization

    /// Init with an Icon.
    ///
    /// Note : You must provide an *accessibilityLabel* !
    ///
    /// - Parameters:
    ///   - icon: The icon of the chip.
    ///   - action: The action of the chip. *Optional*. Default is *nil*.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkChip(icon: .init("moon"))
    ///         .sparkTheme(self.theme)
    ///         .sparkChipAlignment(.trailingIcon)
    ///         .sparkChipIntent(.main)
    ///         .sparkChipVariant(.filled)
    ///         .sparkIsSelected(true)
    ///         .disabled(true)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// With a icon
    /// ![Component rendering.](chip_with_icon.png)
    ///
    init(
        icon: Image,
        action: (() -> Void)? = nil
    ) where Label == EmptyView, ExtraContent == EmptyView {
        self.init(
            icon: icon,
            action: action,
            label: { EmptyView() },
            extraContent: { EmptyView() }
        )
    }

    /// Init with a LocalizedStringKey.
    ///
    /// - Parameters:
    ///   - textKey: The localized text key of the chip.
    ///   - icon: The icon of the chip. *Optional*. Default is *nil*.
    ///   - action: The action of the chip. *Optional*. Default is *nil*.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkChip(
    ///             "My Chip",
    ///             icon: .init("moon")
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkChipAlignment(.trailingIcon)
    ///         .sparkChipIntent(.main)
    ///         .sparkChipVariant(.filled)
    ///         .sparkIsSelected(true)
    ///         .disabled(true)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](chip_with_text.png)
    ///
    init(
        _ textKey: LocalizedStringKey,
        icon: Image? = nil,
        action: (() -> Void)? = nil
    ) where Label == Text, ExtraContent == EmptyView {
        self.init(
            icon: icon,
            action: action,
            label: { Text(textKey) },
            extraContent: { EmptyView() }
        )
    }

    /// Init with a Text.
    ///
    /// - Parameters:
    ///   - text: The text of the chip.
    ///   - icon: The icon of the chip. *Optional*. Default is *nil*.
    ///   - action: The action of the chip. *Optional*. Default is *nil*.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkChip(
    ///             "My Chip",
    ///             icon: .init("moon")
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkChipAlignment(.trailingIcon)
    ///         .sparkChipIntent(.main)
    ///         .sparkChipVariant(.filled)
    ///         .sparkIsSelected(true)
    ///         .disabled(true)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](chip_with_text.png)
    ///
    init(
        _ text: String,
        icon: Image? = nil,
        action: (() -> Void)? = nil
    ) where Label == Text, ExtraContent == EmptyView {
        self.init(
            icon: icon,
            action: action,
            label: { Text(text) },
            extraContent: { EmptyView() }
        )
    }

    /// Init with a Label.
    ///
    /// - Parameters:
    ///   - icon: The icon of the chip. *Optional*. Default is *nil*.
    ///   - action: The action of the chip. *Optional*. Default is *nil*.
    ///   - label: The content label of the chip.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkChip(
    ///             icon: .init("moon"),
    ///             label: {
    ///                 HStack {
    ///                     Text("Welcome")
    ///                     Text("on Spark's Chip")
    ///                         .foregroundColor(.blue)
    ///                 }
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkChipAlignment(.trailingIcon)
    ///         .sparkChipIntent(.main)
    ///         .sparkChipVariant(.filled)
    ///         .sparkIsSelected(true)
    ///         .disabled(true)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](chip_with_label.png)
    ///
    init(
        icon: Image? = nil,
        action: (() -> Void)? = nil,
        @ViewBuilder label: @escaping () -> Label
    ) where ExtraContent == EmptyView {
        self.init(
            icon: icon,
            action: action,
            label: label,
            extraContent: { EmptyView() }
        )
    }

    /// Init with an Extra Content.
    ///
    /// Note : You must provide an *accessibilityLabel* !
    ///
    /// - Parameters:
    ///   - icon: The icon of the chip. *Optional*. Default is *nil*.
    ///   - action: The action of the chip. *Optional*. Default is *nil*.
    ///   - extraContent: The extra content of the chip.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkChip(
    ///             icon: .init("moon"),
    ///             action: { // Your action },
    ///             extraContent: {
    ///                 Text("99")
    ///                     .font(.body)
    ///                     .bold()
    ///                     .foregroundStyle(.red)
    ///                     .padding(4)
    ///                     .background(.yellow)
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkChipAlignment(.trailingIcon)
    ///         .sparkChipIntent(.main)
    ///         .sparkChipVariant(.filled)
    ///         .sparkIsSelected(true)
    ///         .disabled(true)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](chip_with_icon_and_extra_content.png)
    ///
    init(
        icon: Image? = nil,
        action: (() -> Void)? = nil,
        @ViewBuilder extraContent: @escaping () -> ExtraContent
    ) where Label == EmptyView {
        self.init(
            icon: icon,
            action: action,
            label: { EmptyView() },
            extraContent: extraContent
        )
    }

    /// Init with a LocalizedStringKey and an Extra Content.
    ///
    /// - Parameters:
    ///   - textKey: The localized text key of the chip.
    ///   - icon: The icon of the chip. *Optional*. Default is *nil*.
    ///   - action: The action of the chip. *Optional*. Default is *nil*.
    ///   - extraContent: The extra content of the chip.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkChip(
    ///             icon: .init("moon"),
    ///             label: {
    ///                 HStack {
    ///                     Text("Welcome")
    ///                     Text("on Spark's Chip")
    ///                         .foregroundColor(.blue)
    ///                 }
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkChipAlignment(.trailingIcon)
    ///         .sparkChipIntent(.main)
    ///         .sparkChipVariant(.filled)
    ///         .sparkIsSelected(true)
    ///         .disabled(true)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](chip_with_text_and_icon_and_extra_content.png)
    ///
    init(
        _ textKey: LocalizedStringKey,
        icon: Image? = nil,
        action: (() -> Void)? = nil,
        @ViewBuilder extraContent: @escaping () -> ExtraContent
    ) where Label == Text {
        self.init(
            icon: icon,
            action: action,
            label: { Text(textKey) },
            extraContent: extraContent
        )
    }

    /// Init with a Text and an Extra Content.
    ///
    /// The **Label** and **ExtraContent** can be a empty view.
    ///
    /// - Parameters:
    ///   - text: The text of the chip.
    ///   - icon: The icon of the chip. *Optional*. Default is *nil*.
    ///   - action: The action of the chip. *Optional*. Default is *nil*.
    ///   - extraContent: The extra content of the chip.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkChip(
    ///             "My Chip",
    ///             icon: .init("moon"),
    ///             action: { // Your action },
    ///             extraContent: {
    ///                 Text("99")
    ///                     .font(.body)
    ///                     .bold()
    ///                     .foregroundStyle(.red)
    ///                     .padding(4)
    ///                     .background(.yellow)
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkChipAlignment(.trailingIcon)
    ///         .sparkChipIntent(.main)
    ///         .sparkChipVariant(.filled)
    ///         .sparkIsSelected(true)
    ///         .disabled(true)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](chip_with_text_and_icon_and_extra_content.png)
    ///
    init(
        _ text: String,
        icon: Image? = nil,
        action: (() -> Void)? = nil,
        @ViewBuilder extraContent: @escaping () -> ExtraContent
    ) where Label == Text {
        self.init(
            icon: icon,
            action: action,
            label: { Text(text) },
            extraContent: extraContent
        )
    }
}
