//
//  ButtonView.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 20/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import Foundation
@_spi(SI_SPI) import SparkCommon
import SparkTheming

@available(*, deprecated, message: "Replaced by SparkButton")
public struct ButtonView: View {

    // MARK: - Private Properties

    @ObservedObject private var viewModel: ButtonSUIViewModelDeprecated

    @LimitedScaledMetric private var horizontalSpacing: CGFloat
    @LimitedScaledMetric private var horizontalPadding: CGFloat

    private var action: () -> Void

    // MARK: - Initialization

    /// Initialize a new button view.
    /// - Parameters:
    ///   - theme: The spark theme of the button.
    ///   - appearance: The appearance of the button.
    ///   - size: The size of the button.
    ///   - shape: The shape of the button.
    ///   - alignment: The alignment of the button.
    ///   - action: The action of the button.
    public init(
        theme: any Theme,
        appearance: ButtonAppearance,
        size: ButtonSize,
        shape: ButtonShape,
        alignment: ButtonAlignment,
        action: @escaping () -> Void
    ) {
        self.init(
            theme: theme,
            appearance: appearance,
            intent: .default,
            variant: .default,
            size: size,
            shape: shape,
            alignment: alignment,
            action: action
        )
    }

    /// Initialize a new button view.
    /// - Parameters:
    ///   - theme: The spark theme of the button.
    ///   - intent: The intent of the button.
    ///   - variant: The variant of the button.
    ///   - size: The size of the button.
    ///   - shape: The shape of the button.
    ///   - alignment: The alignment of the button.
    ///   - action: The action of the button.
    public init(
        theme: any Theme,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize,
        shape: ButtonShape,
        alignment: ButtonAlignment,
        action: @escaping () -> Void
    ) {
        self.init(
            theme: theme,
            appearance: nil,
            intent: intent,
            variant: variant,
            size: size,
            shape: shape,
            alignment: alignment,
            action: action
        )
    }

    private init(
        theme: any Theme,
        appearance: ButtonAppearance?,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize,
        shape: ButtonShape,
        alignment: ButtonAlignment,
        action: @escaping () -> Void
    ) {
        let viewModel = ButtonSUIViewModelDeprecated(
            theme: theme,
            appearance: appearance,
            intent: intent,
            variant: variant,
            shape: shape,
            size: size,
            alignment: alignment
        )
        self.viewModel = viewModel

        // **
        // Scaled Metric
        self._horizontalSpacing = .init(value: viewModel.layout?.horizontalSpacing ?? .zero)
        self._horizontalPadding = .init(value: viewModel.layout?.horizontalPadding ?? .zero)
        // **

        self.action = action
    }

    // MARK: - View

    public var body: some View {
        ButtonContainerView(
            viewModel: self.viewModel,
            padding: .init(
                horizontal: self.viewModel.controlStateText?.isText == true ? self.horizontalSpacing : .zero
            ),
            action: self.action
        ) {
            self.content()
        }
    }

    // MARK: - View Builder

    @ViewBuilder
    private func content() -> some View {
        HStack(
            alignment: .center,
            spacing: self.horizontalPadding
        ) {
            if self.viewModel.isImageTrailing {
                self.title()
                self.image()
            } else {
                self.image()
                self.title()
            }
        }
        .frame(
            maxWidth: self.viewModel.maxWidth,
            alignment: self.viewModel.frameAlignment
        )
        .animation(nil, value: self.viewModel.maxWidth)
        .animation(nil, value: self.viewModel.frameAlignment)
    }

    @ViewBuilder
    private func image() -> some View {
        ButtonImageView(viewModel: self.viewModel)
    }

    @ViewBuilder
    private func title() -> some View {
        if let text = self.viewModel.controlStateText?.text {
            Text(text)
                .foregroundStyle(self.viewModel.colors?.tintColor.color ?? ColorTokenDefault.clear.color)
                .font(self.viewModel.titleFontToken?.font)
                .accessibilityIdentifier(ButtonAccessibilityIdentifier.text)
                .animation(nil, value: text)
        } else if let attributedText = self.viewModel.controlStateText?.attributedText {
            Text(attributedText)
                .accessibilityIdentifier(ButtonAccessibilityIdentifier.text)
                .animation(nil, value: attributedText)
        } else {
            EmptyView()
        }
    }

    // MARK: - Modifier

    /// Update the frame of the button for a state.
    /// - Parameters:
    ///   - maxWidth: The maximum width of the resulting frame.
    ///   - alignment: The alignment of this view inside the resulting frame.
    ///     Note that most alignment values have no apparent effect when the
    ///     size of the frame happens to match that of this view.
    ///
    /// - Returns: A view with flexible dimensions given by the call's non-`nil`
    ///   parameters.
    public func frame(maxWidth: CGFloat? = nil, alignment: Alignment = .center) -> Self {
        self.viewModel.maxWidth = maxWidth
        self.viewModel.frameAlignment = alignment
        return self
    }

    /// Set the image of the button for a state.
    /// - parameter image: new image of the button
    /// - parameter state: state of the image
    /// - Returns: Current Button View.
    public func image(_ image: Image?, for state: ControlState) -> Self {
        self.viewModel.setImage(image, for: state)
        return self
    }

    /// Set the title of the button for a state.
    /// - parameter title: new title of the button
    /// - parameter state: state of the title
    /// - Returns: Current Button View.
    public func title(_ title: String?, for state: ControlState) -> Self {
        self.viewModel.setTitle(
            title,
            for: state
        )

        return self
    }

    /// Set the attributedTitle of the button for a state.
    /// - parameter attributedTitle: new attributedTitle of the button
    /// - parameter state: state of the attributedTitle
    /// - Returns: Current Button View.
    public func attributedTitle(_ attributedTitle: AttributedString?, for state: ControlState) -> Self {
        self.viewModel.setAttributedTitle(
            attributedTitle,
            for: state
        )

        return self
    }

    /// Set the button to disabled.
    /// - Parameters:
    ///   - isDisabled: The button is disabled or not.
    /// - Returns: Current Button View.
    public func disabled(_ isDisabled: Bool) -> Self {
        self.viewModel.setIsDisabled(isDisabled)

        return self
    }

    /// Set the button to selected.
    /// - Parameters:
    ///   - isSelected: The switch is selected or not.
    /// - Returns: Current Button View.
    public func selected(_ isSelected: Bool) -> Self {
        self.viewModel.setIsSelected(isSelected)

        return self
    }
}
