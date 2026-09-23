//
//  TextFieldUIView.swift
//  SparkTextField
//
//  Created by louis.borlee on 05/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
import Combine
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// Spark TextField, subclasses UITextField
public final class TextFieldUIView: UITextField {

    // MARK: - Properties

    private let viewModel: TextInputUIViewModel
    private var cancellables = Set<AnyCancellable>()

    @ScaledUIFrame private var height: CGFloat = TextInputConstants.height

    @ScaledUIBorderRadius private var cornerRadius: CGFloat = 0
    @ScaledUIBorderWidth private var borderWidth: CGFloat = 0

    @ScaledUIPadding private var leftSpacing: CGFloat = 0
    @ScaledUIPadding private var contentSpacing: CGFloat = 0
    @ScaledUIPadding private var rightSpacing: CGFloat = 0

    private let defaultClearButtonRightSpacing = 5.0

    public override var placeholder: String? {
        didSet {
            self.setPlaceholder(self.placeholder, foregroundColor: self.viewModel.placeholderColor, font: self.viewModel.font)
        }
    }

    public override var isEnabled: Bool {
        didSet {
            self.viewModel.isEnabled = self.isEnabled
        }
    }

    /// A boolean value indicating whether the field is in a read-only state. Default value is ``false``.
    public var isReadOnly: Bool {
        get { return self.viewModel.isReadOnly }
        set {
            if newValue, self.isFirstResponder {
                _ = self.resignFirstResponder()
            }
            self.viewModel.isReadOnly = newValue
            self.isUserInteractionEnabled = newValue != true
        }
    }

    public override var borderStyle: UITextField.BorderStyle {
        @available(*, unavailable)
        set {}
        get { return .init(self.viewModel.borderStyle) }
    }

    /// The textfield's current theme.
    public var theme: any Theme {
        get {
            return self.viewModel.theme
        }
        set {
            self.viewModel.theme = newValue
        }
    }

    /// The textfield's current intent.
    public var intent: TextFieldIntent {
        get {
            return self.viewModel.intent
        }
        set {
            self.viewModel.intent = newValue
        }
    }

    // MARK: - Initialization

    internal init(viewModel: TextInputUIViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.adjustsFontForContentSizeCategory = true
        self.adjustsFontSizeToFitWidth = false
        self.setupView()
    }

    internal convenience init(
        theme: any Theme,
        intent: TextFieldIntent,
        borderStyle: TextInputBorderStyle
    ) {
        self.init(
            viewModel: .init(
                theme: theme,
                intent: intent,
                borderStyle: borderStyle
            )
        )
    }

    /// TextFieldUIView initializer
    /// - Parameters:
    ///   - theme: The textfield's current theme
    ///   - intent: The textfield's current intent
    public convenience init(
        theme: any Theme,
        intent: TextFieldIntent
    ) {
        self.init(
            viewModel: .init(
                theme: theme,
                intent: intent,
                borderStyle: .roundedRect
            )
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        self.subscribeToViewModel()
        self.setContentCompressionResistancePriority(.required, for: .vertical)

        self.accessibilityIdentifier = TextFieldAccessibilityIdentifier.view
    }

    private func subscribeToViewModel() {
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
            guard let self else { return }
            self.backgroundColor = backgroundColor.uiColor
        }

        self.viewModel.$borderColor.removeDuplicates(by: { lhs, rhs in
            lhs.equals(rhs)
        })
        .subscribe(in: &self.cancellables) { [weak self] borderColor in
            guard let self else { return }
            self.setBorderColor(from: borderColor)
        }

        self.viewModel.$placeholderColor.removeDuplicates(by: { lhs, rhs in
            lhs.equals(rhs)
        })
        .subscribe(in: &self.cancellables) { [weak self] placeholderColor in
            guard let self else { return }
            self.setPlaceholder(self.placeholder, foregroundColor: placeholderColor, font: self.viewModel.font)
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
            self.leftSpacing = leftSpacing
            self._leftSpacing.update(traitCollection: self.traitCollection)
            self.setNeedsLayout()
        }

        self.viewModel.$rightSpacing.subscribe(in: &self.cancellables) { [weak self] rightSpacing in
            guard let self else { return }
            self.rightSpacing = rightSpacing
            self._rightSpacing.update(traitCollection: self.traitCollection)
            self.setNeedsLayout()
        }

        self.viewModel.$contentSpacing.subscribe(in: &self.cancellables) { [weak self] contentSpacing in
            guard let self else { return }
            self.contentSpacing = contentSpacing
            self._contentSpacing.update(traitCollection: self.traitCollection)
            self.setNeedsLayout()
        }

        self.viewModel.$dim.removeDuplicates().subscribe(in: &self.cancellables) { [weak self] dim in
            guard let self else { return }
            self.alpha = dim
        }

        self.viewModel.$font.subscribe(in: &self.cancellables) { [weak self] font in
            guard let self else { return }
            self.font = font.uiFont
            self.setPlaceholder(self.placeholder, foregroundColor: self.viewModel.placeholderColor, font: font)
        }
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateBorder()
    }

