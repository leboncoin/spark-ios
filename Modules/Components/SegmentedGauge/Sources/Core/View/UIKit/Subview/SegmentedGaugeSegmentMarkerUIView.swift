//
//  SegmentedGaugeSegmentMarkerUIView.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import Combine

final class SegmentedGaugeSegmentMarkerUIView: UIView {

    // MARK: - Components

    private lazy var innerCircleView = {
        let view = UIView()
        view.accessibilityIdentifier = SegmentedGaugeAccessibilityIdentifier.markerInnerView
        return view
    }()

    // MARK: - Properties

    var colors = SegmentedGaugeColors() {
        didSet {
            self.setColors()
        }
    }

    var sizes = SegmentedGaugeSizes() {
        didSet {
            self.setSizes()
        }
    }

    override var isHidden: Bool {
        didSet {
            self.updateSizes()
        }
    }

    // MARK: - Private Properties

    private var heightConstraint: NSLayoutConstraint?

    private var innerCircleHeightConstraint: NSLayoutConstraint?

    private var innerCircleCenterXConstraint: NSLayoutConstraint?
    private var innerCircleCenterYConstraint: NSLayoutConstraint?

    @ScaledUIFrame private var height: CGFloat = 0

    @ScaledUIFrame private var innerCircleHeight: CGFloat = 0

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Properties
        self.accessibilityIdentifier = SegmentedGaugeAccessibilityIdentifier.markerOuterView

        // Add subviews
        self.addSubview(self.innerCircleView)

        // Setup constraints
        self.setupConstraints()
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        self.updateCornerRadius()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.setupViewConstraints()
        self.setupInnerCircleConstraints()
    }

    private func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        // Size
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: self.height)
        self.heightConstraint?.isActive = false

        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }

    private func setupInnerCircleConstraints() {
        self.innerCircleView.translatesAutoresizingMaskIntoConstraints = false

        // Size
        self.innerCircleHeightConstraint = self.innerCircleView.heightAnchor.constraint(
            equalToConstant: self.innerCircleHeight
        )
        self.innerCircleHeightConstraint?.isActive = false

        self.innerCircleView.widthAnchor.constraint(
            equalTo: self.innerCircleView.heightAnchor
        ).isActive = true

        // Position
        self.innerCircleCenterXConstraint = self.innerCircleView.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        )
        self.innerCircleCenterXConstraint?.isActive = false

        self.innerCircleCenterYConstraint = self.innerCircleView.centerYAnchor.constraint(
            equalTo: self.centerYAnchor
        )
        self.innerCircleCenterYConstraint?.isActive = false
    }

    // MARK: - Setter

    private func setSizes() {
        // Set sizes
        self._height = .init(
            wrappedValue: self.sizes.markerOuterSize,
            traitCollection: self.traitCollection
        )

        self._innerCircleHeight = .init(
            wrappedValue: self.sizes.markerInnerSize,
            traitCollection: traitCollection
        )

        // Update styles
        self.updateSizes()
        self.updateCornerRadius()
    }

    private func setColors() {
        self.backgroundColor(self.colors.markerOuterBackground)
        self.innerCircleView.backgroundColor(self.colors.markerInnerBackground)
    }

    // MARK: - Update UI

    private func updateCornerRadius() {
        self.layoutIfNeeded()

        self.sparkCornerRadius(.infinity)
        self.innerCircleView.sparkCornerRadius(.infinity)
    }

    private func updateSizes() {
        let isActive = !self.isHidden

        self.heightConstraint?.constant = self.height
        self.heightConstraint?.isActive = isActive

        self.innerCircleHeightConstraint?.constant = self.innerCircleHeight
        self.innerCircleHeightConstraint?.isActive = isActive

        self.innerCircleCenterXConstraint?.isActive = isActive
        self.innerCircleCenterYConstraint?.isActive = isActive

        self.updateConstraintsIfNeeded()
    }

    // MARK: - Trait Collection

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self._height.update(traitCollection: self.traitCollection)
        self._innerCircleHeight.update(traitCollection: self.traitCollection)
        self.updateSizes()
    }
}
