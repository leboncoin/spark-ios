//
//  SparkTextField.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 10/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A **Spark** control that displays an editable text interface.
///
/// It is possible to display some side views :
/// - leftView (at the left of the textField).
/// - rightView (at the right of the textField)
///
/// And some addons :
/// - leftAddon (at the left of the leftView or textField if there is no leftView)
/// - rightAddon (at the right of the rightView or textField if there is no rightView)
///
/// All theses views are optional. By default all side views are **nil** (corresponding to EmptyView).
///
/// **Default values** :
/// - **intent**: .neutral
/// - **readOnly**: false
/// - **clearMode**: never
/// - **secureEntry**: false
/// - **leftAddonConfiguration**: ``TextFieldAddonConfiguration``default init
/// - **rightAddonConfiguration**: ``TextFieldAddonConfiguration``default init
///
/// Implementation example :
/// - With all side views :
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var text = ""
///
///     var body: some View {
///         SparkTextField(
///             "My placeholder",
///             text: self.$text,
///             theme: self.theme,
///             leftView: {
///                 Text("Hello")
///             },
///             rightView: {
///                 Image(systemName: "circle")
///             },
///             leftAddon: {
///                 Button("In", action: {})
///             },
///             rightAddon: {
///                 Button("Out", action: {})
///             }
///         )
///         .sparkTextFieldIntent(.success)
///         .sparkTextFieldReadOnly(false)
///         .sparkTextFieldClearMode(.always)
///         .sparkTextFieldSecureEntry(false)
///         .sparkTextFieldLeftAddonConfiguration(hasPadding: false, hasSeparator: true)
///         .sparkTextFieldLeftAddonConfiguration(hasPadding: true, hasSeparator: false)
///     }
/// }
/// ```
/// ![TextField rendering with Addons and Side Views.](textfield.png)
///
/// - Without side views
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var text = ""
///
///     var body: some View {
///         SparkTextField(
///             "My placeholder",
///             text: self.$text,
///             theme: self.theme
///         )
///     }
/// }
/// ```
/// ![TextField rendering without Addons and Side Views.](textfield-without-addons.png)
///
/// - With Formatter
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     let numberFormatter = NumberFormatter()
///     @State var value: Double = 5
///
///     var body: some View {
///         SparkTextField(
///             "My placeholder",
///             value: self.$value,
///             formatter: self.numberFormatter,
///             theme: self.theme
///         )
///     }
/// }
/// ```
///
/// - With Format
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var price: Double = 12
///
///     var body: some View {
///         SparkTextField(
///             "My placeholder",
///             value: self.$price,
///             format: .currency(code: "EUR"),
///             theme: self.theme
///         )
///     }
/// }
/// ```
///
/// Some environment values are used by the ``SparkTextField``:
/// - Intent (change the intent) :
/// ```swift
/// SparkTextField(
///     "My placeholder",
///     text: self.$text,
///     theme: self.theme
/// )
/// .sparkTextFieldIntent(.success)
/// ```
/// - Read Only (activate or not the read only):
/// ```swift
/// SparkTextField(
///     "My placeholder",
///     text: self.$text,
///     theme: self.theme
/// )
/// .sparkTextFieldReadOnly(false)
/// ```
/// - Clear Mode (show a clear button from enum ``TextFieldClearMode``):
/// ```swift
/// SparkTextField(
///     "My placeholder",
///     text: self.$text,
///     theme: self.theme
/// )
/// .sparkTextFieldClearMode(.always)
/// ```
/// - Secure Entry  (activate or not the secure entry):
/// ```swift
/// SparkTextField(
///     "My placeholder",
///     text: self.$text,
///     theme: self.theme
/// )
/// .sparkTextFieldSecureEntry(false)
/// ```
/// ![TextField rendering with secure mode.](textfield-secure.png)
/// - Left Addon Configuration (some style of the addon):
/// ```swift
/// SparkTextField(
///     "My placeholder",
///     text: self.$text,
///     theme: self.theme
/// )
/// .sparkTextFieldLeftAddonConfiguration(hasPadding: false, hasSeparator: true)
/// ```
/// - Right Addon Configuration (some style of the addon):
/// ```swift
/// SparkTextField(
///     "My placeholder",
///     text: self.$text,
///     theme: self.theme
/// )
/// .sparkTextFieldLeftAddonConfiguration(hasPadding: true, hasSeparator: false)
/// ```
/// - Accessibility Value (to override the default value):
/// ```swift
/// SparkTextField(
///     "My placeholder",
///     text: self.$text,
///     theme: self.theme
/// )
/// .sparkTextFieldAccessibilityValue("My value \(self.text)")
/// ```
/// - Accessibility Hint (to override the default value):
/// ```swift
/// SparkTextField(
///     "My placeholder",
///     text: self.$text,
///     theme: self.theme
/// )
/// .textFieldAccessibilityHint("Error, the email is invalid.")
/// ```
public struct SparkTextField<Value, LeftView: View, RightView: View, LeftAddon: View, RightAddon: View, Content: _TextField>: View {

