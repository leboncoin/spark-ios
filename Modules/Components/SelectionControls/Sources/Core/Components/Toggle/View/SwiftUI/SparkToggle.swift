//
//  SparkToggle.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark control that toggles between on and off states.
///
/// There is some possibilities to init the component :
/// - Without title:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var isOn = false
///
///     var body: some View {
///         SparkToggle(
///             isOn: self.$isOn
///         )
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
/// Toggle when isOn is **true** :
/// ![Toggle rendering.](toggle_on.png)
///
/// Toggle when isOn is **false**:
/// ![Toggle rendering.](toggle_false.png)
///
/// - With a localized string key or a string:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var isOn = false
///
///     var body: some View {
///         SparkToggle(
///             "My placeholder",
///             isOn: self.$isOn
///         )
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
/// ![Toggle rendering with a title.](toggle_with_title.png)
///
/// ![Toggle rendering with a multiline text.](toggle_with_mutliline.png)
///
/// - With a custom Label:
/// **Use it carefully with Spark font and color !**
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var isOn = false
///
///     var body: some View {
///         SparkToggle(
///             isOn: self.$isOn,
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
/// ![Toggle rendering with a Label.](toggle_with_label.png)
public struct SparkToggle<Label>: View where Label: View {

    // MARK: - Properties

    @available(*, deprecated, message: "Remove the deprecated and this property ASAP. (02/02/2026)")
    private var deprecatedTheme: (any Theme)?

    @Binding private var isOn: Bool
    private let label: () -> Label

    @Environment(\.theme) private var theme
    @Environment(\.colorSchemeContrast) private var contrast
    @Environment(\.isEnabled) private var isEnabled

    @StateObject private var viewModel = ToggleViewModel()

    // MARK: - Initialization

    /// Creates a Spark toggle with an empty label.
    ///
    /// Note : You must provide an *accessibilityLabel* !
    ///
    /// - Parameters:
    ///   - isOn: A binding to a property that indicates whether the toggle is on or off.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var isOn = false
    ///
    ///     var body: some View {
    ///         SparkToggle(isOn: self.$isOn)
    ///             .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ![Toggle rendering.](toggle_on.png)
    public init(isOn: Binding<Bool>) where Label == EmptyView {
        self._isOn = isOn
        self.label = { EmptyView() }
    }

    /// Creates a Spark toggle that generates its label from a localized string key.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the toggle's localized title, that describes
    ///     the purpose of the toggle.
    ///   - isOn: A binding to a property that indicates whether the toggle is on or off.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var isOn = false
    ///
    ///     var body: some View {
    ///         SparkToggle(
    ///             "My placeholder",
    ///             isOn: self.$isOn
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ![Toggle rendering with a title.](toggle_with_title.png)
    public init(
        _ titleKey: LocalizedStringKey,
        isOn: Binding<Bool>
    ) where Label == Text {
        self._isOn = isOn
        self.label = { Text(titleKey) }
    }

    /// Creates a Spark toggle that generates its label from a string.
    ///
    /// - Parameters:
    ///   - text: The text for the toggle's localized title, that describes
    ///     the purpose of the toggle.
    ///   - isOn: A binding to a property that indicates whether the toggle is on or off.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var isOn = false
    ///
    ///     var body: some View {
    ///         SparkToggle(
    ///             "My placeholder",
    ///             isOn: self.$isOn
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ![Toggle rendering with a title.](toggle_with_title.png)
    public init(
        _ text: String,
        isOn: Binding<Bool>
    ) where Label == Text {
        self._isOn = isOn
        self.label = { Text(text) }
    }

    /// Creates a Spark toggle that displays a custom label.
    ///
    /// - Parameters:
    ///   - isOn: A binding to a property that indicates whether the toggle is on or off.
    ///   - label: A view that describes the purpose of the toggle.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var isOn = false
    ///
    ///     var body: some View {
    ///         SparkToggle(
    ///             isOn: self.$isOn,
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
    /// ![Toggle rendering with a Label.](toggle_with_label.png)
    public init(
        isOn: Binding<Bool>,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self._isOn = isOn
        self.label = label
    }

    // MARK: - Deprecated Initialization

    /// Creates a Spark toggle with an empty label.
    ///
    /// Note : You must provide an *accessibilityLabel* !
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///   - isOn: A binding to a property that indicates whether the toggle is on or off.
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        theme: any Theme,
        isOn: Binding<Bool>
    ) where Label == EmptyView {
        self.deprecatedTheme = theme
        self._isOn = isOn
        self.label = { EmptyView() }
    }

    /// Creates a Spark toggle that generates its label from a localized string key.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the toggle's localized title, that describes
    ///     the purpose of the toggle.
    ///   - theme: The current theme.
    ///   - isOn: A binding to a property that indicates whether the toggle is on or off.
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        _ titleKey: LocalizedStringKey,
        theme: any Theme,
        isOn: Binding<Bool>
    ) where Label == Text {
        self.deprecatedTheme = theme
        self._isOn = isOn
        self.label = { Text(titleKey) }
    }

    /// Creates a Spark toggle that generates its label from a string.
    ///
    /// - Parameters:
    ///   - text: The text for the toggle's localized title, that describes
    ///     the purpose of the toggle.
    ///   - theme: The current theme.
    ///   - isOn: A binding to a property that indicates whether the toggle is on or off.
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        _ text: String,
        theme: any Theme,
        isOn: Binding<Bool>
    ) where Label == Text {
        self.deprecatedTheme = theme
        self._isOn = isOn
        self.label = { Text(text) }
    }

    /// Creates a Spark toggle that displays a custom label.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///   - isOn: A binding to a property that indicates whether the toggle is on or off.
    ///   - label: A view that describes the purpose of the toggle.
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        theme: any Theme,
        isOn: Binding<Bool>,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.deprecatedTheme = theme
        self._isOn = isOn
        self.label = label
    }

    // MARK: - View

    public var body: some View {
        Toggle(isOn: self.$isOn, label: self.label)
            .toggleStyle(.custom(
                viewModel: self.viewModel
            ))
            .accessibilityIdentifier(ToggleAccessibilityIdentifier.view)
            .onAppear() {
                self.viewModel.setup(
                    theme: self.deprecatedTheme ?? self.theme.value,
                    isOn: self.isOn,
                    isOnOffSwitchLabelsEnabled: UIAccessibility.isOnOffSwitchLabelsEnabled,
                    contrast: self.contrast,
                    isEnabled: self.isEnabled,
                    isCustomLabel: Label.self != EmptyView.self && Label.self != Text.self
                )
            }
            .onChange(of: self.theme) { newTheme in
                self.viewModel.theme = newTheme.value
            }
            .onChange(of: self.isOn) { isOn in
                self.viewModel.isOn = isOn
            }
            .onChange(of: UIAccessibility.isOnOffSwitchLabelsEnabled) { isOnOffSwitchLabelsEnabled in
                self.viewModel.isOnOffSwitchLabelsEnabled = isOnOffSwitchLabelsEnabled
            }
            .onChange(of: self.contrast) { contrast in
                self.viewModel.contrast = contrast
            }
            .onChange(of: self.isEnabled) { isEnabled in
                self.viewModel.isEnabled = isEnabled
            }
    }
}
