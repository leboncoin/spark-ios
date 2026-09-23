//
//  SelectionControlsGroup.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 10/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Combine
import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark group control only used by the ``SparkUICheckboxGroup`` and ``SparkUIRadioGroup``.
///
/// - No **init** is **public**.
///
/// Inherits:
/// - This component inherits from **UIControl**.
/// - The ID is a ``SelectionControlsGroupID`` which inherits from **Equatable**, **Hashable** and **CustomStringConvertible**.
public class SelectionControlsGroup<ID>: UIControl where ID: SelectionControlsGroupID {

    // MARK: - Components

    internal var contentStackView = SparkAdaptiveUIStackView()

    // MARK: - Public Properties

    /// The spark theme of the group.
    public var theme: any Theme {
        get {
            return self.viewModel.theme
        }
        set {
            self.viewModel.theme = newValue
        }
    }

    /// The intent of the group.
    public var intent: SelectionControlsIntent = .default

    /// The axis of the group.
    public var axis: SelectionControlsAxis {
        get {
            return self.viewModel.axis
        }
        set {
            self.viewModel.axis = newValue
            self.updateContentStack()
        }
    }

    // MARK: - Private Properties

    private let viewModel: CommonGroupUIViewModel

    @LimitedScaledUIMetric private var contentSpacing: CGFloat = 0

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    internal init(theme: any Theme) {
        self.viewModel = .init(
            theme: theme
        )

        super.init(frame: .zero)

        // Setup
        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Add subview
        self.addSubview(self.contentStackView)

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Updates
        self.updateContentStack()

        // Load view model
        self.viewModel.load(
            isAccessibilitySize: self.traitCollection.preferredContentSizeCategory.isAccessibilityCategory
        )
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.setupContentStackViewConstraints()
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self
        )
    }

    // MARK: - Update UI

    private func updateContentStack() {
        switch self.axis {
        case .vertical:
            self.contentStackView.regularAxis = .vertical
            self.contentStackView.accessibilityAxis = .vertical

            self.contentStackView.regularAlignment = .leading
            self.contentStackView.accessibilityAlignment = .leading

        case .horizontal:
            self.contentStackView.regularAxis = .horizontal
            self.contentStackView.accessibilityAxis = .vertical

            self.contentStackView.regularAlignment = .top
            self.contentStackView.accessibilityAlignment = .leading
        }
    }

    private func updateContentStackSpacing() {
        if self.contentSpacing != self.contentStackView.spacing {
            self.contentStackView.spacing = self.contentSpacing
        }
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // **
        // Spacing
        self.viewModel.$spacing.subscribe(in: &self.subscriptions) { [weak self] spacing in
            guard let self else { return }

            self._contentSpacing = .init(wrappedValue: spacing, traitCollection: self.traitCollection)
            self.updateContentStackSpacing()
        }
        // **
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self.viewModel.isAccessibilitySize = self.traitCollection.preferredContentSizeCategory.isAccessibilityCategory

        // Update sizes
        self._contentSpacing.update(traitCollection: self.traitCollection)
        self.updateContentStackSpacing()
    }
}
