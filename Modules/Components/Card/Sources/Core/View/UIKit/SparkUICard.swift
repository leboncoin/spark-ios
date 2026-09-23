//
//  SparkUICard.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import Combine

/// A cards display content and actions about a single subject.
///
/// A card is a block that groups related info (text, image, button). It helps show content clearly, compactly, and in a scannable way.
///
/// ## Example of usage
///
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
/// let cardContentView = UIView() // Put what you want in the content
///
/// let card = SparkUICard(
///     theme: theme,
///     contentView: cardContentView
/// )
/// card.intent = .main
/// card.isHighlightedStyle = true
/// card.isPadding = false
/// card.variant = .tinted
/// card.addAction(.init(handler: { [weak self] _ in
///    // Your action
/// }), for: .touchUpInside)
///
/// self.addSubview(card)
/// ```
///
/// ## TableView/CollectionView
///
/// If the card is used in a *tappable* **UITableViewCell** or **UICollectionViewCell**, you must :
/// - Remove the interaction on the card :
///     ```swift
///     self.isUserInteractionEnabled = false
///     ```
/// - Manage the highlight of the card (example with UICollectionViewDelegate):
///     ```swift
///     func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
///         if let cell = collectionView.cellForItem(at: indexPath) as? TheCollectionViewCell {
///             cell.card.isHighlighted = true
///         }
///     }
///
///     func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
///         if let cell = collectionView.cellForItem(at: indexPath) as? TheCollectionViewCell {
///             cell.card.isHighlighted = false
///         }
///     }
///     ```
///
/// ## Accessibility
///
/// You need to manage yourself the accessibility of the component because Spark doesn't know the context of the content.
///
/// If an action is provided, the card will be treated as a button.
///
/// ## Rendering
///
/// - Classic card:
/// ![Card rendering.](card_classic.png)
///
public final class SparkUICard: UIControl {

    // MARK: - Components

    private lazy var contentStackView = {
        let stackView = UIStackView()
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.addSubview(self.contentView)
        return stackView
    }()

    /// The content View of the card.
    /// Default is **UIView()**
    ///
    /// Must be overridden.
    public var contentView: UIView = UIView() {
        didSet {
            // Remove all subviews
            self.contentStackView.removeArrangedSubviews()

            self.contentStackView.addArrangedSubview(self.contentView)

            self.layoutIfNeeded()
        }
    }

    // MARK: - Public Properties

