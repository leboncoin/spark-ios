//
//  RatingStarUIView.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 13/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
import SparkResources
@_spi(SI_SPI) import SparkCommon

final class RatingStarUIView: UIView {

    // MARK: - Components

    private var strokeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(spark: \.starOutline))
        imageView.contentMode = .scaleAspectFit
        imageView.tintAdjustmentMode = .normal
        return imageView
    }()

    private lazy var fillImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(spark: \.starFill))
        imageView.contentMode = .scaleAspectFit
        imageView.tintAdjustmentMode = .normal
        imageView.layer.mask = self.fillMaskLayer
        return imageView
    }()

    private var fillMaskLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.black.cgColor
        return layer
    }()

    // MARK: - Properties

    let index: Int

    var ratio: CGFloat = 0 {
        didSet {
            self.updateFilledMask()
        }
    }

    var colors = RatingColors() {
        didSet {
            self.strokeImageView.tintColor(colors.strokeStarTintColorToken)
            self.fillImageView.tintColor(colors.filledStarTintColorToken)
        }
    }

    var size: CGFloat = 0 {
        didSet {
            self.updateSize()
        }
    }

    // MARK: - Private Properties

    private var heightConstraint: NSLayoutConstraint?

    // MARK: - Initialization

    init(index: Int) {
        self.index = index

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        // Update UI
        self.updateFilledMask()
    }

    // MARK: - View setup

    private func setupView() {
        // A11Y
        self.isAccessibilityElement = false

        // Subviews
        self.addSubview(self.strokeImageView)
        self.addSubview(self.fillImageView)

        // Constraints
        self.setupConstraints()

        // Update UI
        self.updateSize()
        self.updateFilledMask()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.setupViewConstraints()
        self.setupStrokeImageViewConstraints()
        self.setupFillImageViewConstraints()
    }

    private func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: self.size)
        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }

    private func setupStrokeImageViewConstraints() {
        self.strokeImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.strokeImageView,
            to: self
        )
    }

    private func setupFillImageViewConstraints() {
        self.fillImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.fillImageView,
            to: self
        )
    }

    // MARK: - Update UI

    private func updateSize() {
        self.heightConstraint?.constant = self.size
        self.heightConstraint?.isActive = true
        self.updateConstraintsIfNeeded()
    }

    private func updateFilledMask() {
        self.fillImageView.layoutIfNeeded()

        CATransaction.begin()
        CATransaction.setDisableActions(true)

        let bounds = self.fillImageView.bounds
        self.fillMaskLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: bounds.width * self.ratio,
            height: bounds.height
        )

        CATransaction.commit()
    }

    // MARK: - Trait Collection

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if self.traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory {
            self.updateFilledMask()
        }
    }
}