    // MARK: - Properties

    @available(*, deprecated, message: "Remove the deprecated and this property ASAP. (02/02/2026)")
    private var deprecatedTheme: (any Theme)?

    private let titleKey: LocalizedStringKey

    @Binding private var value: Value

    @Environment(\.isEnabled) private var isEnabled

    @Environment(\.theme) private var theme
    @Environment(\.textFieldIntent) private var intent
    @Environment(\.textFieldReadOnly) private var isReadOnly
    @Environment(\.textFieldClearMode) private var clearMode
    @Environment(\.textFieldLeftAddonConfiguration) private var leftAddonConfiguration
    @Environment(\.textFieldRightAddonConfiguration) private var rightAddonConfiguration
    @Environment(\.textFieldAccessibilityLabel) private var accessibilityLabel
    @Environment(\.textFieldAccessibilityValue) private var accessibilityValue
    @Environment(\.textFieldAccessibilityHint) private var accessibilityHint

    @FocusState private var isFocused: Bool

    private let leftView: () -> LeftView
    private let rightView: () -> RightView
    private let leftAddon: () -> LeftAddon
    private let rightAddon: () -> RightAddon

    private var height: CGFloat = TextInputConstants.height

    @StateObject private var viewModel = TextFieldViewModel()

    private let content: () -> Content

    // MARK: - Initialization

    /// SparkTextField initializer with **text**.
    /// - Parameters:
    ///   - titleKey: The textfield's current placeholder.
    ///   - text: The textfield's text binding.
    ///   - leftView: The textField's left view, default is `EmptyView`.
    ///   - rightView: The textField's right view, default is `EmptyView`.
    ///   - leftAddon: The textField's left addon, default is `EmptyView`.
    ///   - rightAddon: The textField's right addon, default is `EmptyView`.
    ///
    /// Implementation example :
    /// - With all side views :
    /// ```swift
    /// struct MyView: View {
    ///     @State var text = ""
    ///
    ///     var body: some View {
    ///         SparkTextField(
    ///             "My placeholder",
    ///             text: self.$text,
    ///             leftView: {
    ///                 Text("Hello")
    ///             },
    ///             rightView: {
    ///                 Image(systemName: "circle")
    ///             },
    ///             leftAddon: {
    ///                 Button("In", action: {})
    ///             },
    ///             rightAddon: {
    ///                 Button("Out", action: {})
    ///             }
    ///         )
    ///     }
    /// }
    /// ```
    /// ![TextField rendering without Addons and Side Views.](textfield.png)
    ///
    /// - Without side views
    /// ```swift
    /// struct MyView: View {
    ///     @State var text = ""
    ///
    ///     var body: some View {
    ///         SparkTextField(
    ///             "My placeholder",
    ///             text: self.$text
    ///         )
    ///     }
    /// }
    /// ```
    /// ![TextField rendering without Addons and Side Views.](textfield-without-addons.png)
    public init(
        _ titleKey: LocalizedStringKey,
        text: Binding<String>,
        leftView: @escaping () -> LeftView = { EmptyView() },
        rightView: @escaping () -> RightView = { EmptyView() },
        leftAddon: @escaping () -> LeftAddon = { EmptyView() },
        rightAddon: @escaping () -> RightAddon = { EmptyView() }
    ) where Value == String, Content == _DefaultTextField {
        self.titleKey = titleKey
        self._value = text

        self.leftAddon = leftAddon
        self.leftView = leftView
        self.rightView = rightView
        self.rightAddon = rightAddon

        self.content = {
            _DefaultTextField(
                titleKey: titleKey,
                text: text
            )
        }
    }

