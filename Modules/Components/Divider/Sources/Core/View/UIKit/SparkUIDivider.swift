//
//  SparkUIDivider.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 13/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import Combine

/// The Divider component provides a thin, unobtrusive line that separates
/// and distinguishes sections of content to reinforce visual hierarchy.
///
/// ## Example of usage
///
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
/// let divider = SparkUIDivider(
///     theme: theme
/// )
/// divider.alignment = .bottom
/// divider.axis = .vertical
/// divider.intent = .outline
/// divider.alignment = .vertical
/// divider.text = "My divider"
/// self.addSubview(divider)
/// ```
///
/// ## Accessibility
///
/// If the there is no text the component is not accessible : the *isAccessibilityElement* is **false**.
/// Otherwise, the *accessibilityLabel* corresponding to the text.
///
/// To override this value, you need to set a new **accessibilityLabel**.
/// > You need to reset the your custom **accessibilityLabel** each time your update
/// the ``text``/``attributedText``.
///
/// ## Rendering
///
/// Without a text:
///
/// ![Divider rendering.](divider_without_text.png)
///
/// With a text:
///
/// ![Divider rendering.](divider_with_text.png)
///
/// Axis:
///
/// ![Divider rendering.](divider_axis_horizontal.png)
///
/// ![Divider rendering.](divider_axis_vertical.png)
///
/// Alignment:
///
/// ![Divider rendering.](divider_alignment_top.png)
///
/// ![Divider rendering.](divider_alignment_trailing.png)
///
/// Intents:
///
/// ![Divider rendering.](divider_intent_outline.png)
///
/// ![Divider rendering.](divider_intent_outlineHigh.png)
/// 
public final class SparkUIDivider: UIView {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                self.firstSeparatorView,
                self.textLabel,
                self.lastSeparatorView
            ]
        )
        stackView.alignment = .center
        stackView.isAccessibilityElement = false
        return stackView
    }()

    private var firstSeparatorView = DividerSeparatorUIView(
        position: .first
    )

    /// The UILabel used to display the divider text.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``text`` and ``attributedText`` directly on the ``SparkUIDivider``.
    ///
    /// If the there is no text the component is not accessible : the *isAccessibilityElement* is **false**.
    /// Otherwise, the *accessibilityLabel* corresponding to the text.
    public private(set) var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontForContentSizeCategory = true
        label.isHidden = true
        return label
    }()

    private var lastSeparatorView: DividerSeparatorUIView = {
        let view = DividerSeparatorUIView(position: .last)
        view.isHidden = true
        return view
    }()

    private var separatorViews: [DividerSeparatorUIView] {
        self.contentStackView.arrangedSubviews.compactMap { $0 as? DividerSeparatorUIView }
    }

    // MARK: - Public Properties

    /// The spark theme of the divider.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// The alignment of the divider.
    /// Check the ``DividerAlignment`` to see the **default** value.
    public var alignment: DividerAlignment = .default {
        didSet {
            self.viewModel.alignment = self.alignment
        }
    }

    /// The axis of the divider.
    /// Check the ``DividerAxis`` to see the **default** value.
    public var axis: DividerAxis = .default {
        didSet {
            self.viewModel.axis = self.axis
            self.contentStackView.axis = self.axis.uikit

            self.updateSeparatorsConstraints()
            self.separatorViews.axis(self.axis)
        }
    }

    /// The intent of the divider.
    /// Check the ``DividerIntent`` to see the **default** value.
    public var intent: DividerIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// The text of the divider.
    /// The position depends of the ``DividerAlignment`` value.
    ///
    /// > This will also change the **accessibilityLabel** of the components.
    public var text: String? {
        get {
            return self.textLabel.text
        }
        set {
            self.textLabel.text(newValue)
            self.updateSeparatorsVisibility()
            self.updateAccessibilityLabel()
        }
    }

    /// The attributed text of the divider.
    /// The position depends of the ``DividerAlignment`` value.
    ///
    /// > This will also change the **accessibilityLabel** of the components.
    public var attributedText: NSAttributedString? {
        get {
            return self.textLabel.attributedText
        }
        set {
            self.textLabel.attributedText(newValue)
            self.updateSeparatorsVisibility()
            self.updateAccessibilityLabel()
        }
    }

    // MARK: - Private Properties

    private let viewModel = DividerViewModel()

    private var subscriptions = Set<AnyCancellable>()

    @LimitedScaledUIMetric private var spacing: CGFloat = 0

    // MARK: - Initialization

    /// Creates a Spark divider.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    /// let divider = SparkUIDivider(
    ///     theme: theme
    /// )
    /// divider.alignment = .bottom
    /// divider.axis = .vertical
    /// divider.intent = .outline
    /// divider.alignment = .vertical
    /// divider.text = "My divider"
    /// self.addSubview(divider) 
    /// ```
    ///
    /// ![Divider rendering.](divider_with_text.png)
    public init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Properties
        self.accessibilityIdentifier = DividerAccessibilityIdentifier.view

        // Add subview
        self.addSubview(self.contentStackView)

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Setup Accessibility
        self.setupAccessibility()

        // Update
        self.updateAccessibilityLabel()
        self.updateSeparatorsVisibility()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            alignment: self.alignment,
            axis: self.axis,
            intent: self.intent
        )
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.setupContentStackViewConstraints()
        self.setupSeparatorsViewConstraints()
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    private func setupSeparatorsViewConstraints() {
        self.firstSeparatorView.setupSameSizesViewConstraints(to: self.lastSeparatorView)
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            self.textLabel.textColor(colors.text)
            self.separatorViews.backgroundColor(colors.separator)
        }

        // Separator Width Types
        self.viewModel.$separatorWidthTypes.subscribe(in: &self.subscriptions) { [weak self] separatorWidthTypes in
            guard let self else { return }

            self.updateSeparatorsConstraints()
            self.separatorViews.widthTypes(separatorWidthTypes)
        }

        // Spacing
        self.viewModel.$spacing.subscribe(in: &self.subscriptions) { [weak self] spacing in
            guard let self else { return }

            self._spacing = .init(
                wrappedValue: spacing,
                traitCollection: self.traitCollection
            )

            self.updateLayout()
        }

        // Text Font
        self.viewModel.$textFont.subscribe(in: &self.subscriptions) { [weak self] textFont in
            guard let self else { return }

            self.textLabel.font(textFont)
        }
    }

    // MARK: - Update UI

    private func updateLayout() {
        self.contentStackView.spacing = self.spacing
    }

    private func updateSeparatorsVisibility() {
        self.lastSeparatorView.isHidden = self.textLabel.isHidden
    }

    private func updateSeparatorsConstraints() {
        self.separatorViews.deactivateConstraints()
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        self.maximumContentSizeCategory = .accessibilityExtraLarge
    }

    private func updateAccessibilityLabel() {
        self.isAccessibilityElement = !self.textLabel.isHidden
        self.accessibilityLabel = self.textLabel.text
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self._spacing.update(traitCollection: self.traitCollection)
        self.updateLayout()
    }
}
