//
//  SnackbarView.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 13/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
import Combine
import SparkTheming
import SparkComponentButton
@_spi(SI_SPI) import SparkCommon

/// The SwiftUI version of the Snackbar.
@available(*, deprecated, message: "Replaced by SparkSnackbar")
public struct SnackbarView<SnackbarButton>: View where SnackbarButton: View  {

    public struct ButtonConfiguration {
        public let intent: ButtonIntent
        public let variant: ButtonVariant
        public let size: ButtonSize
        public let shape: ButtonShape
    }

    private let image: Image?
    private let text: () -> Text

    private var type: SnackbarType
    private var variant: SnackbarVariant

    @ViewBuilder private var button: () -> SnackbarButton?

    @ObservedObject private var viewModel: SnackbarViewModelDeprecated

    private init(
        theme: any Theme,
        intent: SnackbarIntent,
        type: SnackbarType,
        variant: SnackbarVariant,
        image: Image?,
        text: @escaping () -> Text,
        button: ((ButtonView) -> SnackbarButton)? = nil,
        action: (() -> Void)? = nil,
        buttonConfiguration: ((SnackbarView.ButtonConfiguration) -> SnackbarButton)? = nil
    ) {
        self.type = type
        self.variant = variant

        let viewModel = SnackbarViewModelDeprecated(
            theme: theme,
            variant: variant,
            intent: intent
        )
        self.viewModel = viewModel

        self.image = image
        self.text = text

        if let buttonConfiguration {
            self.button = {
                buttonConfiguration(
                    .init(
                        intent: viewModel.buttonIntent,
                        variant: viewModel.buttonVariant,
                        size: SnackbarConstants.buttonSize,
                        shape: SnackbarConstants.buttonShape
                    )
                )
            }
        } else if let button, let action {
            self.button = {
                button(
                    ButtonView(
                        theme: viewModel.theme,
                        intent: viewModel.buttonIntent,
                        variant: viewModel.buttonVariant,
                        size: SnackbarConstants.buttonSize,
                        shape: SnackbarConstants.buttonShape,
                        alignment: .leadingImage,
                        action: action
                    )
                )
            }
        } else {
            self.button = { nil }
        }
    }

    /// Initialize a new snackbar view without button.
    /// - Parameters:
    ///   - theme: The spark theme of the snackbar.
    ///   - intent: The intent of the snackbar.
    ///   - image: The image of the snackbar. The default is ``nil``.
    ///   - text: The text of the snackbar.
    public init(
        theme: any Theme,
        intent: SnackbarIntent,
        image: Image? = nil,
        text: @escaping () -> Text
    ) where SnackbarButton == EmptyView {
        self.init(
            theme: theme,
            intent: intent,
            type: .vertical,
            variant: .filled,
            image: image,
            text: text
        )
    }

    /// Initialize a new snackbar view with a `SnackbarButton`.
    /// - Parameters:
    ///   - theme: The spark theme of the snackbar.
    ///   - intent: The intent of the snackbar.
    ///   - image: The image of the snackbar. The default is ``nil``.
    ///   - text: The text of the snackbar.
    ///   - button: The button builder. It has as a parameter the expected returned ButtonView's configuration.
    public init(
        theme: any Theme,
        intent: SnackbarIntent,
        image: Image? = nil,
        text: @escaping () -> Text,
        button: @escaping (SnackbarView.ButtonConfiguration) -> SnackbarButton
    ) {
        self.init(
            theme: theme,
            intent: intent,
            type: .vertical,
            variant: .filled,
            image: image,
            text: text,
            buttonConfiguration: button
        )
    }

    /// Initialize a new snackbar view with a `SnackbarButton`.
    /// - Parameters:
    ///   - theme: The spark theme of the snackbar.
    ///   - intent: The intent of the snackbar.
    ///   - image: The image of the snackbar. The default is ``nil``.
    ///   - text: The text of the snackbar.
    ///   - button: The button builder. It has as a parameter the expected returned ButtonView.
    ///   - action: The button's action.
    public init(
        theme: any Theme,
        intent: SnackbarIntent,
        image: Image? = nil,
        text: @escaping () -> Text,
        button: @escaping (ButtonView) -> SnackbarButton,
        action: @escaping () -> Void
    ) {
        self.init(
            theme: theme,
            intent: intent,
            type: .vertical,
            variant: .filled,
            image: image,
            text: text,
            button: button,
            action: action
        )
    }

