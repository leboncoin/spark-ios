//
//  TabSegmentUIControl.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 03/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming
import Combine

final class TabSegmentUIControl: UIControl {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                self.leftSpacing,
                self.containerStackView,
                self.rightSpacing
            ]
        )
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.isUserInteractionEnabled = false
        return stackView
    }()

    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                self.imageView,
                self.titleLabel
            ]
        )
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    private let leftSpacing: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }()

    private let rightSpacing: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontForContentSizeCategory = true
        label.isHidden = true
        return label
    }()

    var extraView: UIView? {
        didSet {
            self.updateExtraView()
        }
    }

    let lineView = UIView()
    let selectedLineView = UIView()

    // MARK: - Internal Properties

    var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    var intent: TabIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    var size: TabSize = .default {
        didSet {
            self.viewModel.size = self.size
        }
    }

    var sizes: TabSizes = .init() {
        didSet {
            self.updateSizes()
        }
    }

    var layout: TabLayout = .init() {
        didSet {
            self.updateLayout()
        }
    }

    override var isSelected: Bool {
        didSet {
            self.viewModel.isSelected = self.isSelected
            self.accessibilityTraits(.selected, condition: self.isSelected)
        }
    }

    override var isHighlighted: Bool {
        didSet {
            self.viewModel.isPressed = self.isHighlighted

            self.updateScaled()
        }
    }

    var title: String? {
        get {
            self.titleLabel.text
        }
        set {
            self.titleLabel.text(newValue)
        }
    }

    var attributedTitle: NSAttributedString? {
        get {
            self.titleLabel.attributedText
        }
        set {
            self.titleLabel.attributedText(newValue)
        }
    }

    var image: UIImage? {
        get {
            self.imageView.image
        }
        set {
            self.imageView.image = newValue
            self.imageView.isHidden = newValue == nil
        }
    }

    var apportionsSegmentWidthsByContent: Bool = true {
        didSet {
            self.leftSpacing.isHidden = self.apportionsSegmentWidthsByContent
            self.rightSpacing.isHidden = self.apportionsSegmentWidthsByContent
        }
    }

    override var accessibilityLabel: String? {
        get {
            return if let _accessibilityLabel {
                _accessibilityLabel
            } else {
                [self.titleLabel, self.extraView]
                    .compactMap(\.?.accessibilityLabel)
                    .joined(separator: ", ")
            }
        }
        set {
            self._accessibilityLabel = newValue
        }
    }

    // MARK: - Private Properties

    private let viewModel = TabSegmentViewModel()
    private var subscriptions = Set<AnyCancellable>()

    private var _accessibilityLabel: String?

    private var heightConstraint: NSLayoutConstraint?
    private var imageHeightConstraint: NSLayoutConstraint?
    private var selectedLineHeightConstraint: NSLayoutConstraint?

    // MARK: - Initialization

    init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Setup

    private func setupView() {
        // Add subviews
        self.addSubview(self.contentStackView)
        self.addSubview(self.lineView)
        self.addSubview(self.selectedLineView)

        // Setup constraints
        self.setupConstraints()

        // Setup subscriptions
        self.setupSubscriptions()

        // Setup accessibility
        self.setupAccessibility()

        // Load view models
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent,
            size: self.size,
            isSelected: self.isSelected
        )

        // Update initial selected line state
        self.updateSelectedLine(animated: false)
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: .zero)
        self.heightConstraint?.isActive = false

        // Subviews
        self.setupContentStackViewConstraints()
        self.setupSpacingsConstraints()
        self.setupIconImageViewConstraints()
        self.setupLineViewConstraints()
        self.setupSelectedLineViewConstraints()
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    private func setupSpacingsConstraints() {
        self.leftSpacing.translatesAutoresizingMaskIntoConstraints = false

        self.leftSpacing.widthAnchor.constraint(equalTo: self.rightSpacing.widthAnchor).isActive = true
    }

    private func setupIconImageViewConstraints() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false

        self.imageHeightConstraint = self.imageView.heightAnchor.constraint(equalToConstant: .zero)
        self.imageHeightConstraint?.isActive = false
        self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor).isActive = true
    }

    private func setupLineViewConstraints() {
        self.lineView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.lineView.heightAnchor.constraint(equalToConstant: TabConstants.lineHeight)
        ])
    }

    private func setupSelectedLineViewConstraints() {
        self.selectedLineView.translatesAutoresizingMaskIntoConstraints = false

        self.selectedLineHeightConstraint = self.selectedLineView.heightAnchor.constraint(equalToConstant: .zero)
        self.selectedLineHeightConstraint?.isActive = true

        NSLayoutConstraint.activate([
            self.selectedLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.selectedLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.selectedLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // Content Colors
        self.viewModel.$contentColors.subscribe(in: &self.subscriptions) { [weak self] contentColors in
            guard let self else { return }

            self.imageView.tintColor(contentColors.tintColorToken)
            self.titleLabel.textColor(contentColors.tintColorToken)

            UIView.optionalAnimate(withDuration: TabConstants.animationDuration) {
                self.backgroundColor(contentColors.backgroundColorToken)
            }
        }

        // Fonts
        self.viewModel.$fonts.subscribe(in: &self.subscriptions) { [weak self] fonts in
            guard let self else { return }

            self.titleLabel.font(fonts.typographyFontToken)
        }
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        self.isAccessibilityElement = true
        self.accessibilityTraits.insert(.button)

        self.minimumContentSizeCategory = .large
        self.maximumContentSizeCategory = .large
    }

    // MARK: - Update UI

    private func updateExtraView() {
        // Remove previous extra view.
        let previousExtraViews = self.containerStackView.arrangedSubviews.filter {
            $0 != self.imageView && $0 != self.titleLabel
        }
        for view in previousExtraViews {
            self.containerStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        // Add new view
        if let extraView {
            self.containerStackView.addArrangedSubview(extraView)
        }
    }

    private func updateSizes() {
        self.heightConstraint?.constant = self.sizes.height
        self.heightConstraint?.isActive = true

        self.imageHeightConstraint?.constant = self.sizes.iconHeight
        self.imageHeightConstraint?.isActive = true

        self.setNeedsUpdateConstraints()
    }

    private func updateLayout() {
        self.contentStackView.layoutMargins = .init(
            vertical: self.layout.verticalPadding,
            horizontal: self.layout.horizontalPadding
        )

        self.containerStackView.spacing = self.layout.spacing
    }

    private func updateScaled() {
        let scale = self.isHighlighted ? TabConstants.pressedScaled : 1

        UIView.optionalAnimate(withDuration: TabConstants.animationDuration) {
            self.contentStackView.transform = CGAffineTransform(
                scaleX: scale,
                y: scale
            )
        }
    }

    private func updateSelectedLine(animated: Bool) {
        let targetHeight: CGFloat = self.isSelected ? TabConstants.selectedLineHeight : .zero

        if animated {
            UIView.optionalAnimate(withDuration: TabConstants.animationDuration) {
                self.selectedLineHeightConstraint?.constant = targetHeight
                self.layoutIfNeeded()
            }
        } else {
            self.selectedLineHeightConstraint?.constant = targetHeight
        }
    }

    // MARK: - Setter

    func setModel(_ segment: TabUISegment) {
        self.image = segment.image

        if let attributedTitle = segment.attributedTitle {
            self.attributedTitle = attributedTitle
        } else {
            self.title = segment.title
        }
    }

    func setIsSelected(_ isSelected: Bool, animated: Bool) {
        guard isSelected != self.isSelected else {
            return
        }

        self.isSelected = isSelected
        self.updateSelectedLine(animated: animated)
    }
}