    /// SparkTextField initializer that applies a formatter to a bound value.
    /// - Parameters:
    ///   - titleKey: The textfield's current placeholder.
    ///   - value: The textfield's value binding.
    ///   - formatter: The textfield's value formatter.
    ///   - leftView: The textField's left view, default is `EmptyView`.
    ///   - rightView: The textField's right view, default is `EmptyView`.
    ///   - leftAddon: The textField's left addon, default is `EmptyView`.
    ///   - rightAddon: The textField's right addon, default is `EmptyView`.
    ///
    /// Implementation example :
    /// - With all side views :
    /// ```swift
    /// struct MyView: View {
    ///     let numberFormatter = NumberFormatter()
    ///     @State var value: Double = 5
    ///
    ///     var body: some View {
    ///         SparkTextField(
    ///             "My placeholder",
    ///             value: self.$value,
    ///             formatter: self.numberFormatter,
    ///             leftView: {
    ///                 Text("Hello")
    ///             },
    ///             rightView: {
    ///                 Image(systemName: "circle")
    ///             },
    ///             leftAddon: {
    ///                 Button("In", action: {})
    ///             },
    ///             rightAddon: {
    ///                 Button("Out", action: {})
    ///             }
    ///         )
    ///     }
    /// }
    /// ```
    /// ![TextField rendering without Addons and Side Views.](textfield.png)
    ///
    /// - Without side views
    /// ```swift
    /// struct MyView: View {
    ///     let numberFormatter = NumberFormatter()
    ///     @State var value: Double = 5
    ///
    ///     var body: some View {
    ///         SparkTextField(
    ///             "My placeholder",
    ///             value: self.$value,
    ///             formatter: self.numberFormatter
    ///         )
    ///     }
    /// }
    /// ```
    /// ![TextField rendering without Addons and Side Views.](textfield-without-addons.png)
    public init(
        _ titleKey: LocalizedStringKey,
        value: Binding<Value>,
        formatter: Formatter,
        leftView: @escaping () -> LeftView = { EmptyView() },
        rightView: @escaping () -> RightView = { EmptyView() },
        leftAddon: @escaping () -> LeftAddon = { EmptyView() },
        rightAddon: @escaping () -> RightAddon = { EmptyView() }
    ) where Content == _FormattedTextField<Value> {
        self.titleKey = titleKey
        self._value = value

        self.leftAddon = leftAddon
        self.leftView = leftView
        self.rightView = rightView
        self.rightAddon = rightAddon

        self.content = {
            _FormattedTextField(
                titleKey: titleKey,
                value: value,
                formatter: formatter
            )
        }
    }

    /// SparkTextField initializer  that applies a format style to a bound value.
    /// - Parameters:
    ///   - titleKey: The textfield's current placeholder.
    ///   - value: The textfield's value binding.
    ///   - format: The textfield's value formatter.
    ///   - leftView: The textField's left view, default is `EmptyView`.
    ///   - rightView: The textField's right view, default is `EmptyView`.
    ///   - leftAddon: The textField's left addon, default is `EmptyView`.
    ///   - rightAddon: The textField's right addon, default is `EmptyView`.
    ///
    /// Implementation example :
    /// - With all side views :
    /// ```swift
    /// struct MyView: View {
    ///     @State var price: Double = 12
    ///
    ///     var body: some View {
    ///         SparkTextField(
    ///             "My placeholder",
    ///             value: self.$price,
    ///             format: .currency(code: "EUR"),
    ///             leftView: {
    ///                 Text("Hello")
    ///             },
    ///             rightView: {
    ///                 Image(systemName: "circle")
    ///             },
    ///             leftAddon: {
    ///                 Button("In", action: {})
    ///             },
    ///             rightAddon: {
    ///                 Button("Out", action: {})
    ///             }
    ///         )
    ///     }
    /// }
    /// ```
    /// ![TextField rendering without Addons and Side Views.](textfield.png)
    ///
    /// - Without side views
    /// ```swift
    /// struct MyView: View {
    ///     @State var price: Double = 12
    ///
    ///     var body: some View {
    ///         SparkTextField(
    ///             "My placeholder",
    ///             value: self.$price,
    ///             format: .currency(code: "EUR")
    ///         )
    ///     }
    /// }
    /// ```
    /// ![TextField rendering without Addons and Side Views.](textfield-without-addons.png)
    public init<Format>(
        _ titleKey: LocalizedStringKey,
        value: Binding<Format.FormatInput>,
        format: Format,
        leftView: @escaping () -> LeftView = { EmptyView() },
        rightView: @escaping () -> RightView = { EmptyView() },
        leftAddon: @escaping () -> LeftAddon = { EmptyView() },
        rightAddon: @escaping () -> RightAddon = { EmptyView() }
    ) where Format: ParseableFormatStyle, Format.FormatOutput == String, Format.FormatInput == Value, Content == _FormatTextField<Value, Format> {
        self.titleKey = titleKey
        self._value = value

        self.leftAddon = leftAddon
        self.leftView = leftView
        self.rightView = rightView
        self.rightAddon = rightAddon

        self.content = {
            _FormatTextField(
                titleKey: titleKey,
                value: value,
                format: format
            )
        }
    }

