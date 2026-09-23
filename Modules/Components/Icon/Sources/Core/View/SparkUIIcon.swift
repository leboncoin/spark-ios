//
//  SparkUIIcon.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import Combine

/// The Icon shows a colored and scaled icon image.
///
/// ## Example of usage
/// 
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
/// let icon = SparkUIIcon(
///     theme: theme,
///     image: UIImage(systemName: "pencil")
/// )
/// icon.intent = .main
/// icon.size = .small
/// self.addSubview(icon)
/// ```
///
/// ## Accessibility
///
/// By default, the component is not accessible.
/// To override this value, you need to set the **isAccessibilityElement** to *true*.
///
/// In this case, an **accessibilityLabel** must be setted.
///
/// ## Rendering
///
/// ![Icon rendering.](icon_defaults.png)
public final class SparkUIIcon: UIImageView {

    // MARK: - Public Properties

    /// The spark theme of the icon.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// The intent of the icon.
    /// Check the ``IconIntent`` to see the **default** value.
    ///
    /// ![Icon rendering.](icon_intent_support.png)
    ///
    /// ![Icon rendering.](icon_intent_main.png)
    public var intent: IconIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// The size of the icon.
    /// Check the ``IconSize`` to see the **default** value.
    ///
    /// ![Icon rendering.](icon_size_small.png)
    ///
    /// ![Icon rendering.](icon_size_medium.png)
    public var size: IconSize = .default {
        didSet {
            self.viewModel.size = self.size
        }
    }

    // MARK: - Private Properties

    private let viewModel = IconViewModel()

    private var subscriptions = Set<AnyCancellable>()

    private var heightConstraint: NSLayoutConstraint?
    @ScaledUIFrame private var height: CGFloat = 0

    // MARK: - Initialization

    /// Create an icon with an image.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///   - image: The icon image.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    /// let icon = SparkUIIcon(
    ///     theme: theme,
    ///     image: UIImage(systemName: "pencil")
    /// )
    /// icon.intent = .main
    /// icon.size = .small
    /// self.addSubview(icon)
    /// ```
    ///
    /// ![Icon rendering.](icon_defaults.png)
    public init(theme: any Theme, image: UIImage?) {
        self.theme = theme

        super.init(image: image)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Properties
        self.tintAdjustmentMode = .normal
        self.accessibilityIdentifier = IconAccessibilityIdentifier.view

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Setup Accessibility
        self.setupAccessibility()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent,
            size: self.size
        )
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        // Size
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: self.height)
        self.heightConstraint?.isActive = false

        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // Tint Color
        self.viewModel.$tintColorToken.subscribe(in: &self.subscriptions) { [weak self] tintColorToken in
            guard let self else { return }

            self.tintColor(tintColorToken)
        }

        // Content Size
        self.viewModel.$contentSize.subscribe(in: &self.subscriptions) { [weak self] contentSize in
            guard let self else { return }

            self._height = .init(
                wrappedValue: contentSize,
                traitCollection: self.traitCollection
            )
            self.updateHeight()
        }
    }

    // MARK: - Update UI

    private func updateHeight() {
        self.heightConstraint?.constant = self.height
        self.heightConstraint?.isActive = true
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        self.isAccessibilityElement = false
        self.maximumContentSizeCategory = .large
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self._height.update(traitCollection: self.traitCollection)
        self.updateHeight()
    }
}
