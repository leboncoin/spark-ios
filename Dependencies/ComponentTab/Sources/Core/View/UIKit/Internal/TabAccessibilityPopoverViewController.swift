//
//  TabAccessibilityPopoverViewController.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 06/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@_spi(SI_SPI) import SparkCommon

final class TabAccessibilityPopoverViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    // MARK: - Components

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = self.layout.spacing
        return stackView
    }()

    // MARK: - Properties

    private let segmentViews: [TabSegmentUIControl]
    private let selectedIndex: Int
    private let layout: TabLayout
    private let onSelect: (Int) -> Void

    // MARK: - Initialization

    init(
        segmentViews: [TabSegmentUIControl],
        selectedIndex: Int,
        layout: TabLayout,
        onSelect: @escaping (Int) -> Void
    ) {
        self.segmentViews = segmentViews
        self.selectedIndex = selectedIndex
        self.layout = layout
        self.onSelect = onSelect

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup view
        self.setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Update preferred content size after layout
        self.updatePreferredContentSize()
    }

    // MARK: - Setup

    private func setupView() {
        // Add subviews
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentStackView)

        // Setup constraints
        self.setupConstraints()

        // Populate the view
        self.populateSegments()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.setupScrollViewConstraints()
        self.setupContentStackViewConstraints()
    }

    private func setupScrollViewConstraints() {
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.layout.horizontalPadding),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.layout.horizontalPadding),
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.contentStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: self.layout.verticalPadding),
            self.contentStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -self.layout.verticalPadding),
            self.contentStackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        ])
    }

    // MARK: - Populate

    private func populateSegments() {
        for (index, segmentView) in self.segmentViews.enumerated() {
            let button = self.createSegmentButton(for: segmentView, at: index)
            self.contentStackView.addArrangedSubview(button)
        }
    }

    private func createSegmentButton(for segmentView: TabSegmentUIControl, at index: Int) -> UIButton {
        let isSelected = index == self.selectedIndex

        // Create configuration
        var configuration: UIButton.Configuration = isSelected ? .filled() : .plain()
        configuration.image = segmentView.image
        configuration.imagePlacement = .leading

        // Text / Accessibility Label
        if let title = segmentView.title {
            configuration.title = title
        }

        // Add padding inside the button
        configuration.contentInsets = NSDirectionalEdgeInsets(
            top: self.layout.verticalPadding,
            leading: self.layout.horizontalPadding,
            bottom: self.layout.verticalPadding,
            trailing: self.layout.horizontalPadding
        )

        // Add spacing between image and title
        configuration.imagePadding = self.layout.spacing

        // Create button
        let button = UIButton(configuration: configuration)
        button.isSelected = isSelected
        button.accessibilityValue = .accessibilityLabel(
            index: index,
            count: self.segmentViews.count
        )

        // Set accessibility label if no title
        if segmentView.title == nil {
            button.accessibilityLabel = segmentView.accessibilityLabel
        }

        // Add action
        button.addAction(UIAction { [weak self] _ in
            self?.dismiss(animated: true) {
                self?.onSelect(index)
            }
        }, for: .touchUpInside)

        return button
    }

    // MARK: - Update UI

    private func updatePreferredContentSize() {
        // Calculate the content size based on the stackView
        let targetSize = CGSize(
            width: UIView.layoutFittingCompressedSize.width,
            height: UIView.layoutFittingCompressedSize.height
        )

        let fittingSize = self.contentStackView.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .fittingSizeLevel,
            verticalFittingPriority: .fittingSizeLevel
        )

        // Add padding
        let width = fittingSize.width + (self.layout.horizontalPadding * 2)
        let height = fittingSize.height + (self.layout.verticalPadding * 2)

        self.preferredContentSize = CGSize(width: width, height: height)
    }

    // MARK: - UIPopoverPresentationControllerDelegate

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection
    ) -> UIModalPresentationStyle {
        return .none
    }
}
