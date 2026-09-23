//
//  SparkUIProgressBarIndeterminate.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A progress bar visually represents the completion status of a task or process.
///
/// ## Context
///
/// The progress bar component is used to express a waiting time.
///
/// ## Example of usage
///
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let progressBar = SparkUIProgressBarIndeterminate(theme: theme)
/// progressBar.intent = .main
/// progressBar.shape = .rounded
/// self.addSubview(progressBar)
///
/// // Start the animation
/// progressBar.startAnimating()
///
/// // Stop the animation
/// progressBar.stopAnimating()
/// ```
///
/// ## Accessibility
///
/// By default, the component is not accessible.
/// To override this value, you need to set the **isAccessibilityElement** to *true*.
///
/// In this case, an **accessibilityLabel** must be setted.
///
public final class SparkUIProgressBarIndeterminate: ProgressBarContainerUIView {

    // MARK: - Private Properties

    private let viewModel = ProgressBarIndeterminateUIViewModel()

    private var isAnimated: Bool = false {
        didSet {
            self.viewModel.isAnimated = isAnimated
        }
    }

    private var indicatorLeadingConstraint: NSLayoutConstraint?

    private var firstAnimator: UIViewPropertyAnimator?
    private var lastAnimator: UIViewPropertyAnimator?

    // MARK: - Initialization

    /// Create an indeterminate progress bar.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let progressBar = SparkUIProgressBarIndeterminate(theme: theme)
    /// progressBar.intent = .main
    /// progressBar.shape = .rounded
    /// self.addSubview(progressBar)
    ///
    /// // Start the animation
    /// progressBar.startAnimating()
    ///
    /// // Stop the animation
    /// progressBar.stopAnimating() 
    /// ```
    /// 
    public init(theme: any Theme) {
        super.init(
            theme: theme,
            viewModel: self.viewModel
        )
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    override func setupView() {
        super.setupView()

        // Accessibility
        self.isAccessibilityElement = false

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent,
            shape: self.shape,
            isAnimated: self.isAnimated
        )
    }

    // MARK: - Constraints

    override func setupIndicatorConstraints() {
        self.indicatorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.indicatorView.topAnchor.constraint(equalTo: self.topAnchor),
            self.indicatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        self.indicatorLeadingConstraint = self.indicatorView.leadingAnchor.constraint(
            equalTo: self.trackView.leadingAnchor
        )
        self.indicatorLeadingConstraint?.isActive = true

        self.indicatorWidthConstraint = self.indicatorView.widthAnchor.constraint(equalToConstant: 0)
        self.indicatorWidthConstraint?.isActive = true
    }

    // MARK: - Animation

    /// Start the infinite animation
    public func startAnimating() {
        if !self.isAnimated {
            self.resetIndicatorConstraints()
            self.reloadAnimation(isFirstAnimation: true)

            self.isAnimated = true
        }
    }

    /// Stop the infinite animation
    public func stopAnimating() {
        if self.isAnimated {
            // Stop animation
            self.firstAnimator?.stopAnimation(true)
            self.lastAnimator?.stopAnimation(true)

            self.resetIndicatorConstraints()

            self.isAnimated = false
        }
    }

    private func reloadAnimation(isFirstAnimation: Bool) {
        let animationDuration = ProgressBarIndeterminateConstants.Animation.duration
        // Frames
        // **
        // First Animator
        let easeInAnimation = self.viewModel.easeInAnimatedData(
            trackWidth: self.trackView.frame.width
        )
        self.firstAnimator = UIViewPropertyAnimator(
            duration: animationDuration,
            curve: .easeIn
        )
        self.firstAnimator?.addAnimations { [weak self] in
            guard let self else { return }

            self.indicatorLeadingConstraint?.constant = easeInAnimation.leadingSpaceWidth
            self.indicatorWidthConstraint?.constant = easeInAnimation.indicatorWidth

            self.layoutIfNeeded()
        }
        // **

        // **
        // Last Animator
        let easeOutAnimation = self.viewModel.easeOutAnimatedData(
            trackWidth: self.trackView.frame.width
        )
        self.lastAnimator = UIViewPropertyAnimator(
            duration: animationDuration,
            curve: .easeOut
        )
        self.lastAnimator?.addAnimations { [weak self] in
            guard let self else { return }

            self.indicatorLeadingConstraint?.constant = easeOutAnimation.leadingSpaceWidth
            self.indicatorWidthConstraint?.constant = easeOutAnimation.indicatorWidth

            self.layoutIfNeeded()
        }
        self.lastAnimator?.addCompletion { [weak self] position in
            guard let self else { return }

            if position == .end {
                self.resetIndicatorConstraints()

                self.reloadAnimation(
                    isFirstAnimation: false
                )
            }
        }
        // **

        // Start animations
        self.firstAnimator?.startAnimation(
            afterDelay: isFirstAnimation ? 0 : animationDuration
        )
        self.lastAnimator?.startAnimation(
            afterDelay: isFirstAnimation ? animationDuration : animationDuration * 2
        )
    }

    // MARK: - Update Constraints

    private func resetIndicatorConstraints() {
        let animation = self.viewModel.resetAnimatedData(
            trackWidth: self.trackView.frame.width
        )
        self.indicatorLeadingConstraint?.constant = animation.leadingSpaceWidth
        self.indicatorWidthConstraint?.constant = animation.indicatorWidth

        self.layoutIfNeeded()
    }
}