    // MARK: - Deprecated Initialization

    /// SparkTextField initializer with **text**.
    /// - Parameters:
    ///   - titleKey: The textfield's current placeholder.
    ///   - text: The textfield's text binding.
    ///   - theme: The textfield's current theme.
    ///   - leftView: The textField's left view, default is `EmptyView`.
    ///   - rightView: The textField's right view, default is `EmptyView`.
    ///   - leftAddon: The textField's left addon, default is `EmptyView`.
    ///   - rightAddon: The textField's right addon, default is `EmptyView`.
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        _ titleKey: LocalizedStringKey,
        text: Binding<String>,
        theme: any Theme,
        leftView: @escaping () -> LeftView = { EmptyView() },
        rightView: @escaping () -> RightView = { EmptyView() },
        leftAddon: @escaping () -> LeftAddon = { EmptyView() },
        rightAddon: @escaping () -> RightAddon = { EmptyView() }
    ) where Value == String, Content == _DefaultTextField {
        self.deprecatedTheme = theme
        self.titleKey = titleKey
        self._value = text

        self.leftAddon = leftAddon
        self.leftView = leftView
        self.rightView = rightView
        self.rightAddon = rightAddon

        self.content = {
            _DefaultTextField(
                titleKey: titleKey,
                text: text
            )
        }
    }

    /// SparkTextField initializer that applies a formatter to a bound value.
    /// - Parameters:
    ///   - titleKey: The textfield's current placeholder.
    ///   - value: The textfield's value binding.
    ///   - formatter: The textfield's value formatter.
    ///   - theme: The textfield's current theme.
    ///   - leftView: The textField's left view, default is `EmptyView`.
    ///   - rightView: The textField's right view, default is `EmptyView`.
    ///   - leftAddon: The textField's left addon, default is `EmptyView`.
    ///   - rightAddon: The textField's right addon, default is `EmptyView`.
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init(
        _ titleKey: LocalizedStringKey,
        value: Binding<Value>,
        formatter: Formatter,
        theme: any Theme,
        leftView: @escaping () -> LeftView = { EmptyView() },
        rightView: @escaping () -> RightView = { EmptyView() },
        leftAddon: @escaping () -> LeftAddon = { EmptyView() },
        rightAddon: @escaping () -> RightAddon = { EmptyView() }
    ) where Content == _FormattedTextField<Value> {
        self.deprecatedTheme = theme
        self.titleKey = titleKey
        self._value = value

        self.leftAddon = leftAddon
        self.leftView = leftView
        self.rightView = rightView
        self.rightAddon = rightAddon

        self.content = {
            _FormattedTextField(
                titleKey: titleKey,
                value: value,
                formatter: formatter
            )
        }
    }

    /// SparkTextField initializer  that applies a format style to a bound value.
    /// - Parameters:
    ///   - titleKey: The textfield's current placeholder.
    ///   - value: The textfield's value binding.
    ///   - format: The textfield's value formatter.
    ///   - theme: The textfield's current theme.
    ///   - leftView: The textField's left view, default is `EmptyView`.
    ///   - rightView: The textField's right view, default is `EmptyView`.
    ///   - leftAddon: The textField's left addon, default is `EmptyView`.
    ///   - rightAddon: The textField's right addon, default is `EmptyView`.
    @available(*, deprecated, message: "Use the init without theme instead. Set the theme after the init.")
    public init<Format>(
        _ titleKey: LocalizedStringKey,
        value: Binding<Format.FormatInput>,
        format: Format,
        theme: any Theme,
        leftView: @escaping () -> LeftView = { EmptyView() },
        rightView: @escaping () -> RightView = { EmptyView() },
        leftAddon: @escaping () -> LeftAddon = { EmptyView() },
        rightAddon: @escaping () -> RightAddon = { EmptyView() }
    ) where Format: ParseableFormatStyle, Format.FormatOutput == String, Format.FormatInput == Value, Content == _FormatTextField<Value, Format> {
        self.deprecatedTheme = theme
        self.titleKey = titleKey
        self._value = value

        self.leftAddon = leftAddon
        self.leftView = leftView
        self.rightView = rightView
        self.rightAddon = rightAddon

        self.content = {
            _FormatTextField(
                titleKey: titleKey,
                value: value,
                format: format
            )
        }
    }

    // MARK: - View

    public var body: some View {
        self.contentView()
        .background(self.viewModel.colors.background.color)
        .scaledFrame(height: self.height)
        .allowsHitTesting(!self.isReadOnly)
        .scaledBorder(
            width: self.viewModel.borderLayout.width,
            radius: self.viewModel.borderLayout.radius,
            colorToken: self.viewModel.colors.border
        )
        .opacity(self.viewModel.dim)
        .dynamicTypeSize(...DynamicTypeSize.accessibility3)
        .accessibilityElement(children: .contain)
        .onAppear() {
            self.viewModel.updateAll(
                theme: self.deprecatedTheme ?? self.theme.value,
                intent: self.intent,
                isReadOnly: self.isReadOnly,
                clearMode: self.clearMode.mode,
                leftAddonConfiguration: self.leftAddonConfiguration,
                rightAddonConfiguration: self.rightAddonConfiguration,
                isFocused: self.isFocused,
                isEnabled: self.isEnabled
            )
        }
        .onChange(of: self.theme) { newTheme in
            self.viewModel.theme = newTheme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.isReadOnly) { isReadOnly in
            self.viewModel.isReadOnly = isReadOnly
        }
        .onChange(of: self.clearMode) { clearMode in
            self.viewModel.clearMode = clearMode.mode
        }
        .onChange(of: self.leftAddonConfiguration) { leftAddonConfiguration in
            self.viewModel.leftAddonConfiguration = leftAddonConfiguration
        }
        .onChange(of: self.rightAddonConfiguration) { rightAddonConfiguration in
            self.viewModel.rightAddonConfiguration = rightAddonConfiguration
        }
        .onChange(of: self.isFocused) { isFocused in
            self.viewModel.isFocused = isFocused
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
    }

    // MARK: - Subviews

    private func contentView() -> some View {
        HStack(spacing: .zero) {
            // Left Addon
            self.leftAddon()
                .sparkPadding(self.viewModel.leftAddonPadding)
                .layoutPriority(self.leftAddonConfiguration.layoutPriority)
                .accessibilitySort(.leftAddon)
                .accessibilityRespondsToUserInteraction(true)

            // Separator
            if self.leftAddonConfiguration.hasSeparator {
                self.separator()
            }

            ScaledHStack(spacing: self.viewModel.spacings.content) {
                // Left View
                self.leftView()
                    .accessibilitySort(.leftView)
                    .accessibilityRespondsToUserInteraction(true)

                HStack(spacing: 0) {

                    HStack(spacing: 0) {
                        // TextField
                        self.content()
                            .font(self.viewModel.font)
                            .textFieldStyle(.plain)
                            .foregroundStyle(self.viewModel.colors.text)
                            .placeholderColor(self.viewModel.colors.placeholder)
                            .tint(self.viewModel.colors.text)
                            .focused(self.$isFocused)
                            .accessibilitySort(.textField)
                            .accessibilityRespondsToUserInteraction(true)
                            .accessibilityIdentifier(TextFieldAccessibilityIdentifier.view)
                            .accessibilityOptionalLabel(self.accessibilityLabel)
                            .accessibilityOptionalValue(self.accessibilityValue)
                            .accessibilityOptionalHint(self.accessibilityHint)

                        if self.viewModel.isClearButton && !self.content().isEmptyContent() {
                            TextFieldClearButton(action: self.clearMode.action ?? {
                                self.content().clearAction()
                            })
                            .accessibilitySort(.clearButton)
                            .accessibilityRespondsToUserInteraction(true)
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .sparkPadding(.trailing, self.viewModel.contentPadding.inputTrailing)

                    // Right View
                    self.rightView()
                        .sparkPadding(.trailing, self.viewModel.contentPadding.trailing)
                        .accessibilitySort(.rightView)
                        .accessibilityRespondsToUserInteraction(true)
                }
            }
            .sparkPadding(.top, self.viewModel.contentPadding.top)
            .sparkPadding(.bottom, self.viewModel.contentPadding.bottom)
            .sparkPadding(.leading, self.viewModel.contentPadding.leading)

            // Separator
            if self.rightAddonConfiguration.hasSeparator {
                self.separator()
            }

            // Right Addon
            self.rightAddon()
                .sparkPadding(self.viewModel.rightAddonPadding)
                .layoutPriority(self.rightAddonConfiguration.layoutPriority)
                .accessibilitySort(.rightAddon)
                .accessibilityRespondsToUserInteraction(true)
        }
    }

    private func prompt() -> Text {
        Text(self.titleKey).foregroundColor(self.viewModel.colors.placeholder)
    }

    private func separator() -> some View {
        Divider()
            .scaledFrame(width: self.viewModel.borderLayout.width)
            .overlay(self.viewModel.colors.border)
    }
}