    public var body: some View {
        ZStack {
            self.viewModel.colors.backgroundColorToken.color
            VStack {
                self.content()
            }
            .padding(.leading, self.viewModel.theme.layout.spacing.large)
            .padding(.trailing, self.viewModel.theme.layout.spacing.medium)
        }
        .sparkBorder(
            width: self.viewModel.border.width,
            radius: self.viewModel.border.radius,
            colorToken: self.viewModel.colors.borderColorToken
        )
        .shadow(self.viewModel.theme.elevation.dropShadow)
        .compositingGroup()
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier(SnackbarAccessibilityIdentifier.view)
    }

    @ViewBuilder
    private func content() -> some View {
        switch self.type {
        case .horizontal:
            self.horizontalContent()
        case .vertical:
            self.verticalContent()
        }
    }

    @ViewBuilder
    private func horizontalContent() -> some View {
        HStack(alignment: .center, spacing: self.viewModel.theme.layout.spacing.medium) {
            if let image {
                self.styledImage(image)
            }
            if let button = self.button() {
                self.styledText()
                button
                    .padding([.top, .bottom], self.viewModel.theme.layout.spacing.medium)
            } else {
                self.styledText()
                    .padding(.trailing, self.viewModel.theme.layout.spacing.large - self.viewModel.theme.layout.spacing.medium)
            }
        }
    }

    @ViewBuilder
    private func verticalContent() -> some View {
        VStack(alignment: .trailing, spacing: 0) {
            HStack(alignment: .center, spacing: self.viewModel.theme.layout.spacing.medium) {
                if let image {
                    self.styledImage(image)
                }
                self.styledText()
                    .padding(.trailing, (self.viewModel.theme.layout.spacing.large - self.viewModel.theme.layout.spacing.medium))
            }
            if let button = self.button() {
                button
                    .padding(.bottom, self.viewModel.theme.layout.spacing.medium)
                    .padding(.top, -(self.viewModel.theme.layout.spacing.large - self.viewModel.theme.layout.spacing.medium))
            }
        }
    }

    @ViewBuilder
    private func styledImage(_ image: Image) -> some View {
        image
            .resizable()
            .frame(width: SnackbarConstants.iconSize, height: SnackbarConstants.iconSize)
            .foregroundStyle(self.viewModel.colors.tintColorToken)
    }

    @ViewBuilder
    private func styledText() -> some View {
        self.text()
            .font(self.viewModel.textFont.font)
            .foregroundStyle(self.viewModel.colors.tintColorToken)
            .accessibilityIdentifier(SnackbarAccessibilityIdentifier.label)
            .padding([.top, .bottom], self.viewModel.theme.layout.spacing.large)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityIdentifier(SnackbarAccessibilityIdentifier.label)
    }

    /// Snackbar's theme modifier.
    /// - Parameter theme: The modified spark theme for the snackbar.
    /// - Returns: The updated snackbar.
    public func theme(_ theme: any Theme) -> Self {
        self.viewModel.theme = theme
        return self
    }

    /// Snackbar's intent modifier.
    /// - Parameter intent: The modified intent for the snackbar.
    /// - Returns: The updated snackbar.
    public func intent(_ intent: SnackbarIntent) -> Self {
        guard intent != self.viewModel.intent else { return self }
        self.viewModel.intent = intent
        return self
    }

    /// Snackbar's variant modifier.
    /// - Parameter variant: The modified variant for the snackbar.
    /// - Returns: The updated snackbar.
    public func variant(_ variant: SnackbarVariant) -> Self {
        guard variant != self.viewModel.variant else { return self }
        self.viewModel.variant = variant
        return self
    }

    /// Snackbar's type modifier.
    /// - Parameter type: The modified type for the snackbar.
    /// - Returns: The updated snackbar.
    public func type(_ type: SnackbarType) -> Self {
        guard type != self.type else { return self }
        var copy = self
        copy.type = type
        return copy
    }
}