    // MARK: - Update

    private func updateBorder() {
        self.setCornerRadius(self.cornerRadius)
        self.setBorderWidth(self.borderWidth)
    }

    // MARK: - Setter

    private func setAttributedPlaceholder(string: String, foregroundColor: UIColor, font: UIFont) {
        self.attributedPlaceholder = NSAttributedString(
            string: string,
            attributes: [
                NSAttributedString.Key.foregroundColor: foregroundColor,
                NSAttributedString.Key.font: font
            ]
        )
    }

    private func setPlaceholder(_ placeholder: String?, foregroundColor: any ColorToken, font: any TypographyFontToken) {
        if let placeholder {
            self.setAttributedPlaceholder(string: placeholder, foregroundColor: foregroundColor.uiColor, font: font.uiFont)
        } else {
            self.attributedPlaceholder = nil
        }
    }

    private func setInsets(forBounds bounds: CGRect) -> CGRect {
        var totalInsets = UIEdgeInsets(
            top: 0,
            left: self.leftSpacing,
            bottom: 0,
            right: self.rightSpacing
        )
        let contentSpacing = self.contentSpacing
        if let leftView,
           leftView.isDescendant(of: self) {
            totalInsets.left += leftView.bounds.size.width + contentSpacing
        }
        if let rightView,
           rightView.isDescendant(of: self) {
            totalInsets.right += rightView.bounds.size.width + contentSpacing
        }
        if let clearButton = self.value(forKeyPath: "_clearButton") as? UIButton,
           clearButton.isDescendant(of: self) {
            totalInsets.right += clearButton.bounds.size.width + contentSpacing
        }
        return bounds.inset(by: totalInsets)
    }

    // MARK: - Override Methods

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return self.setInsets(forBounds: bounds)
    }

    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return self.setInsets(forBounds: bounds)
    }
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.setInsets(forBounds: bounds)
    }

    private func getClearButtonXOffset() -> CGFloat {
        return -self.rightSpacing + self.defaultClearButtonRightSpacing
    }

    public override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        return super.clearButtonRect(forBounds: bounds)
            .offsetBy(dx: self.getClearButtonXOffset(), dy: 0)
    }

    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return super.leftViewRect(forBounds: bounds)
            .offsetBy(dx: self.leftSpacing, dy: 0)
    }

    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return super.rightViewRect(forBounds: bounds)
            .offsetBy(dx: -self.rightSpacing, dy: 0)
    }

    // MARK: - Responder

    public override func becomeFirstResponder() -> Bool {
        let bool = super.becomeFirstResponder()
        self.viewModel.isFocused = bool
        return bool
    }

    public override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        self.viewModel.isFocused = false
        return true
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            self.setBorderColor(from: self.viewModel.borderColor)
        }

        guard previousTraitCollection?.preferredContentSizeCategory != self.traitCollection.preferredContentSizeCategory else { return }

        self._height.update(traitCollection: self.traitCollection)

        self._cornerRadius.update(traitCollection: self.traitCollection)
        self._borderWidth.update(traitCollection: self.traitCollection)

        self.updateBorder()

        self.invalidateIntrinsicContentSize()
        self.setNeedsLayout()
    }

    // MARK: - Instrinsic Content Size

    public override var intrinsicContentSize: CGSize {
        return .init(
            width: super.intrinsicContentSize.width,
            height: self.height
        )
    }
}
