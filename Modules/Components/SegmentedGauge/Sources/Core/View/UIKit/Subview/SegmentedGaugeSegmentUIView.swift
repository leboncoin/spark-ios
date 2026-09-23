//
//  SegmentedGaugeSegmentUIView.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import Combine

final class SegmentedGaugeSegmentUIView: UIView {

    // MARK: - Components

    /// Need to have a background for the segment border
    /// to avoid graphic issue between the border and the marker view.
    private lazy var backgroundView = UIView()

    private var markerView = {
        let view = SegmentedGaugeSegmentMarkerUIView()
        view.isHidden = true
        return view
    }()

    // MARK: - Properties

    private(set) var index: Int

    var colors = SegmentedGaugeColors() {
        didSet {
            self.setColors()
            self.markerView.colors = self.colors
        }
    }

    var withMarker: Bool = false {
        didSet {
            self.setVisibilities()
        }
    }

    var levels = SegmentedGaugeLevels() {
        didSet {
            self.setColors()
            self.setVisibilities()
        }
    }

    var segmentBorder = SegmentedGaugeSegmentBorder() {
        didSet {
            self.setSegmentBorder()
        }
    }

    var sizes = SegmentedGaugeSizes() {
        didSet {
            self.setSizes()
            self.markerView.sizes = self.sizes
        }
    }

    // MARK: - Private Properties

    private var heightConstraint: NSLayoutConstraint?
    private var widthConstraint: NSLayoutConstraint?

    private var markerCenterXConstraint: NSLayoutConstraint?
    private var markerCenterYConstraint: NSLayoutConstraint?

    @ScaledUIFrame private var height: CGFloat = 0
    @ScaledUIFrame private var width: CGFloat = 0

    @LimitedScaledUIMetric private var borderWidth: CGFloat = 0
    @LimitedScaledUIMetric private var cornerRadius: CGFloat = 0

    private var borderColor: (any ColorToken)?

    // MARK: - Initialization

    init(index: Int) {
        self.index = index

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Properties
        self.accessibilityIdentifier = SegmentedGaugeAccessibilityIdentifier.segmentView(for: self.index)

        // Add subviews
        self.addSubview(self.backgroundView)
        self.addSubview(self.markerView)

        // Setup constraints
        self.setupConstraints()
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        self.updateBorderRadius()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.setupViewConstraints()
        self.setupBackgroundViewConstraints()
        self.setupMarkerConstraints()
    }

    private func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        // Size
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: self.height)
        self.heightConstraint?.isActive = false

        self.widthConstraint = self.widthAnchor.constraint(equalToConstant: self.width)
        self.widthConstraint?.isActive = false
    }

    private func setupBackgroundViewConstraints() {
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.backgroundView,
            to: self
        )
    }

    private func setupMarkerConstraints() {
        // Position
        self.markerCenterXConstraint = self.markerView.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        )
        self.markerCenterXConstraint?.isActive = false

        self.markerCenterYConstraint = self.markerView.centerYAnchor.constraint(
            equalTo: self.centerYAnchor
        )
        self.markerCenterYConstraint?.isActive = false
    }

    // MARK: - Setter

    private func setSizes() {
        // Set sizes
        self._width = .init(
            wrappedValue: self.sizes.segmentSize.width,
            traitCollection: self.traitCollection
        )
        self._height = .init(
            wrappedValue: self.sizes.segmentSize.height,
            traitCollection: self.traitCollection
        )

        // Update styles
        self.updateSizes()
    }

    private func setColors() {
        let isPlain = self.levels.isPlainSegment(
            at: self.index
        )

        // Set colors
        self.backgroundView.backgroundColor(self.colors.segmentBackground(isPlain: isPlain))
        self.borderColor = self.colors.segmentBorder(isPlain: isPlain)

        // Update Borders
        self.updateBorderRadius()

        // Set opacity
        self.alpha = self.colors.segmentOpacity(isPlain: isPlain)
    }

    private func setSegmentBorder() {
        // Set sizes
        self._borderWidth = .init(
            wrappedValue: self.segmentBorder.width,
            traitCollection: self.traitCollection
        )

        self._cornerRadius = .init(
            wrappedValue: self.segmentBorder.radius,
            traitCollection: self.traitCollection
        )

        // Update border
        self.updateBorderRadius()
    }

    private func setVisibilities() {
        self.isHidden = !self.levels.isSegment(
            at: self.index
        )
        self.markerView.isHidden = !self.levels.displayMarker(
            at: self.index,
            withMarker: self.withMarker
        )

        // Update Constraints
        self.updateSizes()
        self.updateMarkerPosition()
    }

    // MARK: - Update UI

    private func updateBorderRadius() {
        self.layoutIfNeeded()

        guard let borderColor, !self.isHidden else {
            return
        }

        self.backgroundView.sparkBorderRadius(
            width: self.borderWidth,
            radius: self.cornerRadius,
            colorToken: borderColor
        )
    }

    private func updateSizes() {
        let isActive = !self.isHidden

        self.heightConstraint?.constant = self.height
        self.heightConstraint?.isActive = isActive

        self.widthConstraint?.constant = self.width
        self.widthConstraint?.isActive = isActive

        self.updateConstraintsIfNeeded()
    }

    private func updateMarkerPosition() {
        let isActive = !self.markerView.isHidden

        self.markerCenterXConstraint?.isActive = isActive
        self.markerCenterYConstraint?.isActive = isActive
    }

    // MARK: - Trait Collection

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // **
        // Update sizes
        self._height.update(traitCollection: self.traitCollection)
        self._width.update(traitCollection: self.traitCollection)
        self.updateSizes()

        self._borderWidth.update(traitCollection: self.traitCollection)
        self._cornerRadius.update(traitCollection: self.traitCollection)
        self.updateBorderRadius()
        // **
    }
}
