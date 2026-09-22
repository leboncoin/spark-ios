//
//  SparkRadioButton.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark control that radio buttons between selected and unselected states.
///
/// There is some possibilities to init the component :
/// - Without title:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var isSelected = false
///
///     var body: some View {
///         SparkRadioButton(
///             isSelected: self.$isSelected
///         )
///         .sparkTheme(self.theme)
///         .sparkRadioButtonIntent(.error)
///         .sparkRadioButtonIsAnimated(false)
///     }
/// }
/// ```
/// Radio button when isSelected is **true** :
/// ![Radio button rendering.](radioButton_selected.png)
///
/// Radio button when isSelected is **false**:
/// ![Radio button rendering.](radioButton_unselected.png)
///
/// - With a localized string key or a string:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var isSelected = false
///
///     var body: some View {
///         SparkRadioButton(
///             "My placeholder",
///             isSelected: self.$isSelected
///         )
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
/// ![Radio button rendering with a title.](radioButton_with_title.png)
///
/// ![Radio button rendering with a multiline text.](radioButton_with_mutliline.png)
///
/// - With a custom Label:
/// **Use it carefully with Spark font and color !**
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var isSelected = false
///
///     var body: some View {
///         SparkRadioButton(
///             isSelected: self.$isSelected
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
/// ![Radio button rendering with a Label.](radioButton_with_label.png)
///
/// - **Full Width**
/// If you want to have a full width checkbox, you use a custom content and add a **frame maxWidth** and a **contentShape** like this :
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var isSelected = false
///
///     var body: some View {
///         SparkRadioButton(
///             isSelected: self.$isSelected
///             label: {
///                 VStack {
///                     Text("Hello")
///                     Text("World")
///                 }
///                 .frame(maxWidth: .infinity, alignment: .leading)
///                 .contentShape(Rectangle())
///             }
///         )
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
public struct SparkRadioButton<Label>: View where Label: View {

    // MARK: - Properties

    @Binding private var isSelected: Bool
    private let label: () -> Label

    @Environment(\.radioButtonIntent) private var intent
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.theme) private var theme

    @StateObject private var viewModel = RadioButtonViewModel()

    // MARK: - Private Properties

    @available(*, deprecated, message: "Remove the deprecated and this property ASAP. (02/02/2026)")
    private var deprecatedTheme: (any Theme)?

    // MARK: - Initialization

    /// Creates a Spark radio button with an empty label.
    ///
    /// Note : You must provide an *accessibilityLabel* !
    ///
    /// - Parameters:
    ///   - isSelected: A binding to a property that indicates whether the radio button is selected or not.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var isSelected = false
    ///
    ///     var body: some View {
    ///         SparkRadioButton(
    ///             isSelected: self.$isSelected
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ![Radio button rendering.](radioButton_unselected.png)
    public init(
        isSelected: Binding<Bool>
    ) where Label == EmptyView {
        self._isSelected = isSelected
        self.label = { EmptyView() }
    }

    /// Creates a Spark radio button that generates its label from a localized string key.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the radio button's localized title, that describes
    ///     the purpose of the radio button.
    ///   - isSelected: A binding to a property that indicates whether the radio button is selected or not.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var isSelected = false
    ///
    ///     var body: some View {
    ///         SparkRadioButton(
    ///             "My placeholder",
    ///             isSelected: self.$isSelected
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ![Radio button rendering with a title.](radioButton_with_title.png)
    public init(
        _ titleKey: LocalizedStringKey,
        isSelected: Binding<Bool>
    ) where Label == Text {
        self._isSelected = isSelected
        self.label = { Text(titleKey) }
    }

    /// Creates a Spark radio button that generates its label from a string.
    ///
    /// - Parameters:
    ///   - text: The text for the radio button's localized title, that describes
    ///     the purpose of the radio button.
    ///   - isSelected: A binding to a property that indicates whether the radio button is selected or not.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var isSelected = false
    ///
    ///     var body: some View {
    ///         SparkRadioButton(
    ///             "My placeholder",
    ///             isSelected: self.$isSelected
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }     
    /// ```
    ///
    /// ![Radio button rendering with a title.](radioButton_with_title.png)
    public init(
        _ text: String,
        isSelected: Binding<Bool>
    ) where Label == Text {
        self._isSelected = isSelected
        self.label = { Text(text) }
    }

    /// Creates a Spark radio button that displays a custom label.
    ///
    /// - Parameters:
    ///   - isSelected: A binding to a property that indicates whether the radio button is selected or not.
    ///   - label: A view that describes the purpose of the radio button.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var isSelected = false
    ///
    ///     var body: some View {
    ///         SparkRadioButton(
    ///             isSelected: self.$isSelected,
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
    /// ![Radio button rendering with a Label.](radioButton_with_label.png)
    public init(
        isSelected: Binding<Bool>,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self._isSelected = isSelected
        self.label = label
    }

    // MARK: - Deprecated Initialization

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        theme: any Theme,
        isSelected: Binding<Bool>
    ) where Label == EmptyView {
        self.init(isSelected: isSelected)
        self.deprecatedTheme = theme
    }

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        _ titleKey: LocalizedStringKey,
        theme: any Theme,
        isSelected: Binding<Bool>
    ) where Label == Text {
        self.init(titleKey, isSelected: isSelected)
        self.deprecatedTheme = theme
    }

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        _ text: String,
        theme: any Theme,
        isSelected: Binding<Bool>
    ) where Label == Text {
        self.init(text, isSelected: isSelected)
        self.deprecatedTheme = theme
    }

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        theme: (any Theme)?,
        isSelected: Binding<Bool>,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.init(isSelected: isSelected, label: label)
        self.deprecatedTheme = theme
    }

    // MARK: - View

    public var body: some View {
        Toggle(
            isOn: self.$isSelected,
            label: self.label
        )
        .toggleStyle(.custom(viewModel: self.viewModel))
        .accessibilityIdentifier(RadioButtonAccessibilityIdentifier.view)
        .accessibilityRemoveToggleTraits()
        .accessibilityValue(String.accessibilityValue(isSelected: self.isSelected))
        .onAppear() {
            self.viewModel.setup(
                theme: self.deprecatedTheme ?? self.theme.value,
                intent: self.intent,
                isSelected: self.isSelected,
                isEnabled: self.isEnabled,
                isCustomLabel: Label.self != EmptyView.self && Label.self != Text.self
            )
        }
        .onChange(of: self.theme) { newTheme in
            self.viewModel.theme = newTheme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.isSelected) { isSelected in
            self.viewModel.isSelected = isSelected
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
    }
}
