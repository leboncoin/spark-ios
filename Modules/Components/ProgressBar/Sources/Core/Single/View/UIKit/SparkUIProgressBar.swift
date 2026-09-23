//
//  SparkUIProgressBar.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming
import Combine

/// A progress bar visually represents the completion status of a task or process.
///
/// ## Context
///
/// The progress bar component is used to display the length and your progression inside the process.
///
/// The value used to display the current state **MUST** be into 0 (for 0 %) and 1 (for 100%)
///
/// ## Example of usage
///
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
///
/// let progressBar = SparkUIProgressBar(theme: theme)
/// progressBar.value = 0.5
/// progressBar.intent = .main
/// progressBar.shape = .rounded
/// self.addSubview(progressBar)
/// ```
///
/// ## Accessibility
///
/// By default, the accessibility value corresponding to the percentage of the value (Eg : **40%** for 0.4).
/// To override this value, you need to set a new **accessibilityValue**.
///
/// You also must set an **accessibilityLabel** to provide some context on the purpose of the component.
///
/// ## Rendering
///
/// ![ProgressBar rendering.](progress_bar_default.png)
public final class SparkUIProgressBar: ProgressBarContainerUIView {

    // MARK: - Public Properties

    /// The indicator value of the progress bar.
    /// note: Value **MUST** be into 0 (for 0 %) and 1 (for 100%)
    public var value: CGFloat = 0 {
        didSet {
            self.viewModel.value = self.value
            self.updateWidthConstraints()
            self.accessibilityValue = self.value.accessibilityValue
        }
    }

    // MARK: - Private Properties

    private let viewModel = ProgressBarUIViewModel()

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Create a progress bar.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    ///
    /// let progressBar = SparkUIProgressBar(theme: theme)
    /// progressBar.value = 0.5
    /// progressBar.intent = .main
    /// progressBar.shape = .rounded
    /// self.addSubview(progressBar) 
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![ProgressBar rendering.](progress_bar_default.png)
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

        // Update UI
        self.updateIndicatorVisibility()
        self.updateWidthConstraints()

        // Accessibility
        self.isAccessibilityElement = true

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent,
            shape: self.shape,
            value: self.value
        )
    }

    // MARK: - Update

    private func updateIndicatorVisibility(_ isHidden: Bool? = nil) {
        let isHidden = isHidden ?? self.viewModel.indicatorIsHidden

        self.indicatorView.isHidden = isHidden
    }

    private func updateWidthConstraints() {
        NSLayoutConstraint.updateMultiplier(
            on: &self.indicatorWidthConstraint,
            multiplier: self.value,
            layout: self.indicatorView.widthAnchor,
            equalTo: self.trackView.widthAnchor
        )
        self.indicatorView.updateConstraintsIfNeeded()
    }

    // MARK: - Subscribe

    /// Update the background color of the track and the indicator view
    /// This method is internal because it can be overriden by the view that inherits from this class
    override func setupSubscriptions() {
        super.setupSubscriptions()

        // IndicatorIsHidden
        self.viewModel.$indicatorIsHidden.subscribe(in: &self.subscriptions) { [weak self] indicatorIsHidden in
            guard let self else { return }

            self.updateIndicatorVisibility(indicatorIsHidden)
        }
    }
}
