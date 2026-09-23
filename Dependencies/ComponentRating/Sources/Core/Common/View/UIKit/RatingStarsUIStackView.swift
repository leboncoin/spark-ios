//
//  RatingStarsUIStackView.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 13/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming
import Combine

final class RatingStarsUIStackView: UIStackView {

    // MARK: - Components

    var starsViews: [RatingStarUIView] {
        self.subviews.compactMap {
            $0 as? RatingStarUIView
        }
    }

    // MARK: - Public Properties

    var colors = RatingColors() {
        didSet {
            self.updateStarsColors()
        }
    }

    var size: CGFloat = 0 {
        didSet {
            self._scaledStarSize = .init(wrappedValue: self.size)
            self._scaledStarSize.update(traitCollection: self.traitCollection)

            self.updateStarsSize()
        }
    }

    var contentSpacing: CGFloat = 0 {
        didSet {
            self._scaledSpacing = .init(wrappedValue: self.contentSpacing)
            self._scaledSpacing.update(traitCollection: self.traitCollection)

            self.updateSpacing()
        }
    }

    var stars = 1 {
        didSet {
            self.updateStars()
        }
    }

    var value: Double = 0 {
        didSet {
            self.updateStarsRatio()
        }
    }

    // MARK: - Private Properties

    private let viewModel: RatingViewModel

    private var subscriptions = Set<AnyCancellable>()

    @ScaledUIFrame private var scaledStarSize: CGFloat = 0
    @LimitedScaledUIMetric private var scaledSpacing: CGFloat = 0

    // MARK: - Initialization

    init(viewModel: RatingViewModel) {
        self.viewModel = viewModel

        super.init(frame: .zero)

        // Setup
        self.setupView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View setup

    private func setupView() {
        // View properties
        self.backgroundColor = .clear
        self.axis = .horizontal

        // Setup Accessibility
        self.isAccessibilityElement = false
    }

    // MARK: - Update UI

    private func updateSpacing() {
        self.spacing = self.scaledSpacing
    }

    private func updateStars() {
        guard self.stars > 0 else { return }

        // Remove all subviews
        self.removeArrangedSubviews()

        for index in 0...self.stars - 1 {
            let ratio = self.getRatio(at: index)

            let starView = RatingStarUIView(index: index)
            starView.colors = self.colors
            starView.size = self.scaledStarSize
            starView.ratio = ratio
            self.addArrangedSubview(starView)
        }
    }

    private func updateStarsColors() {
        for starView in self.starsViews {
            starView.colors = self.colors
        }
    }

    private func updateStarsRatio() {
        for starView in self.starsViews {
            let ratio = self.getRatio(at: starView.index)

            starView.ratio = ratio
        }
    }

    private func updateStarsSize() {
        for starView in self.starsViews {
            starView.size = self.scaledStarSize
        }
    }

    // MARK: - Private Getter

    private func getRatio(at index: Int) -> CGFloat {
        return self.viewModel.getFillingRatio(
            at: index,
            count: self.stars,
            value: self.value
        )
    }

    // MARK: - Trait Collection

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self._scaledSpacing.update(traitCollection: self.traitCollection)
        self.updateSpacing()

        self._scaledStarSize.update(traitCollection: self.traitCollection)
        self.updateStarsSize()
    }
}

