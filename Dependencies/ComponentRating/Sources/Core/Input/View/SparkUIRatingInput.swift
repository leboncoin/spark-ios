//
//  SparkUIRatingInput.swift
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

/// The ratings let users set a star rating for a user or experience.
///
/// The **value** passed in parameter must be between **0 and 5**.
///
/// ## Example of usage
///
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let ratingInput = SparkUIRatingInput(theme: theme)
/// ratingInput.value = 3.0
/// ratingInput.isEnabled = true
/// self.addSubview(ratingInput) 
/// ```
///
/// ## Accessibility
///
/// You must set an **accessibilityLabel** to give some context.
///
/// By default, the component set an localized **accessibilityValue**
/// with the current value and the number of stars :"1 out of 5" / "1 sur 5".
/// To override this value, you need to set a new **accessibilityValue**.
///
/// ## Rendering
///
/// ![Rating rendering.](rating_input_default.png)
///
/// ### When is disabled
///
/// ![Rating rendering.](rating_input_disabled.png)
/// 
public final class SparkUIRatingInput: UIControl {

    // MARK: - Components

    private lazy var starsStackView: RatingStarsUIStackView = {
        let view = RatingStarsUIStackView(viewModel: self.viewModel)
        view.colors = self.viewModel.colors
        view.size = RatingInputConstants.size
        view.contentSpacing = self.viewModel.spacing
        view.stars = self.stars
        view.value = self.value
        return view
    }()

    // MARK: - Public Properties

    private let valueChangedSubject = PassthroughSubject<Double, Never>()
    /// The publisher used to notify when value changed.
    public private(set) lazy var valueChangedPublisher: AnyPublisher<Double, Never> = self.valueChangedSubject.eraseToAnyPublisher()

    /// The spark theme of the rating.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// The indicator value of the rating.
    /// note: Value **MUST** be into 0 and 5.
    public var value: Double = 0 {
        didSet {
            self.starsStackView.value = self.value
            self.updateAccessibilityValue()
        }
    }

    /// A Boolean value indicating whether the control is in the enabled state.
    public override var isEnabled: Bool {
        didSet {
            self.viewModel.isEnabled = self.isEnabled
        }
    }

    // MARK: - Private Properties

    private let viewModel = RatingInputViewModel()
    private let stars = RatingInputConstants.stars
    private var selectedIndex: Int? {
        didSet {
            self.updateStarsScale()
        }
    }

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Create a rating input.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let ratingInput = SparkUIRatingInput(theme: theme)
    /// ratingInput.value = 3
    /// ratingInput.isEnabled = true
    /// self.addSubview(ratingInput)
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Rating rendering.](rating_input_default.png)
    public init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        // Setup
        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    func setupView() {
        // Add subviews
        self.addSubview(self.starsStackView)

        // View properties
        self.backgroundColor = .clear

        // Gestures
        self.enableTouch()
        self.addPanGestureToPreventCancelTracking()

        // Setup constraints
        self.setupConstraints()

        // Setup subscriptions
        self.setupSubscriptions()

        // Setup Accessibility
        self.setupAccessibility()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            isEnabled: self.isEnabled
        )
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.setupContentViewConstraints()
        self.setupContentViewConstraints()
    }

    private func setupContentViewConstraints() {
        self.starsStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.starsStackView,
            to: self
        )
    }

    // MARK: - Action

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        self.touchesAction(touches)
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        self.touchesAction(touches)
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)

        self.selectedIndex = nil
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        // Single touch
        if self.selectedIndex == nil {
            self.touchesAction(touches, touchEnded: true)

        } else {
            self.selectedIndex = nil
        }
    }

    private func touchesAction(_ touches: Set<UITouch>, touchEnded: Bool = false) {
        guard let point = touches.first?.location(in: self) else { return }

        let ratio = point.x / self.starsStackView.frame.width
        let newValue = self.viewModel.getNewValue(
            from: ratio
        )

        if !touchEnded {
            self.selectedIndex = Int(newValue) - 1
        }

        if newValue != self.value {
            self.value = newValue
            self.valueChanged()
        }
    }

    private func valueChanged() {
        // Send actions
        self.valueChangedSubject.send(self.value)
        self.sendActions(for: .valueChanged)

        // Update Accessibility
        self.updateAccessibilityValue()

        // Haptic
        UISelectionFeedbackGenerator().selectionChanged()
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        self.isAccessibilityElement = true
        self.accessibilityIdentifier = RatingInputAccessibilityIdentifier.view
        self.accessibilityTraits = .adjustable
        self.minimumContentSizeCategory = .large
        self.maximumContentSizeCategory = .extraExtraExtraLarge
        self.updateAccessibilityValue()
    }

    private func updateAccessibilityValue() {
        self.accessibilityValue = String.accessibilityValue(
            rating: self.value,
            numberOfStars: self.stars
        )
    }

    public override func accessibilityIncrement() {
        guard let value = self.viewModel.getIncrementedValue(from: self.value) else { return }
        self.value = value
        self.valueChanged()
    }

    public override func accessibilityDecrement() {
        guard let value = self.viewModel.getDecrementedValue(from: self.value) else { return }
        self.value = value
        self.valueChanged()
    }

    // MARK: - Update UI

    private func updateStarsScale() {
        UIView.optionalAnimate(withDuration: RatingInputConstants.scaledAnimationDuration) {
            for starView in self.starsStackView.starsViews {

                let scale = self.selectedIndex == starView.index ? RatingInputConstants.scaledRatio : 1

                starView.transform = CGAffineTransform(
                    scaleX: scale,
                    y: scale
                )
            }
        }
    }

    // MARK: - Subscribe

    func setupSubscriptions() {
        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            self.starsStackView.colors = colors
        }

        // Dim
        self.viewModel.$dim.subscribe(in: &self.subscriptions) { [weak self] dim in
            guard let self else { return }

            self.alpha = dim
        }

        // Spacing
        self.viewModel.$spacing.subscribe(in: &self.subscriptions) { [weak self] spacing in
            guard let self else { return }

            self.starsStackView.contentSpacing = spacing
        }
    }
}