    /// The spark theme of the card.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = theme
        }
    }

    /// The intent of the card.
    ///
    /// The default value for this property is *CardIntent.default*.
    public var intent: CardIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// Highlighted or not the component. It will change the style of the corner radius. Default is **false**
    public var isHighlightedStyle: Bool = false {
        didSet {
            self.updateBorderRadius()
        }
    }

    public override var isHighlighted: Bool {
        didSet {
            self.viewModel.isPressed = self.isHighlighted
        }
    }

    public override var isEnabled: Bool {
        didSet {
            self.viewModel.isEnabled = self.isEnabled
            self.accessibilityTraits(.notEnabled, condition: !self.isEnabled)
        }
    }

    /// Add a padding or not in content. Default is **true**
    public var isPadding: Bool {
        get {
            return self.padding.isPadding
        }
        set {
            self.padding = newValue ? .all : .none
        }
    }

    /// The variant of the card.
    ///
    /// The default value for this property is *CardVariant.default*.
    public var variant: CardVariant = .default {
        didSet {
            self.viewModel.variant = self.variant
        }
    }

    // MARK: - Private Properties

    private let viewModel = CardViewModel()

    private var hasAction: Bool {
        self.allControlEvents == .touchUpInside
    }

    private var subscriptions = Set<AnyCancellable>()

    private var padding: CardPadding = .default {
        didSet {
            self.viewModel.padding = self.padding
        }
    }

    // MARK: - Initialization

    /// Creates a Spark card.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    /// let cardContentView = UIView() // Put what you want in the content
    ///
    /// let card = SparkUICard(
    ///     theme: theme,
    ///     contentView: cardContentView
    /// )
    /// card.intent = .main
    /// card.isHighlightedStyle = true
    /// card.isPadding = false
    /// card.variant = .tinted
    /// card.addAction(.init(handler: { [weak self] _ in
    ///    // Your action
    /// }), for: .touchUpInside)
    ///
    /// self.addSubview(card)
    /// ```
    ///
    /// - Parameters:
    ///   - theme: The spark theme of the card.
    ///   - contentView: The content view of the card.
    ///
    /// ## Rendering
    ///
    /// ![TextLink rendering.](card_classic.png)
    ///
    public init(
        theme: any Theme,
        contentView: UIView
    ) {
        self.theme = theme

        self.contentView = contentView

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Properties
        self.clipsToBounds = true
        self.accessibilityIdentifier = CardAccessibilityIdentifier.view

        // Add subview
        self.contentStackView.addArrangedSubview(self.contentView)
        self.addSubview(self.contentStackView)

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent,
            isEnabled: self.isEnabled,
            padding: self.padding,
            variant: self.variant,
            isHeader: false,
            headerPosition: .default
        )
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateBorderRadius()
    }

    // MARK: - Actions

    public override func addAction(
        _ action: UIAction,
        for controlEvents: UIControl.Event
    ) {
        super.addAction(action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    public override func removeAction(
        _ action: UIAction,
        for controlEvents: UIControl.Event
    ) {
        super.removeAction(action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    public override func addTarget(
        _ target: Any?,
        action: Selector,
        for controlEvents: UIControl.Event
    ) {
        super.addTarget(target, action: action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    public override func removeTarget(
        _ target: Any?,
        action: Selector?,
        for controlEvents: UIControl.Event
    ) {
        super.removeTarget(target, action: action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self
        )
    }

    // MARK: - Update UI

    private func updateBorderRadius(
        _ border: CardBorder? = nil,
        colors: CardColors? = nil
    ) {
        let border = border ?? self.viewModel.border
        let colors = colors ?? self.viewModel.colors

        self.layoutIfNeeded()

        self.sparkBorderRadius(
            width: border.width,
            radius: border.radius,
            isHighlighted: self.isHighlightedStyle,
            colorToken: colors.border
        )
    }

    private func updateContentPadding(_ padding: CGFloat? = nil) {
        let padding = padding ?? self.viewModel.layout.padding

        self.contentStackView.layoutMargins = .init(all: padding)
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // Border
        self.viewModel.$border.subscribe(in: &self.subscriptions) { [weak self] border in
            guard let self else { return }

            self.updateBorderRadius(border)
        }

        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            self.backgroundColor(colors.background)
            self.contentStackView.backgroundColor(colors.background)

            self.updateBorderRadius(colors: colors)
        }

        // Dim
        self.viewModel.$dim.subscribe(in: &self.subscriptions) { [weak self] dim in
            guard let self else { return }

            self.alpha = dim
        }

        // Padding
        self.viewModel.$layout.subscribe(in: &self.subscriptions) { [weak self] layout in
            guard let self else { return }

            self.updateContentPadding(layout.padding)
        }
    }

    // MARK: - Accessibility

    private func updateAccessibilityButtonTrait() {
        self.accessibilityTraits(.button, condition: self.hasAction)
    }

    // MARK: - Touches

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if self.viewTouched(touches) {
            self.isHighlighted = true
        }
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)

        self.isHighlighted = false
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        // Card is an action and user stop to tap on view
        if self.viewTouched(touches) {
            self.isHighlighted = false

            // Haptic
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()

            // Send actions
            self.sendActions(for: .touchUpInside)
        }
    }

    private func viewTouched(_ touches: Set<UITouch>) -> Bool {
        // Card is an action and the view is tapped
        // and it is not a button on the content view
        if self.hasAction,
           let touch = touches.first,
           self.bounds.contains(touch.location(in: self)),
           !(touch.view is UIControl) || touch.view == self {

            return true
        }

        return false
    }
}
