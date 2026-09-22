//
//  AdaptiveUIStackView.swift
//  SparkCommon
//
//  Created by robin.lemaire on 28/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

@available(*, deprecated, message: "Use SparkAdaptiveUIStackView instead.")
public typealias AdaptiveUIStackView = SparkAdaptiveUIStackView

/// StackView that changes its layout if the preferred font size in the accessibility category
///
/// Implementation example :
/// ```swift
/// let stackView = AdaptiveUIStackView(arrangedSubviews: [
///     UIView(),
///     UIView()
/// ])
///
/// // Axis
/// stackView.regularAxis = .horizontal
/// stackView.accessibilityAxis = .vertical
///
/// // Distribution
/// stackView.distribution = .fill
/// stackView.accessibilityDistribution = .equalCentering
///
/// // Alignment
/// stackView.alignment = .bottom
/// stackView.accessibilityAlignment = .trailing
///
/// // Spacing
/// stackView.regularSpacing = 8
/// stackView.accessibilitySpacing = 16
///
/// stackView.accessibilityInterfaceSizeClass = .compact
/// ```
public class SparkAdaptiveUIStackView: UIStackView {

    // MARK: - Override Properties

    /// The axis property determines the stack’s orientation, either vertically or horizontally.
    ///
    /// If the setted value is different from ``regularAxis`` and ``accessibilityAxis``, both values will be set to this value.
    public override var axis: NSLayoutConstraint.Axis {
        willSet {
            guard newValue != self.regularAxis && newValue != self.accessibilityAxis else {
                return
            }

            self.regularAxis = newValue
            self.accessibilityAxis = newValue
        }
    }

    /// The distribution property determines the layout of the arranged views along the stack’s axis.
    ///
    /// If the setted value is different from ``regularDistribution`` and ``accessibilityDistribution``, both values will be set to this value.
    public override var distribution: UIStackView.Distribution {
        willSet {
            guard newValue != self.regularDistribution && newValue != self.accessibilityDistribution else {
                return
            }

            self.regularDistribution = newValue
            self.accessibilityDistribution = newValue
        }
    }

    /// The alignment property determines the layout of the arranged views perpendicular to the stack’s axis.
    ///
    /// If the setted value is different from ``regularAlignment`` and ``accessibilityAlignment``, both values will be set to this value.
    public override var alignment: UIStackView.Alignment {
        willSet {
            guard newValue != self.regularAlignment && newValue != self.accessibilityAlignment else {
                return
            }

            self.regularAlignment = newValue
            self.accessibilityAlignment = newValue
        }
    }

    /// The spacing property determines the minimum spacing between arranged views.
    ///
    /// If the setted value is different from ``regularSpacing`` and ``accessibilitySpacing``, both values will be set to this value.
    public override var spacing: CGFloat {
        willSet {
            guard newValue != self.regularSpacing && newValue != self.accessibilitySpacing else {
                return
            }

            self.regularSpacing = newValue
            self.accessibilitySpacing = newValue
        }
    }

    // MARK: - Regular Properties

    /// The axis along which the arranged views lay out when the content size category is **not on accessible mode**.
    /// Default is **.horizontal**.
    public var regularAxis: NSLayoutConstraint.Axis = .horizontal {
        didSet {
            self.updateStackViewForCurrentContentSize()
        }
    }

    /// The distribution property determines the layout of the arranged views along the stack’s axis when the content size category is **not on accessible mode**.
    /// Default is **.fill**.
    public var regularDistribution: UIStackView.Distribution = .fill {
        didSet {
            self.updateStackViewForCurrentContentSize()
        }
    }

    /// The alignment property determines the layout of the arranged views perpendicular to the stack’s axis when the content size category is **not on accessible mode**.
    /// Default is **.fill**.
    public var regularAlignment: UIStackView.Alignment = .fill {
        didSet {
            self.updateStackViewForCurrentContentSize()
        }
    }

    /// The spacing property determines the minimum spacing between arranged views when the content size category is **not on accessible mode**.
    /// Default is **.zero**.
    public var regularSpacing: CGFloat = .zero {
        didSet {
            self.updateStackViewForCurrentContentSize()
        }
    }

    // MARK: - Accessibility Properties

    /// The axis along which the arranged views lay out when the content size category is **on accessible mode**.
    /// Default is **.vertical**.
    public var accessibilityAxis: NSLayoutConstraint.Axis = .vertical {
        didSet {
            self.updateStackViewForCurrentContentSize()
        }
    }

    /// The distribution property determines the layout of the arranged views along the stack’s axis when the content size category is **on accessible mode**.
    /// Default is **.fill**.
    public var accessibilityDistribution: UIStackView.Distribution = .fill {
        didSet {
            self.updateStackViewForCurrentContentSize()
        }
    }

    /// The alignment property determines the layout of the arranged views perpendicular to the stack’s axis when the content size category is **on accessible mode**.
    /// Default is **.fill**.
    public var accessibilityAlignment: UIStackView.Alignment = .fill {
        didSet {
            self.updateStackViewForCurrentContentSize()
        }
    }

    /// The spacing property determines the minimum spacing between arranged views when the content size category is **on accessible mode**.
    /// Default is **.zero**.
    public var accessibilitySpacing: CGFloat = .zero {
        didSet {
            self.updateStackViewForCurrentContentSize()
        }
    }

    /// To switch between the regular and the accessible mode only the preferredContentSizeCategory is using when this value is nil.
    /// Use this **accessibilityInterfaceSizeClass** to add an interface rules.
    /// Default is **nil**.
    ///
    /// E.g : If you have a horizontal stack and change to vertical when
    /// - the content size category is on accessible mode
    /// - but only when interface size class is equals to .compact
    ///
    /// You must :
    /// ```swift
    /// let stackView = AdaptiveUIStackView(arrangedSubviews: [UIView(), UIView()])
    /// stackView.regularAxis = .horizontal
    /// stackView.accessibilityAxis = .vertical
    /// stackView.accessibilityInterfaceSizeClass = .compact
    /// ```
    public var accessibilityInterfaceSizeClass: UIUserInterfaceSizeClass?

    // MARK: - Update

    private func updateStackViewForCurrentContentSize() {
        let isAccessibilitySizeClass = self.accessibilityInterfaceSizeClass == nil || self.traitCollection.horizontalSizeClass == self.accessibilityInterfaceSizeClass

        if self.traitCollection.preferredContentSizeCategory.isAccessibilityCategory && isAccessibilitySizeClass {
            self.axis = self.accessibilityAxis
            self.distribution = self.accessibilityDistribution
            self.alignment = self.accessibilityAlignment
            self.spacing = self.accessibilitySpacing
        } else {
            self.axis = self.regularAxis
            self.distribution = self.regularDistribution
            self.alignment = self.regularAlignment
            self.spacing = self.regularSpacing
        }
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if previousTraitCollection?.preferredContentSizeCategory != self.traitCollection.preferredContentSizeCategory ||
            previousTraitCollection?.horizontalSizeClass != self.traitCollection.horizontalSizeClass {
            self.updateStackViewForCurrentContentSize()
        }
    }
}
