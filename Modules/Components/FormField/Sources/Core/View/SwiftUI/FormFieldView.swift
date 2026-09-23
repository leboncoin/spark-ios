//
//  FormFieldView.swift
//  SparkComponentFormField
//
//  Created by alican.aycil on 18.03.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// The **Spark** FormField provide context to your form elements easily.
///
/// FormField provide context to your form elements easily,
/// unifying an a proper way to show a label, required marker,
/// help & status messages or counter in any input/field components.
///
/// Implementation example:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var text: String = ""
///
///     var body: some View {
///         FormFieldView(
///             theme: self.theme,
///             feedbackState: .default,
///             title: "Email (exemple@mail.fr)",
///             helper: "Please provide a valid email (exemple@mail.fr).",
///             helperImage: Image(systemName: "exclamationmark.circle"),
///             isRequired: true,
///             component: {
///                 TextField("Email (exemple@mail.fr)", text: self.$text)
///             }
///         )
///         .clearButton(icon: Image(systemName: "xmark.circle")) {
///          }
///         .counter(on: text, limit: 100)
///     }
/// }
/// ```
///
/// ![FormField rendering with TextField.](component.png)
public struct FormFieldView<Component: View>: View {

    // MARK: - Properties

    @ObservedObject private var viewModel: FormFieldViewModel
    @ScaledMetric private var spacing: CGFloat

    private var clearButton: ClearButton?
    private let helperImage: Image?
    private let component: Component

    @ScaledMetric private var iconSize = FormFieldConstants.iconSize
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @AccessibilityFocusState private var isComponentFocused: Bool

    private var customClearButtonAccessibilityLabel: String?
    private var customHelperAccessibilityLabel: String?
    private var customSecondaryHelperAccessibilityLabel: String?
    private var customSecondaryHelperAccessibilityValue: String?

    // MARK: - Initialization

    /// Initialize a formField.
    /// - Parameters:
    ///   - theme: The current Spark-Theme.
    ///   - feedbackState: The formfield feedback state. 'Default' or 'Error'.
    ///   - title: The formfield title.
    ///   - helper: The formfield helper message.
    ///   - helperImage: The helper image displayed to the left of the helper text. **Displayed only if helper is setted**.
    ///   - isRequired: Add an asterisk symbol at the end of title if the value is true.
    ///   - component: The component is covered by formfield.
    ///
    /// Implementation example:
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var text: String = ""
    ///
    ///     var body: some View {
    ///         FormFieldView(
    ///             theme: self.theme,
    ///             feedbackState: .default,
    ///             title: "Email (exemple@mail.fr)",
    ///             helper: "Please provide a valid email (exemple@mail.fr).",
    ///             helperImage: Image(systemName: "exclamationmark.circle"),
    ///             isRequired: true,
    ///             component: {
    ///                 TextField("Email (exemple@mail.fr)", text: self.$text)
    ///             }
    ///         )
    ///     }
    /// }
    /// ```
    ///
    /// ![FormField rendering with TextField.](component.png)
    public init(
        theme: any Theme,
        feedbackState: FormFieldFeedbackState = .default,
        title: String? = nil,
        helper: String? = nil,
        helperImage: Image? = nil,
        isRequired: Bool = false,
        @ViewBuilder component: @escaping () -> Component
    ) {
        let viewModel = FormFieldViewModel(
            frameworkType: .swiftUI,
            theme: theme,
            feedbackState: feedbackState,
            title: title,
            helper: helper,
            isRequired: isRequired
        )

        self.viewModel = viewModel
        self._spacing = ScaledMetric(wrappedValue: viewModel.spacing)
        self._spacing = ScaledMetric(wrappedValue: viewModel.spacing)

        self.helperImage = helperImage
        self.component = component()
    }

