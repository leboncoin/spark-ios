//
//  DividerSeparatorUIView.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 14/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import Combine

final class DividerSeparatorUIView: UIView {

    // MARK: - Properties

    var axis: DividerAxis = .default {
        didSet {
            self.updateSizes()
        }
    }

    var widthTypes: DividerSeparatorWidthTypes = .init() {
        didSet {
            self.updateSizes()
        }
    }

    override var isHidden: Bool {
        didSet {
            self.updateSizes()
        }
    }

    // MARK: - Private Properties

    private let position: DividerSeparatorPosition

    private var widthType: DividerSeparatorWidthType {
        self.widthTypes.value(for: self.position)
    }

    private var heightConstraints: NSLayoutConstraint?
    private var widthConstraints: NSLayoutConstraint?
    private var minHeightConstraints: NSLayoutConstraint?
    private var minWidthConstraints: NSLayoutConstraint?

    private var sameWidthsConstraints: NSLayoutConstraint?
    private var sameHeightsConstraints: NSLayoutConstraint?

    @ScaledUIFrame private var thickness: CGFloat = DividerConstants.thickness
    @ScaledUIFrame private var minSize: CGFloat = DividerConstants.minimumWidth

    // MARK: - Initialization

    init(position: DividerSeparatorPosition) {
        self.position = position

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Properties
        self.accessibilityIdentifier = switch self.position {
        case .first: DividerAccessibilityIdentifier.firstSeparator
        case .last: DividerAccessibilityIdentifier.lastSeparator
        }
        self.isAccessibilityElement = false

        // Setup constraints
        self.setupConstraints()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.heightConstraints = self.heightAnchor.constraint(equalToConstant: 0)
        self.widthConstraints = self.widthAnchor.constraint(equalToConstant: 0)
        self.minHeightConstraints = self.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        self.minWidthConstraints = self.widthAnchor.constraint(greaterThanOrEqualToConstant: 0)
    }

    func setupSameSizesViewConstraints(to otherView: DividerSeparatorUIView) {
        self.sameWidthsConstraints = self.widthAnchor.constraint(equalTo: otherView.widthAnchor)
        self.sameHeightsConstraints = self.heightAnchor.constraint(equalTo: otherView.heightAnchor)
    }

    func deactivateConstraints() {
        NSLayoutConstraint.deactivate(
            [
                self.heightConstraints,
                self.widthConstraints,
                self.minHeightConstraints,
                self.minWidthConstraints,
                self.sameWidthsConstraints,
                self.sameHeightsConstraints
            ].compactMap { $0 }
        )
    }

    // MARK: - Update UI

    private func updateSizes() {
        // Deactivate constraints
        self.deactivateConstraints()

        guard !self.isHidden else {
            return
        }

        switch self.axis {
        case .horizontal:
            self.updateHorizontalSizes()

        case .vertical:
            self.updateVerticalSizes()
        }
    }

    private func updateHorizontalSizes() {
        self.heightConstraints?.activatedConstants(self.thickness)

        switch (self.position, self.widthType) {

        case (.first, .fixed): self.activateSizeConstraints(self.widthConstraints)
        case (.first, .dynamic): self.activateSizeConstraints(self.minWidthConstraints)

        case (.last, .fixed): self.activateSizeConstraints(self.widthConstraints)
        case (.last, .dynamic): self.activateSizeConstraints(self.minWidthConstraints)

        case (_, .equal): self.activateSizeConstraints(self.minWidthConstraints)
        }

        self.sameWidthsConstraints?.isActive = self.widthType.isEqual
    }

    private func updateVerticalSizes() {
        self.widthConstraints?.activatedConstants(self.thickness)

        switch (self.position, self.widthType) {

        case (.first, .fixed): self.activateSizeConstraints(self.heightConstraints)
        case (.first, .dynamic): self.activateSizeConstraints(self.minHeightConstraints)

        case (.last, .fixed): self.activateSizeConstraints(self.heightConstraints)
        case (.last, .dynamic): self.activateSizeConstraints(self.minHeightConstraints)

        case (_, .equal): self.activateSizeConstraints(self.minHeightConstraints)
        }

        self.sameHeightsConstraints?.isActive = self.widthType.isEqual
    }

    /// Activate constraint and set a new constant value.
    private func activateSizeConstraints(_ constrains: NSLayoutConstraint?) {
        constrains?.activatedConstants(self.minSize)
    }

    // MARK: - Trait Collection

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self._thickness.update(traitCollection: self.traitCollection)
        self._minSize.update(traitCollection: self.traitCollection)
        self.updateSizes()
    }
}
