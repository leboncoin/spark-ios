//
//  FormFieldUIView.swift
//  SparkComponentFormField
//
//  Created by alican.aycil on 30.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Combine
import SwiftUI
import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming
import SparkComponentTextInput

// TODO: compression resistance

/// The **Spark** FormField for UIKit provide context to your form elements easily.
///
/// FormField provide context to your form elements easily,
/// unifying an a proper way to show a label, required marker,
/// help & status messages or counter in any input/field components.
///
/// Implementation example:
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
/// let component = UITextField()
///
/// let formField = FormFieldUIView(
///     theme: theme,
///     component: component,
///     feedbackState: .default,
///     title: "Email (exemple@mail.fr)",
///     helper: "Please provide a valid email (exemple@mail.fr)",
///     isTitleRequired: true
/// )
/// formField.clearButtonImage = UIImage(systemName: "xmark.circle")
/// formFieldView.clearButton.addAction(.init(handler: { _ in
/// }), for: .touchUpInside)
/// formField.helperImage = UIImage(systemName: "exclamationmark.circle")
/// self.addSubview(formField)
/// ```
///
/// ![FormField rendering with TextField.](component.png)
public final class FormFieldUIView<Component: UIView>: UIView {

    // MARK: - Components

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.headerStackView,
            self.footerStackView
        ])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var headerStackView: UIStackView = {
        let stackView = AdaptiveUIStackView(arrangedSubviews: [
            self.titleLabel,
            self.clearButtonStackView
        ])
        stackView.regularAxis = .horizontal
        stackView.accessibilityAxis = .vertical
        stackView.accessibilityInterfaceSizeClass = .compact
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()

    /// The title label of the input. The label is positioned at the top left.
    public lazy var titleLabel: A11YLabel = {
        let label = A11YLabel(viewModel: self.viewModel)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.isHidden = true
        label.accessibilityIdentifier = FormFieldAccessibilityIdentifier.formFieldTitle
        label.isAccessibilityElement = true
        label.accessibilityRespondsToUserInteraction = true
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()

    private lazy var clearButtonStackView: UIStackView = {
        let spacingView = UIView()
        spacingView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        spacingView.isAccessibilityElement = false

        let stackView = AdaptiveUIStackView(arrangedSubviews: [
            spacingView,
            self.clearButton
        ])
        stackView.alignment = .bottom
        stackView.accessibilityAlignment = .trailing
        stackView.distribution = .fill
        stackView.accessibilityDistribution = .equalCentering
        stackView.accessibilityInterfaceSizeClass = .compact
        stackView.isHidden = true
        return stackView
    }()

    /// The clear button of the input. The button is positioned at the top right.
    /// Note: The label has a default *horizontal compression resistance priority* at **.required**.
    public lazy var clearButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = FormFieldConstants.defaultTitle
        configuration.imagePlacement = .trailing
        configuration.imagePadding = self.spacing
        configuration.titlePadding = .zero
        configuration.contentInsets = .zero

        let button = UIButton(configuration: configuration)
        button.largeContentTitle = FormFieldConstants.defaultTitle
        button.addInteraction(UILargeContentViewerInteraction())
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.adjustsImageSizeForAccessibilityContentSizeCategory = true
        button.showsLargeContentViewer = true
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        button.accessibilityIdentifier = FormFieldAccessibilityIdentifier.formFieldClearButton
        button.isAccessibilityElement = true
        button.accessibilityRespondsToUserInteraction = true
        return button
    }()

    private lazy var footerStackView: UIStackView = {
        let stackView = AdaptiveUIStackView(arrangedSubviews: [
            self.helperStackView,
            self.secondaryHelperStackView
        ])
        stackView.regularAxis = .horizontal
        stackView.accessibilityAxis = .vertical
        stackView.accessibilityInterfaceSizeClass = .compact
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var helperStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.helperImageView,
            self.helperLabel
        ])
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    /// The helper image of the input. The image is positioned at the bottom left.
    /// It displayed only if the ``helperLabel`` is visible.
    public let helperImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.isHidden = true
        imageView.accessibilityIdentifier = FormFieldAccessibilityIdentifier.formFieldHelperImage
        imageView.isAccessibilityElement = false
        return imageView
    }()

    /// The helper label of the input. The label is positioned at the bottom left.
    public let helperLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.isHidden = true
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = FormFieldAccessibilityIdentifier.formFieldHelperMessage
        label.isAccessibilityElement = true
        label.accessibilityRespondsToUserInteraction = true
        return label
    }()

    @available(*, deprecated, message: "Replaced by helperLabel since the 0.1.1.")
    public var descriptionLabel: UILabel {
        self.helperLabel
    }

    private lazy var secondaryHelperStackView: UIStackView = {
        let spacingView = UIView()
        spacingView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        spacingView.isAccessibilityElement = false

        let stackView = AdaptiveUIStackView(arrangedSubviews: [
            spacingView,
            self.secondaryHelperLabel
        ])
        stackView.alignment = .bottom
        stackView.accessibilityAlignment = .trailing
        stackView.distribution = .fill
        stackView.accessibilityDistribution = .equalCentering
        stackView.accessibilityInterfaceSizeClass = .compact
        return stackView
    }()

    /// The secondary helper label of the input. The label is positioned at the bottom right.
    /// Note: The label has a default *horizontal compression resistance priority* at **.required**.
    public let secondaryHelperLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.backgroundColor = .clear
        label.adjustsFontForContentSizeCategory = true
        label.isHidden = true
        label.accessibilityIdentifier = FormFieldAccessibilityIdentifier.formFieldSecondaryHelperMessage
        label.isAccessibilityElement = true
        label.accessibilityRespondsToUserInteraction = true
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()

    // MARK: - Public properties

    /// The title of formfield.
    public var title: String? {
        get {
            return self.titleLabel.text
        }
        set {
            self.viewModel.title = newValue
            self.titleLabel.accessibilityLabel = newValue
        }
    }

    /// The attributedTitle of formfield.
    @available(*, deprecated, message: "Use title instead (since the 1.1.0)")
    public var attributedTitle: NSAttributedString? {
        get {
            if let title = self.title {
                return .init(string: title)
            } else {
                return nil
            }
        }
        set {
            self.title = newValue?.string
        }
    }

    @available(*, deprecated, message: "Replaced by isRequired since the 1.1.0.")
    public var isTitleRequired: Bool {
        get {
            return self.isRequired
        }
        set {
            self.isRequired = newValue
        }
    }

    /// The formfield is required.
    /// If **true**, a \* will be displayed
    public var isRequired: Bool {
        get {
            return self.viewModel.isRequired
        }
        set {
            self.viewModel.isRequired = newValue
        }
    }

    /// The clear image used by the clear button.
    /// If **value** is setted, a the clear button will be visible.
    public var clearButtonImage: UIImage? {
        didSet {
            self.clearButton.largeContentImage = self.clearButtonImage
            self.clearButtonStackView.isHidden = self.clearButtonImage == nil
            self.updateClearButtonImage()
            self.updateAccessibilityElements()
        }
    }

    /// The helper image of formfield.
    /// Displayed only if a ``helper`` is setted.
    public var helperImage: UIImage? {
        didSet {
            self.helperImageView.image = self.helperImage
            self.updateHelperImageVisibility()
        }
    }

    /// The helper of formfield.
    public var helper: String? {
        get {
            return self.helperLabel.text
        }
        set {
            self.viewModel.helper = newValue
        }
    }

    /// The helper of formfield.
    @available(*, deprecated, message: "Use helper instead (since the 1.1.0)")
    public var helperString: String? {
        get {
            return self.helper
        }
        set {
            self.helper = newValue
        }
    }

    /// The description of formfield.
    @available(*, deprecated, message: "Replaced by helper since the 0.1.1.")
    public var descriptionString: String? {
        get {
            return self.helperString
        }
        set {
            self.helperString = newValue
        }
    }

    /// The helper attributedHelper of formfield.
    @available(*, deprecated, message: "Use helper instead (since the 1.1.0)")
    public var attributedHelper: NSAttributedString? {
        get {
            if let helper = self.helperString {
                return .init(string: helper)
            } else {
                return nil
            }
        }
        set {
            self.helperString = newValue?.string
        }
    }

    /// The attributedDescription of formfield.
    @available(*, deprecated, message: "Replaced by attributedHelper since the 0.1.1.")
    public var attributedDescription: NSAttributedString? {
        get {
            return self.attributedHelper
        }
        set {
            self.attributedHelper = newValue
        }
    }

    /// Returns the theme of the formfield.
    public var theme: any Theme {
        get {
            return self.viewModel.theme
        }
        set {
            self.viewModel.theme = newValue
        }
    }

    /// Returns the theme of the formfield.
    public var feedbackState: FormFieldFeedbackState {
        get {
            return self.viewModel.feedbackState
        }
        set {
            self.viewModel.feedbackState = newValue
        }
    }

    /// The component of formfield.
    public var component: Component {
        didSet {
            oldValue.removeFromSuperview()
            self.setComponent()
        }
    }

    // MARK: - Private Properties

    private var viewModel: FormFieldViewModel

    private var cancellables = Set<AnyCancellable>()
    @ScaledUIMetric private var spacing: CGFloat
    @ScaledUIMetric private var iconSize: CGFloat = FormFieldConstants.iconSize

    private var helperIconSizeWidthLayoutConstraint: NSLayoutConstraint?

    // MARK: - Initialization

    /// Not implemented. Please use another init.
    /// - Parameter coder: the coder.
    public required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

    /// Initialize a formField.
    /// - Parameters:
    ///   - theme: The current Spark-Theme.
    ///   - component: The component is covered by formfield.
    ///   - feedbackState: The formfield feedback state. 'Default' or 'Error'.
    ///   - title: The formfield title.
    ///   - helper: The formfield helper message.
    ///   - isRequired: The asterisk symbol at the end of title.
    ///
    /// Implementation example:
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    /// let component = UITextField()
    ///
    /// let formField = FormFieldUIView(
    ///     theme: theme,
    ///     component: component,
    ///     feedbackState: .default,
    ///     title: "Email (exemple@mail.fr)",
    ///     helper: "Please provide a valid email (exemple@mail.fr)",
    ///     isTitleRequired: true
    /// )
    /// self.addSubview(formField)
    /// ```
    ///
    /// ![FormField rendering with TextField.](component.png)
    public init(
        theme: any Theme,
        component: Component,
        feedbackState: FormFieldFeedbackState = .default,
        title: String? = nil,
        helper: String? = nil,
        isRequired: Bool = false
    ) {
        let viewModel = FormFieldViewModel(
            frameworkType: .uiKit,
            theme: theme,
            feedbackState: feedbackState,
            title: title,
            helper: helper,
            isRequired: isRequired
        )

        self.viewModel = viewModel
        self.spacing = viewModel.spacing
        self.component = component

        super.init(frame: .zero)

        self.setupViews()
        self.setComponent()
        self.subscribe()
        self.updateAccessibility()
    }

    /// Initialize a formField.
    /// - Parameters:
    ///   - theme: The current Spark-Theme.
    ///   - component: The component is covered by formfield.
    ///   - feedbackState: The formfield feedback state. 'Default' or 'Error'.
    ///   - title: The formfield title.
    ///   - helper: The formfield helper message.
    ///   - isTitleRequired: The asterisk symbol at the end of title.
    @available(*, deprecated, message: "Replaced by the init with the isRequired String since the 1.1.0.")
    public convenience init(
        theme: any Theme,
        component: Component,
        feedbackState: FormFieldFeedbackState = .default,
        title: String? = nil,
        helper: String? = nil,
        isTitleRequired: Bool = false
    ) {
        self.init(
            theme: theme,
            component: component,
            feedbackState: feedbackState,
            title: title,
            helper: helper,
            isRequired: isTitleRequired
        )
    }

    /// Initialize a formField.
    /// - Parameters:
    ///   - theme: The current Spark-Theme.
    ///   - component: The component is covered by formfield.
    ///   - feedbackState: The formfield feedback state. 'Default' or 'Error'.
    ///   - title: The formfield title.
    ///   - description: The formfield helper message.
    ///   - isTitleRequired: The asterisk symbol at the end of title.
    @available(*, deprecated, message: "Replaced by the init with the helper String since the 0.1.1.")
    public convenience init(
        theme: any Theme,
        component: Component,
        feedbackState: FormFieldFeedbackState = .default,
        title: String? = nil,
        description: String? = nil,
        isTitleRequired: Bool = false
    ) {
        self.init(
            theme: theme,
            component: component,
            feedbackState: feedbackState,
            title: title,
            helper: description,
            isRequired: isTitleRequired
        )
    }

    /// Initialize a formField.
    /// - Parameters:
    ///   - theme: The current Spark-Theme.
    ///   - component: The component is covered by formfield.
    ///   - feedbackState: The formfield feedback state. 'Default' or 'Error'.
    ///   - attributedTitle: The formfield attributedTitle.
    ///   - attributedHelper: The formfield attributed helper message.
    ///   - isTitleRequired: The asterisk symbol at the end of title.
    @available(*, deprecated, message: "Replaced by the init with the title and helper String since the 1.1.0.")
    public convenience init(
        theme: any Theme,
        component: Component,
        feedbackState: FormFieldFeedbackState = .default,
        attributedTitle: NSAttributedString? = nil,
        attributedHelper: NSAttributedString? = nil,
        isTitleRequired: Bool = false
    ) {
        self.init(
            theme: theme,
            component: component,
            feedbackState: feedbackState,
            title: attributedTitle?.string,
            helper: attributedHelper?.string,
            isRequired: isTitleRequired
        )
    }

    // MARK: - Setup

    private func updateAccessibility() {
        self.accessibilityIdentifier = FormFieldAccessibilityIdentifier.formField
        self.isAccessibilityElement = false
        self.accessibilityContainerType = .semanticGroup
        self.updateAccessibilityElements()
    }

    private func setComponent() {
        self.stackView.insertArrangedSubview(self.component, at: 1)
        self.component.accessibilityRespondsToUserInteraction = true
    }

    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.stackView)
        NSLayoutConstraint.stickEdges(from: self.stackView, to: self)

        self.helperImageView.translatesAutoresizingMaskIntoConstraints = false
        self.helperIconSizeWidthLayoutConstraint = self.helperImageView.widthAnchor.constraint(equalToConstant: self.iconSize)
        self.helperIconSizeWidthLayoutConstraint?.isActive = true
        self.helperImageView.heightAnchor.constraint(equalTo: self.helperImageView.widthAnchor).isActive = true

        self.helperLabel.translatesAutoresizingMaskIntoConstraints = false
        self.helperLabel.heightAnchor.constraint(greaterThanOrEqualTo: self.helperImageView.heightAnchor).isActive = true

        self.secondaryHelperLabel.translatesAutoresizingMaskIntoConstraints = false
        self.secondaryHelperLabel.heightAnchor.constraint(greaterThanOrEqualTo: self.helperImageView.heightAnchor).isActive = true
    }

    // MARK: - Subscription

    private func subscribe() {
        // ***
        // Title
        self.viewModel.$formattedTitle.subscribe(in: &self.cancellables) { [weak self] formattedTitle in
            self?.titleLabel.isHidden = formattedTitle == nil
            self?.titleLabel.attributedText = formattedTitle?.leftValue
            self?.updateAccessibilityElements()
        }
        // ***

        // ***
        // Clear Button
        self.viewModel.$clearButtonFont.subscribe(in: &self.cancellables) { [weak self] font in
            self?.clearButton.configuration?.titleTextAttributesTransformer = .init { incoming in
                var outgoing = incoming
                outgoing.font = font.uiFont
                return outgoing
            }
        }

        self.viewModel.$clearButtonColor.subscribe(in: &self.cancellables) { [weak self] color in
            self?.clearButton.tintColor = color.uiColor
            self?.updateClearButtonImage()
        }
        // ***

        // ***
        // Helper
        self.viewModel.$helper.subscribe(in: &self.cancellables) { [weak self] text in
            self?.helperLabel.isHidden = text == nil
            self?.helperLabel.text = text
            self?.updateHelperImageVisibility()
            self?.updateAccessibilityElements()
        }

        self.viewModel.$helperFont.subscribe(in: &self.cancellables) { [weak self] font in
            self?.helperLabel.font = font.uiFont
        }

        self.viewModel.$helperColor.subscribe(in: &self.cancellables) { [weak self] color in
            self?.helperLabel.textColor = color.uiColor
            self?.helperImageView.tintColor = color.uiColor
        }
        // ***

        // ***
        // Seconday Helper
        self.viewModel.$secondaryHelper.subscribe(in: &self.cancellables) { [weak self] text in
            self?.secondaryHelperLabel.isHidden = text == nil
            self?.secondaryHelperLabel.text = text
            self?.updateAccessibilityElements()
        }

        self.viewModel.$secondaryHelperFont.subscribe(in: &self.cancellables) { [weak self] font in
            self?.secondaryHelperLabel.font = font.uiFont
        }

        self.viewModel.$secondaryHelperColor.subscribe(in: &self.cancellables) { [weak self] color in
            self?.secondaryHelperLabel.textColor = color.uiColor
        }
        // ***

        self.viewModel.$spacing.subscribe(in: &self.cancellables) { [weak self] spacing in
            guard let self = self else { return }
            self._spacing.wrappedValue = spacing
            self.updateSpacing()
        }
    }

    // MARK: - Update

    private func updateSpacing() {
        self.stackView.spacing = self.spacing
        self.headerStackView.spacing = self.spacing
        self.clearButton.configuration?.imagePadding = self.spacing
        self.footerStackView.spacing = self.spacing
        self.helperStackView.spacing = self.spacing
    }

    private func updateClearButtonImage() {
        let image: UIImage? = self.clearButtonImage?.resize(self.iconSize)?.withTintColor(self.viewModel.clearButtonColor.uiColor)
        self.clearButton.configuration?.image = image
    }

    private func updateHelperImageVisibility() {
        let isVisible = self.helperImageView.image != nil && !self.helperLabel.isHidden
        self.helperImageView.isHidden = !isVisible
    }

    private func updateAccessibilityElements() {
        let accessibilityElements = [
            self.titleLabel.isHidden ? nil : self.titleLabel,
            self.clearButton.isHidden ? nil : self.clearButton,
            self.component,
            self.helperLabel.isHidden ? nil : self.helperLabel,
            self.secondaryHelperLabel.isHidden ? nil : self.secondaryHelperLabel
        ].compactMap { $0 }

        self.accessibilityElements = accessibilityElements
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if self.traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory {
            self._spacing.update(traitCollection: traitCollection)
            self.updateSpacing()

            self._iconSize.update(traitCollection: traitCollection)
            self.updateClearButtonImage()
            self.helperIconSizeWidthLayoutConstraint?.constant = self.iconSize
            self.helperImageView.updateConstraintsIfNeeded()
        }
    }
}

