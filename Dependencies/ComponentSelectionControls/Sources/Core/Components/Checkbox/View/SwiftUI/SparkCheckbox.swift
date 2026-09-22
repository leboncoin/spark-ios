//
//  SparkCheckbox.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkResources
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark control that checkbox between selected, unselected or indeterminate states.
///
/// There is some possibilities to init the component :
/// - Without title:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var selectionState = .unselected
///
///     var body: some View {
///         SparkCheckbox(
///             selectionState: self.$selectionState
///         )
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
///
/// Checkbox when selectionState is **selected** or isSelected is **true**:
/// ![Checkbox rendering.](checkbox_selected.png)
///
/// Checkbox when selectionState is **unselected** or isSelected is **false**:
/// ![Checkbox rendering.](checkbox_unselected.png)
///
/// Checkbox when selectionState is **indeterminate**:
/// ![Checkbox rendering.](checkbox_indeterminate.png)
///
/// - With a localized string key or a string:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var selectionState = .unselected
///
///     var body: some View {
///         SparkCheckbox(
///             "My placeholder",
///             selectionState: self.$selectionState
///         )
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
/// ![Checkbox rendering with a title.](checkbox_with_title.png)
///
/// ![Checkbox rendering with a multiline text.](checkbox_with_mutliline.png)
///
/// - With a custom Label:
/// **Use it carefully with Spark font and color !**
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var selectionState = .unselected
///
///     var body: some View {
///         SparkCheckbox(
///             selectionState: self.$selectionState,
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
/// ![Checkbox rendering with a Label.](checkbox_with_label.png)
///
/// - **Full Width**
/// If you want to have a full width checkbox, you must use a custom content and add **frame maxWidth** and a **contentShape** like this :
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var selectionState = .unselected
///
///     var body: some View {
///         SparkCheckbox(
///             selectionState: self.$selectionState,
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
public struct SparkCheckbox<Label>: View where Label: View {

    // MARK: - Properties

    @Binding private var selectionState: CheckboxSelectionState
    private let selectedIcon: Image = Image(spark: \.check)
    private let indeterminateIcon: Image? = Image(spark: \.minus)
    private let label: () -> Label

    @Environment(\.checkboxIntent) private var intent
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.theme) private var theme

    @StateObject private var viewModel = CheckboxViewModel()

    // MARK: - Private Properties

    @available(*, deprecated, message: "Remove the deprecated and this property ASAP. (02/02/2026)")
    private var deprecatedTheme: (any Theme)?

    // MARK: - Selection State Initialization

    /// Creates a Spark checkbox with an empty label.
    ///
    /// Note : You must provide an *accessibilityLabel* !
    ///
    /// - Parameters:
    ///   - selectionState: A binding to a property that indicates the checkbox selection state.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var selectionState = .unselected
    ///
    ///     var body: some View {
    ///         SparkCheckbox(
    ///             selectionState: self.$selectionState
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ![Checkbox rendering.](checkbox_unselected.png)
    public init(
        selectionState: Binding<CheckboxSelectionState>
    ) where Label == EmptyView {
        self._selectionState = selectionState
        self.label = { EmptyView() }
    }

    /// Creates a Spark checkbox that generates its label from a localized string key.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the checkbox's localized title, that describes
    ///     the purpose of the checkbox.
    ///   - selectionState: A binding to a property that indicates the checkbox selection state.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var selectionState = .unselected
    ///
    ///     var body: some View {
    ///         SparkCheckbox(
    ///             "My placeholder",
    ///             selectionState: self.$selectionState
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ![Checkbox rendering with a title.](checkbox_with_title.png)
    public init(
        _ titleKey: LocalizedStringKey,
        selectionState: Binding<CheckboxSelectionState>
    ) where Label == Text {
        self._selectionState = selectionState
        self.label = { Text(titleKey) }
    }

    /// Creates a Spark checkbox that generates its label from a string.
    ///
    /// - Parameters:
    ///   - text: The text for the checkbox's localized title, that describes
    ///     the purpose of the checkbox.
    ///   - selectionState: A binding to a property that indicates the checkbox selection state.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var selectionState = .unselected
    ///
    ///     var body: some View {
    ///         SparkCheckbox(
    ///             "My placeholder",
    ///             selectionState: self.$selectionState
    ///         )
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ![Checkbox rendering with a title.](checkbox_with_title.png)
    public init(
        _ text: String,
        selectionState: Binding<CheckboxSelectionState>
    ) where Label == Text {
        self._selectionState = selectionState
        self.label = { Text(text) }
    }

    /// Creates a Spark checkbox that displays a custom label.
    ///
    /// - Parameters:
    ///   - selectionState: A binding to a property that indicates the checkbox selection state.
    ///   - label: A view that describes the purpose of the checkbox.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var selectionState = .unselected
    ///
    ///     var body: some View {
    ///         SparkCheckbox(
    ///             selectionState: self.$selectionState,
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
    /// ![Checkbox rendering with a Label.](checkbox_with_label.png)
    public init(
        selectionState: Binding<CheckboxSelectionState>,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self._selectionState = selectionState
        self.label = label
    }

    // MARK: - Deprecated Initialization

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        theme: any Theme,
        selectionState: Binding<CheckboxSelectionState>
    ) where Label == EmptyView {
        self.init(selectionState: selectionState)
        self.deprecatedTheme = theme
    }

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        _ titleKey: LocalizedStringKey,
        theme: any Theme,
        selectionState: Binding<CheckboxSelectionState>
    ) where Label == Text {
        self.init(titleKey, selectionState: selectionState)
        self.deprecatedTheme = theme
    }

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        _ text: String,
        theme: any Theme,
        selectionState: Binding<CheckboxSelectionState>
    ) where Label == Text {
        self.init(text, selectionState: selectionState)
        self.deprecatedTheme = theme
    }

    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        theme: (any Theme)?,
        selectionState: Binding<CheckboxSelectionState>,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.init(selectionState: selectionState, label: label)
        self.deprecatedTheme = theme
    }

    // MARK: - View

    public var body: some View {
        Toggle(
            isOn: Binding(
                get: {
                    self.selectionState == .selected
                }, set: { newValue in
                    self.selectionState = newValue ? .selected : .unselected
                }
            ),
            label: self.label
        )
        .toggleStyle(.custom(
            viewModel: self.viewModel,
            selectedIcon: self.selectedIcon,
            indeterminateIcon: self.indeterminateIcon
        ))
        .accessibilityIdentifier(CheckboxAccessibilityIdentifier.view)
        .accessibilityRemoveToggleTraits()
        .accessibilityValue(String.accessibilityValue(selectionState: self.selectionState))
        .onAppear() {
            self.viewModel.setup(
                theme: self.deprecatedTheme ?? self.theme.value,
                intent: self.intent,
                selectionState: self.selectionState,
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
        .onChange(of: self.selectionState) { selectionState in
            self.viewModel.selectionState = selectionState
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
    }
}
