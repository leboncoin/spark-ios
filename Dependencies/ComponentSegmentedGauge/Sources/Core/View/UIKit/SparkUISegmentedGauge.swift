//
//  SparkUISegmentedGauge.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import Combine

/// The Segmented Gauge shows a value on a colored scale.
///
/// The Segmented Gauge is a non-interactive visual indicator made up of colored segments.
/// It shows a level or value along a scale (e.g., from “low” to “high”).
///
/// ## Example of usage
/// 
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
/// let segmentedGauge = SparkUISegmentedGauge(
///     theme: theme
/// )
/// segmentedGauge.alignment = .vertical
/// segmentedGauge.withMarker = false
/// segmentedGauge.segments = .three
/// segmentedGauge.size = .small
/// segmentedGauge.type = .veryLow
/// segmentedGauge.title = "My Segmented Gauge"
/// segmentedGauge.descriptionString = "The description of the gauge"
/// self.addSubview(segmentedGauge)
/// ```
///
/// ## Accessibility
///
/// By default, the *accessibilityLabel* concat the title text, the current segment percent and the description text.
/// To override this value, you need to set a new **accessibilityLabel**
///
/// > You need to reset the your custom **accessibilityLabel** each time your update
/// the ``title``/``attributedTitle`` and/or the ``descriptionString``/``attributedDescription``.
///
/// ## Rendering
///
/// With a title and description:
///
/// ![SegmentedGauge rendering.](segmented_gauge_all.png)
///
/// ![SegmentedGauge rendering.](segmented_gauge_all_label.png)
///
/// With a description only:
///
/// ![SegmentedGauge rendering.](segmented_gauge_description.png)
///
/// ![SegmentedGauge rendering.](segmented_gauge_description_label.png)
///
/// With all segments:
///
/// ![SegmentedGauge rendering.](segmented_gauge_segments_three.png)
///
/// ![SegmentedGauge rendering.](segmented_gauge_segments_five.png)
///
/// With all sizes:
///
/// ![SegmentedGauge rendering.](segmented_gauge_size_small.png)
///
/// ![SegmentedGauge rendering.](segmented_gauge_size_medium.png)
///
/// With a maker:
///
/// ![SegmentedGauge rendering.](segmented_gauge_marker.png)
///
public final class SparkUISegmentedGauge: UIView {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                self.titleLabel,
                self.subContentStackView
            ]
        )
        stackView.axis = .vertical
        stackView.isAccessibilityElement = false
        return stackView
    }()

    /// The UILabel used to display the segmented gauge title.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``title`` and ``attributedTitle`` directly on the ``SparkUISegmentedGauge``.
    public private(set) var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontForContentSizeCategory = true
        label.isHidden = true
        label.setContentCompressionResistancePriority(
            .required,
            for: .vertical
        )
        label.setContentCompressionResistancePriority(
            .required,
            for: .horizontal
        )
        return label
    }()

    private lazy var subContentStackView: SparkAdaptiveUIStackView = {
        return SparkAdaptiveUIStackView(
            arrangedSubviews: [
                self.segmentsStackView,
                self.descriptionLabel
            ]
        )
    }()

    private lazy var segmentsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: self.segmentsViews)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.maximumContentSizeCategory = .extraExtraExtraLarge
        return stackView
    }()

    private lazy var segmentsViews: [SegmentedGaugeSegmentUIView] = {
        (1...SegmentedGaugeSegments.max).map { index in
            SegmentedGaugeSegmentUIView(
                index: index
            )
        }
    }()

    /// The UILabel used to display the segmented gauge description.
    ///
    /// Please **do not set a text/attributedText** in this label but use
    /// the ``descriptionString`` and ``attributedDescription`` directly on the ``SparkUISegmentedGauge``.
    public private(set) var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontForContentSizeCategory = true
        label.isHidden = true
        label.setContentCompressionResistancePriority(
            .required,
            for: .vertical
        )
        label.setContentCompressionResistancePriority(
            .required,
            for: .horizontal
        )
        return label
    }()

    // MARK: - Public Properties

    /// The spark theme of the segmented gauge.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = self.theme
        }
    }

    /// The content alignment of the segmented gauge betweens the segments and the description.
    /// Check the ``SegmentedGaugeAlignment`` to see the **default** value.
    public var alignment: SegmentedGaugeAlignment = .default {
        didSet {
            self.viewModel.alignment = self.alignment
            self.updateAlignment()
        }
    }

    /// Display a marker on the current level.
    /// The **default** valie is **true**.
    ///
    /// ![SegmentedGauge rendering.](segmented_gauge_marker.png)
    public var withMarker: Bool = true {
        didSet {
            for segmentView in self.segmentsViews {
                segmentView.withMarker = self.withMarker
            }
        }
    }

    /// The segments of the segmented gauge.
    /// Check the ``SegmentedGaugeSegments`` to see the **default** value.
    ///
    /// ![SegmentedGauge rendering.](segmented_gauge_segments_three.png)
    ///
    ///  ![SegmentedGauge rendering.](segmented_gauge_segments_five.png)
    public var segments: SegmentedGaugeSegments = .default {
        didSet {
            self.viewModel.segments = self.segments
        }
    }

    /// The size of the segmented gauge.
    /// Check the ``SegmentedGaugeSize`` to see the **default** value.
    ///
    /// ![SegmentedGauge rendering.](segmented_gauge_size_small.png)
    ///
    /// ![SegmentedGauge rendering.](segmented_gauge_size_medium.png)
    public var size: SegmentedGaugeSize = .default {
        didSet {
            self.viewModel.size = self.size
        }
    }

    /// The type of the segmented gauge.
    /// Check the ``SegmentedGaugeType`` to see the **default** value.
    public var type: SegmentedGaugeType = .default {
        didSet {
            self.viewModel.type = self.type
        }
    }

    /// The title of the segmented gauge.
    /// Displayed at the top of the view.
    ///
    /// > This will also change the **accessibilityLabel** of the components.
    public var title: String? {
        get {
            return self.titleLabel.text
        }
        set {
            self.titleLabel.text(newValue)
            self.updateAccessibilityLabel()
        }
    }

    /// The attributed title of the segmented gauge.
    /// Displayed at the top of the view.
    ///
    /// > This will also change the **accessibilityLabel** of the components.
    public var attributedTitle: NSAttributedString? {
        get {
            return self.titleLabel.attributedText
        }
        set {
            self.titleLabel.attributedText(newValue)
            self.updateAccessibilityLabel()
        }
    }

    /// The description of the segmented gauge.
    /// Displayed at the right of the gauge or on bottom.
    ///
    /// > This will also change the **accessibilityLabel** of the components.
    public var descriptionString: String? {
        get {
            return self.descriptionLabel.text
        }
        set {
            self.descriptionLabel.text(newValue)
            self.updateAccessibilityLabel()
        }
    }

    /// The attributed description of the segmented gauge.
    /// Displayed at the right of the gauge or on bottom.
    ///
    /// > This will also change the **accessibilityLabel** of the components.
    public var attributedDescription: NSAttributedString? {
        get {
            return self.descriptionLabel.attributedText
        }
        set {
            self.descriptionLabel.attributedText(newValue)
            self.updateAccessibilityLabel()
        }
    }

    // MARK: - Private Properties

    private let viewModel = SegmentedGaugeViewModel()

    private var subscriptions = Set<AnyCancellable>()

    @LimitedScaledUIMetric private var contentSpacing: CGFloat = 0
    @LimitedScaledUIMetric private var subContentSpacing: CGFloat = 0
    @LimitedScaledUIMetric private var segmentsSpacing: CGFloat = 0

    // MARK: - Initialization

    /// Creates a Spark segmented gauge.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    /// let segmentedGauge = SparkUISegmentedGauge(
    ///     theme: theme
    /// )
    /// segmentedGauge.alignment = .vertical
    /// segmentedGauge.withMarker = false
    /// segmentedGauge.segments = .three
    /// segmentedGauge.size = .small
    /// segmentedGauge.type = .veryLow
    /// segmentedGauge.title = "My Segmented Gauge"
    /// segmentedGauge.descriptionString = "The description of the gauge"
    /// self.addSubview(segmentedGauge)
    /// ```
    ///
    /// ![SegmentedGauge rendering.](segmented_gauge_all.png)
    public init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Properties
        self.accessibilityIdentifier = SegmentedGaugeAccessibilityIdentifier.view

        // Add subview
        self.addSubview(self.contentStackView)

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Setup Accessibility
        self.setupAccessibility()

        // Update
        self.updateAlignment()
        self.updateAccessibilityLabel()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            alignment: self.alignment,
            segments: self.segments,
            size: self.size,
            type: self.type
        )
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.setupContentStackViewConstraints()
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            for segmentView in self.segmentsViews {
                segmentView.colors = colors
            }
        }

        // Labels Style
        self.viewModel.$labelsStyle.subscribe(in: &self.subscriptions) { [weak self] labelsStyle in
            guard let self else { return }

            self.titleLabel.font(labelsStyle.titleTypography)
            self.titleLabel.textColor(labelsStyle.color)

            self.descriptionLabel.font(labelsStyle.descriptionTypography)
            self.descriptionLabel.textColor(labelsStyle.color)
        }

        // Layout
        self.viewModel.$layout.subscribe(in: &self.subscriptions) { [weak self] layout in
            guard let self else { return }

            self._contentSpacing = .init(
                wrappedValue: layout.contentSpacing,
                traitCollection: self.traitCollection
            )
            self._subContentSpacing = .init(
                wrappedValue: layout.subContentSpacing,
                traitCollection: self.traitCollection
            )
            self._segmentsSpacing = .init(
                wrappedValue: layout.segmentsSpacing,
                traitCollection: self.traitCollection
            )

            self.updateLayout()
        }

        // Levels
        self.viewModel.$levels.subscribe(in: &self.subscriptions) { [weak self] levels in
            guard let self else { return }

            for segmentView in self.segmentsViews {
                segmentView.levels = levels
            }

            self.updateAccessibilityLabel(levels: levels)
        }

        // SegmentBorder
        self.viewModel.$segmentBorder.subscribe(in: &self.subscriptions) { [weak self] segmentBorder in
            guard let self else { return }

            for segmentView in self.segmentsViews {
                segmentView.segmentBorder = segmentBorder
            }
        }

        // Sizes
        self.viewModel.$sizes.subscribe(in: &self.subscriptions) { [weak self] sizes in
            guard let self else { return }

            for segmentView in self.segmentsViews {
                segmentView.sizes = sizes
            }
        }
    }

    // MARK: - Update UI

    private func updateLayout() {
        self.contentStackView.spacing = self.contentSpacing
        self.subContentStackView.spacing = self.subContentSpacing
        self.segmentsStackView.spacing = self.segmentsSpacing
    }

    private func updateAlignment() {
        switch self.alignment {
        case .horizontal:
            self.subContentStackView.regularAxis = .horizontal
            self.subContentStackView.accessibilityAxis = .vertical

            self.subContentStackView.regularAlignment = .center
            self.subContentStackView.accessibilityAlignment = .leading

        case .vertical:
            self.subContentStackView.regularAxis = .vertical
            self.subContentStackView.accessibilityAxis = .vertical

            self.subContentStackView.regularAlignment = .leading
            self.subContentStackView.accessibilityAlignment = .leading
        }
    }

    private func updateAccessibilityLabel(levels: SegmentedGaugeLevels? = nil) {
        let levels = levels ?? self.viewModel.levels

        self.accessibilityLabel = [
            self.titleLabel.text,
            self.descriptionLabel.text,
            levels.accessibilityLabel
        ].compactMap { $0 }.joined(separator: " ")
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        self.isAccessibilityElement = true
        self.maximumContentSizeCategory = .accessibilityExtraLarge
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        self._contentSpacing.update(traitCollection: self.traitCollection)
        self._subContentSpacing.update(traitCollection: self.traitCollection)
        self._segmentsSpacing.update(traitCollection: self.traitCollection)
        self.updateLayout()
    }
}