// MARK: - Public Extension

public extension FormFieldUIView where Component: UITextInput {

    // MARK: - Public Setter

    /// Display a counter value (X/Y) in the secondary helper label with a text and the limit.
    /// - parameter text: the text where the characters must be counted.
    /// - parameter limit: the counter limit. If the value is nil, the counter is not displayed.
    ///
    /// ![FormField rendering with counter.](component_counter.png)
    func setCounter(on text: String?, limit: Int?) {
        self.viewModel.setCounter(textLength: text?.count, limit: limit)
    }

    /// Display a counter value (X/Y) in the secondary helper label with a text length and the limit.
    /// - parameter textLength: the text length.
    /// - parameter limit: the counter limit. If the value is nil, the counter is not displayed.
    ///
    /// ![FormField rendering with counter.](component_counter.png)
    func setCounter(on textLength: Int, limit: Int?) {
        self.viewModel.setCounter(textLength: textLength, limit: limit)
    }
}

public extension FormFieldUIView where Component: TextFieldAddonsUIView {

    // MARK: - Public Setter

    /// Display a counter value (X/Y) in the secondary helper label with a text and the limit.
    /// - parameter text: the text where the characters must be counted.
    /// - parameter limit: the counter limit. If the value is nil, the counter is not displayed.
    ///
    /// ![FormField rendering with counter.](component_counter.png)
    func setCounter(on text: String?, limit: Int?) {
        self.viewModel.setCounter(textLength: text?.count, limit: limit)
    }

    /// Display a counter value (X/Y) in the secondary helper label with a text length and the limit.
    /// - parameter textLength: the text length.
    /// - parameter limit: the counter limit. If the value is nil, the counter is not displayed.
    ///
    /// ![FormField rendering with counter.](component_counter.png)
    func setCounter(on textLength: Int, limit: Int?) {
        self.viewModel.setCounter(textLength: textLength, limit: limit)
    }
}

// MARK: - Private Extension

private extension UIImage {

    func resize(_ size: CGFloat) -> UIImage? {
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: size, height: size))
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        self.draw(in: frame)
        let resizedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.withRenderingMode(.alwaysOriginal)
        return resizedImage
    }
}

// MARK: - Label

public final class A11YLabel: UILabel {

    // MARK: - Private Properties

    private var _accessibilityLabel: String?
    private let viewModel: FormFieldViewModel

    // MARK: - Public Properties

    public override var accessibilityLabel: String? {
        get {
            self.viewModel.titleAccessibilityLabel
        }
        set {
            self.viewModel.customTitleAccessibilityLabel = newValue
        }
    }

    // MARK: - Initialization

    init(viewModel: FormFieldViewModel) {
        self.viewModel = viewModel

        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
