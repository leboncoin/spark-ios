//
//  IconButtonView.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 24/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import Foundation
@_spi(SI_SPI) import SparkCommon
import SparkTheming

@available(*, deprecated, message: "Replaced by SparkButton")
public struct IconButtonView: View {

    // MARK: - Private Properties

    @ObservedObject private var viewModel: IconButtonSUIViewModelDeprecated
    private var largeContentTitle: String?

    private var action: () -> Void

    // MARK: - Initialization

    /// Initialize a new button view.
    /// - Parameters:
    ///   - theme: The spark theme of the button.
    ///   - appearance: The appearance of the button.
    ///   - size: The size of the button.
    ///   - shape: The shape of the button.
    ///   - action: The action of the button.
    public init(
        theme: any Theme,
        appearance: ButtonAppearance,
        size: ButtonSize,
        shape: ButtonShape,
        action: @escaping () -> Void
    ) {
        self.init(
            theme: theme,
            appearance: appearance,
            intent: .default,
            variant: .default,
            size: size,
            shape: shape,
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
    ///   - action: The action of the button.
    public init(
        theme: any Theme,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize,
        shape: ButtonShape,
        action: @escaping () -> Void
    ) {
        self.init(
            theme: theme,
            appearance: nil,
            intent: intent,
            variant: variant,
            size: size,
            shape: shape,
            action: action
        )
    }

    private init(
        theme: any Theme,
        appearance: ButtonAppearance? = nil,
        intent: ButtonIntent = .default,
        variant: ButtonVariant = .default,
        size: ButtonSize,
        shape: ButtonShape,
        action: @escaping () -> Void
    ) {
        let viewModel = IconButtonSUIViewModelDeprecated(
            theme: theme,
            appearance: appearance,
            intent: intent,
            variant: variant,
            shape: shape,
            size: size
        )
        self.viewModel = viewModel

        self.action = action
    }

    // MARK: - View

    public var body: some View {
        ButtonContainerView(
            viewModel: self.viewModel,
            action: self.action
        ) {
            ButtonImageView(viewModel: self.viewModel)
        }
        .accessibilityShowsLargeContentViewer {
            if let largeContentTitle {
                Text(largeContentTitle)
            }

            self.viewModel.controlStateImage.image
        }
    }

    // MARK: - Modifier

    /// Set the image of the button for a state.
    /// - parameter image: new image of the button
    /// - parameter state: state of the image
    /// - Returns: Current Button View.
    public func image(_ image: Image?, for state: ControlState) -> Self {
        self.viewModel.setImage(image, for: state)
        return self
    }

    /// Set the button to disabled.
    /// - Parameters:
    ///   - text: The button is disabled or not.
    /// - Returns: Current Button View.
    public func disabled(_ isDisabled: Bool) -> Self {
        self.viewModel.setIsDisabled(isDisabled)

        return self
    }

    /// Set the switch to selected.
    /// - Parameters:
    ///   - text: The switch is selected or not.
    /// - Returns: Current Button View.
    public func selected(_ isSelected: Bool) -> Self {
        self.viewModel.setIsSelected(isSelected)

        return self
    }

    /// Set a text to add a context on **accessibilityShowsLargeContentViewer**.
    /// - Parameters:
    ///   - text: The text displayed on the accessibilityShowsLargeContentViewer.
    /// - Returns: Current Button View.
    public func accessibilityLargeContentText(_ text: String) -> Self {
        var copy = self
        copy.largeContentTitle = text
        return copy
    }
}