    /// Initialize a formField.
    /// - Parameters:
    ///   - theme: The current Spark-Theme.
    ///   - component: The component is covered by formfield.
    ///   - feedbackState: The formfield feedback state. 'Default' or 'Error'.
    ///   - title: The formfield title.
    ///   - helper: The formfield helper message.
    ///   - isTitleRequired: The asterisk symbol at the end of title.
    @available(*, deprecated, message: "Replaced by the init with the isRequired String since the 1.1.0.")
    public init(
        theme: any Theme,
        @ViewBuilder component: @escaping () -> Component,
        feedbackState: FormFieldFeedbackState = .default,
        title: String? = nil,
        helper: String? = nil,
        isTitleRequired: Bool = false
    ) {
        self.init(
            theme: theme,
            feedbackState: feedbackState,
            title: title,
            helper: helper,
            isRequired: isTitleRequired,
            component: component
        )
    }

    /// Initialize a formField.
    /// - Parameters:
    ///   - theme: The current Spark-Theme.
    ///   - component: The component is covered by formfield.
    ///   - feedbackState: The formfield feedback state. 'Default' or 'Error'.
    ///   - title: The formfield title.
    ///   - description: The formfield helper message.
    ///   - isTitleRequired: The asterisk symbol at the end of title.
    @available(*, deprecated, message: "Replaced by the init with the helper String since the 0.1.1.")
    public init(
        theme: any Theme,
        @ViewBuilder component: @escaping () -> Component,
        feedbackState: FormFieldFeedbackState = .default,
        title: String? = nil,
        description: String? = nil,
        isTitleRequired: Bool = false
    ) {
        self.init(
            theme: theme,
            feedbackState: feedbackState,
            title: title,
            helper: description,
            isRequired: isTitleRequired,
            component: component
        )
    }

    /// Initialize a formField.
    /// - Parameters:
    ///   - theme: The current Spark-Theme.
    ///   - component: The component is covered by formfield.
    ///   - feedbackState: The formfield feedback state. 'Default' or 'Error'.
    ///   - attributedTitle: The formfield attributedTitle.
    ///   - attributedHelper: The formfield attributed helper message.
    ///   - isTitleRequired: The asterisk symbol at the end of title.
    @available(*, deprecated, message: "Replaced by the init with the title and helper String since the 1.1.0.")
    public init(
        theme: any Theme,
        @ViewBuilder component: @escaping () -> Component,
        feedbackState: FormFieldFeedbackState = .default,
        attributedTitle: AttributedString? = nil,
        attributedHelper: AttributedString? = nil,
        isTitleRequired: Bool = false
    ) {
        let title: String? = if let attributedTitle {
            .init(attributedTitle.characters)
        } else {
            nil
        }

        let helper: String? = if let attributedHelper {
            .init(attributedHelper.characters)
        } else {
            nil
        }

        self.init(
            theme: theme,
            feedbackState: feedbackState,
            title: title,
            helper: helper,
            isRequired: isTitleRequired,
            component: component
        )
    }

    /// Initialize a formField.
    /// - Parameters:
    ///   - theme: The current Spark-Theme.
    ///   - component: The component is covered by formfield.
    ///   - feedbackState: The formfield feedback state. 'Default' or 'Error'.
    ///   - attributedTitle: The formfield attributedTitle.
    ///   - attributedDescription: The formfield attributed helper message.
    ///   - isTitleRequired: The asterisk symbol at the end of title.
    @available(*, deprecated, message: "Replaced by the init with the helper String since the 0.1.1.")
    public init(
        theme: any Theme,
        @ViewBuilder component: @escaping () -> Component,
        feedbackState: FormFieldFeedbackState = .default,
        attributedTitle: AttributedString? = nil,
        attributedDescription: AttributedString? = nil,
        isTitleRequired: Bool = false
    ) {
        self.init(
            theme: theme,
            component: component,
            feedbackState: feedbackState,
            attributedTitle: attributedTitle,
            attributedHelper: attributedDescription,
            isTitleRequired: isTitleRequired
        )
    }

