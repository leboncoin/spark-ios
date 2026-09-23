//
//  SparkIcon.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// The Icon shows a colored and scaled icon image.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkIcon(
///             Image(systemName: "pencil")
///         )
///         .sparkTheme(self.theme)
///         .sparkIconIntent(.main)
///         .sparkIconSize(.small)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **iconIntent** : ``sparkIconIntent(_:)`` (View extension)
/// - **iconSize** : ``sparkIconSize(_:)`` (View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// By default, the component is not accessible.
/// To override this value, you need to set the **accessibilityHidden** to *false*.
///
/// In this case, an **accessibilityLabel** must be setted.
///
/// ## Rendering
///
/// ![Icon rendering.](icon_defaults.png)
///
public struct SparkIcon: View {

    // MARK: - Properties

    private let icon: Image

    @Environment(\.theme) private var theme
    @Environment(\.iconIntent) private var intent
    @Environment(\.iconSize) private var size

    @StateObject private var viewModel = IconViewModel()

    // MARK: - Initialization

    /// Create an icon with an image.
    ///
    /// - Parameters:
    ///   - icon: The icon Image.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkIcon(
    ///             Image(systemName: "pencil")
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkIconIntent(.main)
    ///         .sparkIconSize(.small)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Icon rendering.](icon_defaults.png)
    public init(_ icon: Image) {
        self.icon = icon
    }

    // MARK: - View

    public var body: some View {
        self.icon
            .resizable()
            .sparkFrame(size: self.viewModel.contentSize)
            .foregroundStyle(self.viewModel.tintColorToken)
            .accessibilityIdentifier(IconAccessibilityIdentifier.view)
            .accessibilityHidden(true)
            .dynamicTypeSize(...DynamicTypeSize.large)
            .onAppear() {
                self.viewModel.setup(
                    theme: self.theme.value,
                    intent: self.intent,
                    size: self.size
                )
            }
            .onChange(of: self.theme) { theme in
                self.viewModel.theme = self.theme.value
            }
            .onChange(of: self.intent) { intent in
                self.viewModel.intent = intent
            }
            .onChange(of: self.size) { size in
                self.viewModel.size = size
            }
    }
}
