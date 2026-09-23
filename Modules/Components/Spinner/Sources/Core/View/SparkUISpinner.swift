//
//  SparkUISpinner.swift
//  SparkComponentSpinner
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import Combine

/// The spinner is a revolving animated icon indicating ongoing process or loading activity.
///
/// A spinner is a dynamic graphical element used to indicate loading or processing,
/// providing visual feedback during wait times or background tasks.
///
/// ## Example of usage
/// 
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
/// let spinner = SparkUISpinner(theme: theme)
/// spinner.intent = .main
/// spinner.size = .small
/// self.addSubview(spinner)
/// ```
///
/// ## Accessibility
///
/// By default, the component is not accessible.
/// To override this value, you need to set the **isAccessibilityElement** to *true*.
///
/// In this case, an **accessibilityLabel** must be setted.
public final class SparkUISpinner: UIView {

    // MARK: - Public Properties

    /// The spark theme of the spinner.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// The intent of the spinner.
    /// Check the ``SpinnerIntent`` to see the **default** value.
    public var intent: SpinnerIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// The size of the spinner.
    /// Check the ``SpinnerSize`` to see the **default** value.
    public var size: SpinnerSize = .default {
        didSet {
            self.viewModel.size = self.size
        }
    }

    // MARK: - Private Properties

    private let viewModel = SpinnerViewModel()

    @ScaledUIFrame private var contentSize: CGFloat = 0
    @LimitedScaledUIMetric private var strokeWidth: CGFloat = SpinnerConstants.strokeWidth

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Create a spinner.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    /// let spinner = SparkUISpinner(theme: theme)
    /// spinner.intent = .main
    /// spinner.size = .small
    /// self.addSubview(spinner)
    /// ```
    public init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Properties
        self.backgroundColor = .clear

        self.setContentHuggingPriority(.required, for: .horizontal)
        self.setContentHuggingPriority(.required, for: .vertical)
        self.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.setContentCompressionResistancePriority(.required, for: .vertical)

        self.accessibilityIdentifier = SpinnerAccessibilityIdentifier.view
        self.isAccessibilityElement = false

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent,
            size: self.size
        )
    }

    // MARK: - Draw

    public override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let ctx = UIGraphicsGetCurrentContext() else { return }

        let center = rect.width / 2
        let centerPoint = CGPoint(x: center, y: center)

        let spinnerArc = UIBezierPath.arc(
            arcCenter: centerPoint,
            radius: (rect.width - self.strokeWidth) / 2
        )
        spinnerArc.lineWidth = self.strokeWidth
        ctx.setStrokeColor(self.viewModel.colorToken.uiColor.resolvedColor(with: self.traitCollection).cgColor)
        spinnerArc.stroke()

        self.layer.animate()
    }

    // MARK: - Intrinsic Content Size

    public override var intrinsicContentSize: CGSize {
        return CGSize(value: self.contentSize)
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // Color
        self.viewModel.$colorToken.subscribe(in: &self.subscriptions) { [weak self] _ in
            self?.setNeedsDisplay()
        }

        // Content Size
        self.viewModel.$contentSize.subscribe(in: &self.subscriptions) { [weak self] contentSize in
            guard let self else { return }

            self._contentSize = .init(
                wrappedValue: contentSize,
                traitCollection: self.traitCollection
            )
            self.invalidateIntrinsicContentSize()
        }
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        let oldContentSize = self.contentSize
        let oldStrokeWidth = self.strokeWidth

        self._strokeWidth.update(traitCollection: self.traitCollection)
        self._contentSize.update(traitCollection: self.traitCollection)

        if self.contentSize != oldContentSize || self.strokeWidth != oldStrokeWidth {
            self.setNeedsLayout()
        }
    }
}

// MARK: - Extension

private extension UIBezierPath {

    static func arc(
        arcCenter: CGPoint,
        radius: CGFloat
    ) ->  Self {
        return .init(
            arcCenter: arcCenter,
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat.pi,
            clockwise: true
        )
    }
}

private extension CALayer {

    private enum Animation {
        static let supportKey = "transform.rotation.z"
        static let layerKey = "spinner.layer"
    }

    func animate() {
        self.removeAllAnimations()

        let fullRotation = CABasicAnimation(keyPath: Animation.supportKey)
        fullRotation.fromValue = 0
        fullRotation.toValue = 2 * CGFloat.pi
        fullRotation.duration = SpinnerConstants.animationDuration
        fullRotation.repeatCount = .infinity
        fullRotation.isRemovedOnCompletion = false

        self.add(fullRotation, forKey: Animation.layerKey)
    }
}
