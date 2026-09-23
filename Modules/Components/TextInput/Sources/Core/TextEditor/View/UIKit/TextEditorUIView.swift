//
//  TextEditorUIView.swift
//  SparkEditor
//
//  Created by robin.lemaire on 05/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
import Combine
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// The UIKit version for the text editor. subclasses UITextView
public final class TextEditorUIView: UITextView {

    // MARK: - Components

    private var placeholderLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.isAccessibilityElement = false
        return label
    }()

    // MARK: - Public Properties

    /// The textview's current theme.
    public var theme: any Theme {
        get {
            return self.viewModel.theme
        }
        set {
            self.viewModel.theme = newValue
        }
    }

    /// The textview's current intent.
    public var intent: TextEditorIntent {
        get {
            return self.viewModel.intent
        }
        set {
            self.viewModel.intent = newValue
        }
    }

    /// The textview's current placeholder.
    public var placeholder: String? {
        get {
            return self.placeholderLabel.text
        }
        set {
            self.placeholderLabel.text = newValue
            self.placeholderLabel.sizeToFit()
        }
    }

    /// The textview's isEnabled.
    public var isEnabled: Bool {
        get {
            return self.viewModel.isEnabled
        }
        set {
            self.viewModel.isEnabled = newValue
            if !newValue {
                self.accessibilityTraits.insert(.notEnabled)
                if self.isFirstResponder {
                    _ = self.resignFirstResponder()
                }
            } else {
                self.accessibilityTraits.remove(.notEnabled)
            }
        }
    }

    // MARK: - Override Properties

    /// The textview's text.
    public override var text: String! {
        didSet {
            self.viewModel.contentChanged(with: self.text)
        }
    }

    /// The textview's attributedText.
    public override var attributedText: NSAttributedString! {
        didSet {
            self.viewModel.contentChanged(with: self.text) // The attributedText set the text too.
        }
    }

    /// The textview's isEditable.
    public override var isEditable: Bool {
        didSet {
            self.viewModel.isReadOnly = !self.isEditable
        }
    }

    // MARK: - Private Properties

    @ScaledUIFrame var height: CGFloat = TextInputConstants.height

    @ScaledUIBorderRadius private var cornerRadius: CGFloat = 0
    @ScaledUIBorderWidth private var borderWidth: CGFloat = 0

    @ScaledUIPadding private var leftSpacing: CGFloat = 0
    @ScaledUIPadding private var verticalSpacing: CGFloat = 0
    @ScaledUIPadding private var rightSpacing: CGFloat = 0

    private var heightConstraint: NSLayoutConstraint?
    private var placeholderVerticalPaddingConstraints: [NSLayoutConstraint] = []
    private var placeholderWidthConstraint: NSLayoutConstraint?
    private var placeholderCenterYAnchorConstraint: NSLayoutConstraint?
    private var placeholderCenterXAnchorConstraint: NSLayoutConstraint?

    private let viewModel: TextEditorUIViewModel

    private var cancellables = Set<AnyCancellable>()

    private let notificationNames = [
        UITextView.textDidChangeNotification,
        UITextView.textDidBeginEditingNotification,
        UITextView.textDidEndEditingNotification
    ]

    // MARK: - Initialization

    /// TextEditorUIView initializer
    /// - Parameters:
    ///   - theme: The textviews's current theme
    ///   - intent: The textviews's current intent
    public init(
        theme: any Theme,
        intent: TextEditorIntent
    ) {
        self.viewModel = .init(theme: theme, intent: intent)

        super.init(
            frame: .zero,
            textContainer: nil
        )

        // Setup
        self.setupView()
    }

    deinit {
        self.unsetNotificationCenter()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        // Accessibility
        self.accessibilityIdentifier = TextEditorAccessibilityIdentifier.view

        // Properties
        self.adjustsFontForContentSizeCategory = true
        self.showsHorizontalScrollIndicator = false
        self.textContainer.lineFragmentPadding = 0

        // Subviews
        self.addSubview(self.placeholderLabel)

        // Setup Observer
        self.setupNotificationCenter()

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateBorder()
        self.updatePaddings()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.setupViewConstraints()
        self.setupPlaceholderConstraints()
    }

    /// Setup the size constraints for this view.
    private func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.heightConstraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: self.height)
        self.heightConstraint?.isActive = true
    }

    /// Setup the imageView constraints.
    private func setupPlaceholderConstraints() {
        self.placeholderLabel.translatesAutoresizingMaskIntoConstraints = false

        self.placeholderVerticalPaddingConstraints = [
            self.placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ]

        self.placeholderWidthConstraint = self.placeholderLabel.widthAnchor.constraint(equalTo: self.widthAnchor)
        self.placeholderCenterYAnchorConstraint = self.placeholderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        self.placeholderCenterXAnchorConstraint = self.placeholderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let placeholderHorizontalConstraints = [
            self.placeholderWidthConstraint,
            self.placeholderCenterYAnchorConstraint,
            self.placeholderCenterXAnchorConstraint
        ].compactMap { $0 }

        NSLayoutConstraint.activate(self.placeholderVerticalPaddingConstraints + placeholderHorizontalConstraints)
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        self.viewModel.$textColor.removeDuplicates(by: { lhs, rhs in
            lhs.equals(rhs)
        })
        .subscribe(in: &self.cancellables) { [weak self] textColor in
            guard let self else { return }
            self.textColor = textColor.uiColor
            self.tintColor = textColor.uiColor
        }

        self.viewModel.$backgroundColor.removeDuplicates(by: { lhs, rhs in
            lhs.equals(rhs)
        })
        .subscribe(in: &self.cancellables) { [weak self] backgroundColor in
            self?.backgroundColor = backgroundColor.uiColor
        }

        self.viewModel.$borderColor.removeDuplicates(by: { lhs, rhs in
            lhs.equals(rhs)
        })
        .subscribe(in: &self.cancellables) { [weak self] borderColor in
            self?.setBorderColor(from: borderColor)
        }

        self.viewModel.$placeholderColor.removeDuplicates(by: { lhs, rhs in
            lhs.equals(rhs)
        })
        .subscribe(in: &self.cancellables) { [weak self] placeholderColor in
            self?.placeholderLabel.textColor = placeholderColor.uiColor
        }

        self.viewModel.$borderWidth.subscribe(in: &self.cancellables) { [weak self] borderWidth in
            guard let self else { return }

            self.borderWidth = borderWidth
            self._borderWidth.update(traitCollection: self.traitCollection)

            self.updateBorder()
        }

        self.viewModel.$borderRadius.subscribe(in: &self.cancellables) { [weak self] borderRadius in
            guard let self else { return }

            self.cornerRadius = borderRadius
            self._cornerRadius.update(traitCollection: self.traitCollection)

            self.updateBorder()
        }

        self.viewModel.$leftSpacing.subscribe(in: &self.cancellables) { [weak self] leftSpacing in
            guard let self else { return }

            self.updatePaddings(leftSpacing: leftSpacing)
        }

        self.viewModel.$rightSpacing.subscribe(in: &self.cancellables) { [weak self] rightSpacing in
            guard let self else { return }

            self.updatePaddings(rightSpacing: rightSpacing)
        }

        self.viewModel.$updateVerticalSpacingCounter.subscribe(in: &self.cancellables) { [weak self] _ in
            guard let self else { return }

            self.updatePaddings()
        }

        self.viewModel.$dim.removeDuplicates().subscribe(in: &self.cancellables) { [weak self] dim in
            self?.alpha = dim
        }

        self.viewModel.$font.subscribe(in: &self.cancellables) { [weak self] font in
            guard let self else { return }
            self.font = font.uiFont
            self.placeholderLabel.font = font.uiFont
        }

        self.viewModel.$shouldShowPlaceholder
            .removeDuplicates().subscribe(in: &self.cancellables) { [weak self] shouldShowPlaceholder in
                guard let self else { return }

                self.placeholderLabel.isHidden = !shouldShowPlaceholder
            }
    }

    // MARK: - Notification Center

    private func setupNotificationCenter() {
        for name in self.notificationNames {
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(textViewFired(notification:)),
                name: name,
                object: self
            )
        }
    }

    private func unsetNotificationCenter() {
        for name in self.notificationNames {
            NotificationCenter.default.removeObserver(
                self,
                name: name,
                object: self
            )
        }
    }

    // MARK: - Update

    private func updatePaddings(
        leftSpacing: CGFloat? = nil,
        rightSpacing: CGFloat? = nil
    ) {
        self.leftSpacing = leftSpacing ?? self.viewModel.leftSpacing
        self._leftSpacing.update(traitCollection: self.traitCollection)
        self.verticalSpacing = self.viewModel.getVerticalSpacing(from: self.height)
        self._verticalSpacing.update(traitCollection: self.traitCollection)
        self.rightSpacing = rightSpacing ?? self.viewModel.rightSpacing
        self._rightSpacing.update(traitCollection: self.traitCollection)

        // Container
        self.textContainerInset = UIEdgeInsets(
            top: self.verticalSpacing,
            left: self.leftSpacing,
            bottom: self.verticalSpacing,
            right: self.rightSpacing
        )

        // Placeholder
        if let placeholderWidthConstraint {
            placeholderWidthConstraint.constant = -(self.leftSpacing + self.rightSpacing)
        }

        for constraint in self.placeholderVerticalPaddingConstraints {
            constraint.constant = self.verticalSpacing
        }

        self.placeholderLabel.sizeToFit()
        self.placeholderLabel.updateConstraintsIfNeeded()
    }

    private func updateBorder() {
        self.setCornerRadius(.textEditorRadius(self.cornerRadius))
        self.setBorderWidth(self.borderWidth)
    }

    // MARK: - Action

    @objc
    private func textViewFired(notification: Notification) {
        self.viewModel.contentChanged(with: self.text)
    }

    // MARK: - Responder

    public override var canBecomeFirstResponder: Bool {
        return self.isEnabled ? super.canBecomeFirstResponder : false
    }

    public override func becomeFirstResponder() -> Bool {
        let bool = super.becomeFirstResponder()
        self.viewModel.isFocused = bool
        return bool
    }

    public override func resignFirstResponder() -> Bool {
        self.viewModel.isFocused = false
        return super.resignFirstResponder()
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            self.setBorderColor(from: self.viewModel.borderColor)
        }

        guard previousTraitCollection?.preferredContentSizeCategory != self.traitCollection.preferredContentSizeCategory else { return }

        // Update all Scaled variables
        self._height.update(traitCollection: self.traitCollection)

        self._cornerRadius.update(traitCollection: self.traitCollection)
        self._borderWidth.update(traitCollection: self.traitCollection)

        self._leftSpacing.update(traitCollection: self.traitCollection)
        self._verticalSpacing.update(traitCollection: self.traitCollection)
        self._rightSpacing.update(traitCollection: self.traitCollection)

        self.heightConstraint?.constant = self.height
        self.updateConstraintsIfNeeded()

        self.updateBorder()

        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
}
