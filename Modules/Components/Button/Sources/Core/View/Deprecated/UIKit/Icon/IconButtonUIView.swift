//
//  IconIconButtonUIView.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 10/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// The UIKit version for the icon button.
@available(*, deprecated, message: "Replaced by SparkButton")
public final class IconButtonUIView: ButtonMainUIView {

    // MARK: - Initialization

    /// Initialize a new button view.
    /// - Parameters:
    ///   - theme: The spark theme of the button.
    ///   - appearance: The appearance of the button.
    ///   - shape: The shape of the button.
    ///   - size: The size of the button.
    public convenience init(
        theme: any Theme,
        appearance: ButtonAppearance,
        size: ButtonSize,
        shape: ButtonShape
    ) {
        self.init(
            theme: theme,
            appearance: appearance,
            intent: .default,
            variant: .default,
            size: size,
            shape: shape
        )
    }

    /// Initialize a new button view.
    /// - Parameters:
    ///   - theme: The spark theme of the button.
    ///   - intent: The intent of the button.
    ///   - variant: The variant of the button.
    ///   - shape: The shape of the button.
    ///   - size: The size of the button.
    public convenience init(
        theme: any Theme,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize,
        shape: ButtonShape
    ) {
        self.init(
            theme: theme,
            appearance: nil,
            intent: intent,
            variant: variant,
            size: size,
            shape: shape
        )
    }

    private init(
        theme: any Theme,
        appearance: ButtonAppearance?,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize,
        shape: ButtonShape
    ) {
        let viewModel = IconButtonViewModelDeprecated(
            for: .uiKit,
            theme: theme,
            appearance: appearance,
            intent: intent,
            variant: variant,
            shape: shape,
            size: size
        )

        super.init(viewModel: viewModel)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    internal override func setupView() {
        // Accessibility
        self.accessibilityIdentifier = ButtonAccessibilityIdentifier.iconButton

        // Add subviews
        self.addSubview(self.imageView)

        super.setupView()
    }

    // MARK: - Constraints

    internal override func setupViewConstraints() {
        super.setupViewConstraints()

        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }

    internal override func setupImageViewConstraints() {
        super.setupImageViewConstraints()

        NSLayoutConstraint.activate([
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    // MARK: - Instrinsic Content Size

    public override var intrinsicContentSize: CGSize {
        return CGSize(
            width: self.height, // It is always a square
            height: self.height
        )
    }
}
