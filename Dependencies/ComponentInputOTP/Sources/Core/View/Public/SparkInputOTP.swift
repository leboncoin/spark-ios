//
//  SparkInputOTP.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit
import SparkResources
@_spi(SI_SPI) import SparkCommon

/// The Input OTP component allows users to enter a one-time security code.
///
/// The component displays individual slots for each digit and supports 4, 6, or 8 digits configurations.
///
/// ## Example of usage
///
/// ### Default (6 digits)
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var otpValue: String = ""
///
///     var body: some View {
///         SparkInputOTP(value: self.$otpValue)
///             .sparkTheme(self.theme)
///     }
/// }
/// ```
///
/// ### With 4 digits
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var otpValue: String = ""
///
///     var body: some View {
///         SparkInputOTP(value: self.$otpValue)
///             .sparkTheme(self.theme)
///             .sparkInputOTPDigits(.four)
///     }
/// }
/// ```
///
/// ### With error state
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var otpValue: String = ""
///     @State private var hasError: Bool = false
///
///     var body: some View {
///         SparkInputOTP(value: self.$otpValue)
///             .sparkTheme(self.theme)
///             .sparkInputOTPOnError(self.hasError)
///     }
/// }
/// ```
///
/// ### With completion handler
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var otpValue: String = ""
///
///     var body: some View {
///         SparkInputOTP(value: self.$otpValue) { completedValue in
///             // Perform validation or submit the OTP
///         }
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **digits** : ``sparkInputOTPDigits(_:)`` (View extension)
/// - **codeType** : ``sparkInputOTPCodeType(_:)`` (View extension)
/// - **onError** : ``sparkInputOTPOnError(_:)`` (View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// You should set an **accessibilityLabel** to give context to screen readers.
///
/// ## Rendering
///
/// ### Digits
///
/// | Default (6 digits) | 4 digits | 8 digits |
/// |:---:|:---:|:---:|
/// | ![InputOTP rendering with 6 digits.](inputOTP_digits_six.png) | ![InputOTP rendering with 4 digits.](inputOTP_digits_four.png) | ![InputOTP rendering with 8 digits.](inputOTP_digits_eight.png) |
///
/// ### Code Types
///
/// | Default (number) | Letter | Alphanumeric |
/// |:---:|:---:|:---:|
/// | ![InputOTP rendering with number code types](inputOTP_codetypes_number.png) | ![InputOTP rendering with letter code types](inputOTP_codetypes_letter.png) | ![InputOTP rendering with alphanumeric code types](inputOTP_codetypes_alphanumeric.png) |
///
/// ### States
///
/// | Default | On error | Disabled |
/// |:---:|:---:|:---:|
/// | ![InputOTP rendering with 6 digits.](inputOTP_digits_six.png) | ![InputOTP rendering with error state.](inputOTP_onError.png) | ![InputOTP rendering with disabled state.](inputOTP_isDisabled.png) |
///
public struct SparkInputOTP: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.inputOTPDigits) private var digits
    @Environment(\.inputOTPCodeType) private var codeType
    @Environment(\.inputOTPOnError) private var onError
    @Environment(\.isEnabled) private var isEnabled

    @Binding private var value: String

    private var onComplete: ((String) -> Void)?

    @StateObject private var viewModel = InputOTPViewModel()
    @FocusState private var isFocused: Bool
    @State private var lastCharacterIsFiltered: Bool = false

    // MARK: - Initialization

    /// Create an Input OTP component with a binding value.
    ///
    /// - Parameters:
    ///   - value: The binding String value for the OTP code.
    ///   - onComplete: Optional closure called when the OTP input is complete (all digits are filled).
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State private var otpValue: String = ""
    ///
    ///     var body: some View {
    ///         SparkInputOTP(value: self.$otpValue) { completedValue in
    ///             // Perform validation or submit the OTP
    ///         }
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![InputOTP rendering with 6 digits.](inputOTP_digits_six.png)
    ///
    public init(
        value: Binding<String>,
        onComplete: ((String) -> Void)? = nil
    ) {
        self._value = value
        self.onComplete = onComplete
    }

    // MARK: - View

    public var body: some View {
        ZStack {
            // Hidden text field for actual input
            TextField("", text: self.$value)
                .keyboardType(self.codeType.keyboardType)
                .textContentType(.oneTimeCode)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .opacity(.zero)
                .focused(self.$isFocused)
                .disabled(!self.isEnabled)

            // Visual representation
            SparkHStack(spacing: self.viewModel.layout.spacing) {
                ForEach(0..<self.digits.rawValue, id: \.self) { index in
                    if self.viewModel.getShowSeparator(at: index) {
                        self.separatorView
                    }
                    self.slotView(at: index)
                }
            }
            .sparkPadding(self.viewModel.layout.padding)
            .contextMenu {
                Button(action: self.handlePaste) {
                    Label {
                        Text(String.contextMenuPasteAction)
                    } icon: {
                        Image(spark: \.copyOutline)
                    }
                }
            }
            .onTapGesture(
                count: 2,
                perform: self.handlePaste
            )
            .onTapGesture(count: 1) {
                self.isFocused = true
            }
        }
        .opacity(Double(self.viewModel.dim))
        .sparkSensoryFeedback(
            .error,
            trigger: self.onError,
            condition: { oldValue, newValue in
                oldValue != newValue && newValue
            }
        )
        .sparkSensoryFeedback(
            .impact(style: .light),
            trigger: self.value,
            condition: { oldValue, newValue in
                oldValue != newValue && !self.lastCharacterIsFiltered
            }
        )
        .sparkSensoryFeedback(
            .error,
            trigger: self.value,
            condition: { _, _ in
                self.lastCharacterIsFiltered
            }
        )
        .accessibilityIdentifier(InputOTPAccessibilityIdentifier.view)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(
            digits: self.digits,
            codeType: self.codeType
        )
        .accessibilityValue(
            value: self.value,
            digits: self.digits,
            codeType: self.codeType,
            onError: self.onError
        )
        .accessibilityHint(
            value: self.value,
            digits: self.digits,
            codeType: self.codeType,
            onError: self.onError
        )
        .accessibilityAddTraits(.updatesFrequently)
        .accessibilityAddTraits(.allowsDirectInteraction)
        .accessibilityActions {
            if !self.value.isEmpty {
                Button(String.accessibilityClearAllAction) {
                    self.handleClearAll()
                }
            }
            if UIPasteboard.general.hasStrings {
                Button(String.accessibilityPasteAction) {
                    self.handlePaste()
                }
            }
        }
        .dynamicTypeSize(...DynamicTypeSize.large)
        .onAppear {
            self.isFocused = true

            self.viewModel.setup(
                theme: self.theme.value,
                digits: self.digits,
                isEnabled: self.isEnabled
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.digits) { digits in
            self.viewModel.digits = digits
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
        .onChange(of: self.value) { newValue in
            self.validateAndTruncateValue(newValue)

            if newValue.count == self.digits.rawValue {
                self.isFocused = false
                self.onComplete?(newValue)
            }
        }
    }

    // MARK: - Private Views

    private var separatorView: some View {
        Capsule()
            .fill(self.viewModel.colors.separatorColorToken)
            .sparkFrame(
                width: InputOTPConstants.SeparatorSize.width,
                height: InputOTPConstants.SeparatorSize.height
            )
    }

    private func slotView(at index: Int) -> some View {
        let value = self.viewModel.getSlotValue(value: self.value, at: index)

        return InputOTPSlot(
            value: value,
            onError: self.onError,
            isFocus: self.isFocused && index == self.value.count,
            typographies: self.viewModel.typographies
        )
    }

    // MARK: - Private Helpers

    private func handlePaste() {
        guard let pastedString = UIPasteboard.general.string else { return }
        self.value = pastedString
        self.isFocused = true
    }

    private func handleClearAll() {
        self.value = ""
        self.isFocused = true
    }

    private func validateAndTruncateValue(_ newValue: String) {
        let validatedResult = self.viewModel.getValidatedValue(
            value: newValue,
            codeType: self.codeType
        )

        self.lastCharacterIsFiltered = validatedResult.hadInvalidCharacters

        if validatedResult.value != newValue {
            self.value = validatedResult.value
        }
    }
}
