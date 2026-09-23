//
//  ProgressBarContainerUIView.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 18/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Combine
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// This ProgressBarContainerUIView view contains all communs subviews (track & indicator), styles, constraints, ... for all progress bars.
/// This view doesn't have a public init.
public class ProgressBarContainerUIView: UIView {

    // MARK: - Components

    internal let trackView = UIView()
    internal let indicatorView = UIView()

    // MARK: - Public Properties

    /// The spark theme of the progress bar.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// The intent of the progress bar.
    /// Check the ``ProgressBarIntent`` to see the **default** value.
    public var intent: ProgressBarIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// The shape of the progress bar.
    /// Check the ``ProgressBarShape`` to see the **default** value.
    public var shape: ProgressBarShape = .default {
        didSet {
            self.viewModel.shape = self.shape
        }
    }

    // MARK: - Private Properties

    private let viewModel: ProgressBarViewModel

    private var heightConstraint: NSLayoutConstraint?
    internal var indicatorWidthConstraint: NSLayoutConstraint?

    @ScaledUIFrame private var height: CGFloat = ProgressBarConstants.height
    @ScaledUIBorderRadius private var cornerRadius: CGFloat = .zero

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    internal init(
        theme: any Theme,
        viewModel: ProgressBarViewModel
    ) {
        self.theme = theme
        self.viewModel = viewModel

        super.init(frame: .zero)

        // Setup
        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    /// Setup the view: subviews, identifiers, constraints, UI.
    /// This method is internal because it can be overriden by the view that inherits from this class.
    internal func setupView() {
        // Add subviews
        self.addSubview(self.trackView)
        self.addSubview(self.indicatorView)

        // Accessibility
        self.isAccessibilityElement = true
        self.accessibilityIdentifier = ProgressBarAccessibilityIdentifier.view

        // View properties
        self.backgroundColor = .clear

        // Updates UI
        self.updateHeight()
        self.updateCornerRadius()

        // Setup constraints
        self.setupConstraints()

        // Setup subscriptions
        self.setupSubscriptions()
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.layoutIfNeeded()
        self.updateCornerRadius()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        // Global
        self.setupViewConstraints()

        // Subviews
        self.setupTrackConstraints()
        self.setupIndicatorConstraints()
    }

    private func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: .zero)
        self.heightConstraint?.isActive = true
    }

    private func setupTrackConstraints() {
        self.trackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.trackView,
            to: self
        )
    }

    /// Setup the indicator view constraints on the view (top, leading, trailing, trailing) and width (a percent of the view width).
    /// This method is internal because it can be overriden by the view that inherits from this class.
    internal func setupIndicatorConstraints() {
        self.setupSpecificIndicatorConstraints(
            &self.indicatorWidthConstraint,
            on: self.indicatorView
        )
    }

    /// Setup the some indicator view constraints on the view (top, leading, trailing, trailing) and width (a percent of the view width).
    /// - Parameters:
    ///   - widthConstraint: width layoutConstraint to set from the width of the view
    ///   - view: view to constrain
    private func setupSpecificIndicatorConstraints(
        _ widthConstraint: inout NSLayoutConstraint?,
        on view: UIView
    ) {
        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor)
        ])

        widthConstraint = view.widthAnchor.constraint(
            equalTo: self.trackView.widthAnchor
        )
        widthConstraint?.isActive = true
    }

    // MARK: - Update UI

    private func updateCornerRadius() {
        self.trackView.sparkCornerRadius(self.cornerRadius)
        self.indicatorView.sparkCornerRadius(self.cornerRadius)
    }

    private func updateHeight() {
        // Reload size only if value changed
        if self.height > 0 && self.height != self.heightConstraint?.constant {
            self.heightConstraint?.constant = self.height
            self.updateConstraintsIfNeeded()
        }
    }

    // MARK: - Subscribe

    /// This method is internal because it can be overriden by the view that inherits from this class
    internal func setupSubscriptions() {
        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            self.trackView.backgroundColor(colors.trackBackgroundColorToken)
            self.indicatorView.backgroundColor(colors.indicatorBackgroundColorToken)
        }

        // Corner Radius
        self.viewModel.$cornerRadius.subscribe(in: &self.subscriptions) { [weak self] cornerRadius in
            guard let self else { return }

            self._cornerRadius = .init(wrappedValue: cornerRadius)
            self._cornerRadius.update(traitCollection: self.traitCollection)

            self.updateCornerRadius()
        }
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self._height.update(traitCollection: self.traitCollection)
        self.updateHeight()

        self._cornerRadius.update(traitCollection: self.traitCollection)
        self.updateCornerRadius()
    }
}