    // MARK: - View

    public var body: some View {
        VStack(alignment: .leading, spacing: self.spacing) {
            let isAccessibilityStack = self.dynamicTypeSize.isAccessibilitySize && self.horizontalSizeClass == .compact

            // Header
            if self.viewModel.formattedTitle != nil || self.clearButton != nil {
                SparkAdaptiveStack(
                    axis: .horizontal,
                    alignment: .bottom,
                    spacing: self.spacing,
                    accessibilityAlignment: .trailing,
                    showAccessibilityStack: isAccessibilityStack
                ) {
                    // Title
                    if let formattedTitle = self.viewModel.formattedTitle?.rightValue {
                        Text(formattedTitle)
                            .titleFrame(isAccessibilityStack: isAccessibilityStack)
                            .accessibilityIdentifier(FormFieldAccessibilityIdentifier.formFieldTitle)
                            .accessibilitySortPriority(5)
                            .accessibilityLabel(optional: self.viewModel.titleAccessibilityLabel)
                            .accessibilityRespondsToUserInteraction(true)
                    }

                    SparkOptionalHStack(onStack: isAccessibilityStack) {
                        Spacer(minLength: 0)

                        // Clear Button
                        if let clearButton {
                            clearButton
                                .font(self.viewModel.clearButtonFont)
                                .foregroundStyle(self.viewModel.clearButtonColor)
                                .spacing(self.spacing)
                                .accessibilityIdentifier(FormFieldAccessibilityIdentifier.formFieldClearButton)
                                .accessibilitySortPriority(4)
                                .accessibilityLabel(optional: self.customClearButtonAccessibilityLabel)
                                .accessibilityRespondsToUserInteraction(true)
                                .layoutPriority(3)
                        }
                    }
                }
            }

            // Component
            self.component
                .accessibilityFocused(self.$isComponentFocused)
                .accessibilitySortPriority(3)
                .accessibilityRespondsToUserInteraction(true)

            // Footer
            if self.viewModel.helper != nil || self.viewModel.secondaryHelper != nil {
                SparkAdaptiveStack(
                    axis: .horizontal,
                    alignment: .top,
                    spacing: self.spacing,
                    accessibilityAlignment: .trailing,
                    showAccessibilityStack: isAccessibilityStack
                ) {
                    if let helper = self.viewModel.helper {
                        HStack(alignment: .top, spacing: self.spacing) {
                            self.helperImage?
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(
                                    width: self.iconSize,
                                    height: self.iconSize
                                )
                                .foregroundStyle(self.viewModel.helperColor.color)
                                .accessibilityIdentifier(FormFieldAccessibilityIdentifier.formFieldHelperImage)
                                .accessibilityHidden(true)

                            Text(helper)
                                .font(self.viewModel.helperFont.font)
                                .frame(minHeight: self.iconSize)
                                .foregroundStyle(self.viewModel.helperColor.color)
                                .titleFrame(isAccessibilityStack: isAccessibilityStack)
                                .accessibilityIdentifier(FormFieldAccessibilityIdentifier.formFieldHelperMessage)
                                .accessibilitySortPriority(2)
                                .accessibilityLabel(optional: self.customHelperAccessibilityLabel)
                                .accessibilityRespondsToUserInteraction(true)
                        }
                    }

                    SparkOptionalHStack(onStack: isAccessibilityStack) {
                        Spacer(minLength: 0)

                        if let secondaryHelper = self.viewModel.secondaryHelper {
                            Text(secondaryHelper)
                                .font(self.viewModel.secondaryHelperFont.font)
                                .foregroundStyle(self.viewModel.secondaryHelperColor.color)
                                .frame(minHeight: self.iconSize)
                                .accessibilityIdentifier(FormFieldAccessibilityIdentifier.formFieldSecondaryHelperMessage)
                                .accessibilitySortPriority(1)
                                .accessibilityLabel(optional: self.customSecondaryHelperAccessibilityLabel)
                                .accessibilityValue(optional: self.customSecondaryHelperAccessibilityValue)
                                .accessibilityRespondsToUserInteraction(true)
                        }
                    }
                }
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier(FormFieldAccessibilityIdentifier.formField)
    }

    // MARK: - Accessibility Modifier

    /// Set accessibility label for the *title* subview.
    /// - parameter label: the accessibility label.
    /// - Returns: The current view.
    public func titleAccessibilityLabel(_ label: String) -> Self {
        self.viewModel.customTitleAccessibilityLabel = label
        return self
    }

    /// Set accessibility label for the *clear button* subview.
    /// - parameter label: the accessibility label.
    /// - Returns: The current view.
    public func clearButtonAccessibilityLabel(_ label: String) -> Self {
        var copy = self
        copy.customClearButtonAccessibilityLabel = label
        return copy
    }

    /// Set accessibility label for the *helper* subview.
    /// - parameter label: the accessibility label.
    /// - Returns: The current view.
    public func helperAccessibilityLabel(_ label: String) -> Self {
        var copy = self
        copy.customHelperAccessibilityLabel = label
        return copy
    }

    /// Set accessibility label for the *secondaryHelper* subview.
    /// - parameter label: the accessibility label.
    /// - Returns: The current view.
    public func secondaryHelperAccessibilityLabel(_ label: String) -> Self {
        var copy = self
        copy.customSecondaryHelperAccessibilityLabel = label
        return copy
    }

    /// Set accessibility value for the *secondaryHelper* subview.
    /// - parameter value: the accessibility value.
    /// - Returns: The current view.
    public func secondaryHelperAccessibilityValue(_ value: String) -> Self {
        var copy = self
        copy.customSecondaryHelperAccessibilityValue = value
        return copy
    }

    // MARK: - Clear Button

    /// Add a clear button at the top right of the form field.
    /// - parameter title: the title of the clear button. **Optional**. If value is nil, a default localization value will be displayed (*clear/effacer*).
    /// - parameter icon: the icon of the clear button. **Optional**. If value is nil, no clear button is displayed.
    /// - parameter action: the action on button tap.
    /// - Returns: The current view.
    ///
    /// ![FormField rendering with clear button.](component_clear_button.png)
    public func clearButton(
        title: String? = nil,
        icon: Image?,
        action: @escaping @MainActor () -> Void
    ) -> Self {
        var copy = self
        if let icon {
            copy.clearButton = ClearButton(
                title: title,
                icon: icon,
                action: {
                    self.isComponentFocused = true
                    action()
                }
            )
        } else {
            copy.clearButton = nil
        }
        return copy
    }

    // MARK: - Counter Modifier

    /// Display a counter value (X/Y) in the secondary helper label with a text and the limit.
    /// - parameter text: the text where the characters must be counted.
    /// - parameter limit: the counter limit. If the value is nil, the counter is not displayed.
    /// - Returns: The current view.
    ///
    /// ![FormField rendering with counter.](component_counter.png)
    public func counter(on text: String, limit: Int?) -> Self {
        self.viewModel.setCounter(textLength: text.count, limit: limit)
        return self
    }

    /// Display a counter value (X/Y) in the secondary helper label with a text length and the limit.
    /// - parameter textLength: the text length.
    /// - parameter limit: the counter limit. If the value is nil, the counter is not displayed.
    /// - Returns: The current view.
    ///
    /// ![FormField rendering with counter.](component_counter.png)
    public func counter(on textLength: Int, limit: Int?) -> Self {
        self.viewModel.setCounter(textLength: textLength, limit: limit)
        return self
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func titleFrame(isAccessibilityStack: Bool) -> some View {
        if isAccessibilityStack {
            self.frame(maxWidth: .infinity, alignment: .leading)
        } else {
            self
        }
    }
}
