//
//  ButtonUIImageView.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 19/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkCommon
import UIKit

final class ButtonUIImageView: UIView {

    // MARK: - Components

     private(set) var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintAdjustmentMode = .normal
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return imageView
    }()

    // MARK: - Properties

    var image: UIImage? {
        get {
            self.imageView.image
        }
        set {
            self.imageView.image = newValue
            self.isHidden = newValue == nil
        }
    }

    @ScaledUIFrame private var imageSize: CGFloat = 0
    private var imageHeightConstraint: NSLayoutConstraint?

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Setup

    private func setupView() {
        // Add subviews
        self.addSubview(self.imageView)

        // Setup constraints
        self.setupConstraints()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.setupImageViewConstraints()
    }

    private func setupImageViewConstraints() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false

        self.imageHeightConstraint = self.imageView.heightAnchor.constraint(equalToConstant: .zero)

        NSLayoutConstraint.activate([
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor),

            self.widthAnchor.constraint(equalTo: self.imageView.widthAnchor),
            self.heightAnchor.constraint(greaterThanOrEqualTo: self.imageView.heightAnchor)
        ])
    }

    // MARK: - Update UI

    func updateImageSize(_ size: CGFloat) {
        self._imageSize = .init(
            wrappedValue: size,
            traitCollection: self.traitCollection
        )
        self.updateImageHeight()
    }

    private func updateImageHeight() {
        self.imageHeightConstraint?.constant = self.imageSize
        self.imageHeightConstraint?.isActive = true
        self.setNeedsUpdateConstraints()
    }

    // MARK: - Trait Collection

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self._imageSize.update(traitCollection: self.traitCollection)
        self.updateImageHeight()
    }
}
