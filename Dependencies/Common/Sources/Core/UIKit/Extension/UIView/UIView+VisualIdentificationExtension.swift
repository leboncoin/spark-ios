//
//  UIView+VisualIdentificationExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 29/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit

@_spi(SI_SPI) public extension UIView {

    // MARK: - Constants

    private enum Constants {
        static let identifier = "sparkVisualIdentification"
    }

    // MARK: - Methods

    /// Apply a background on the current view.
    /// Used to differentiate a Spark component (with the background)
    /// and a custom view (without the background).
    /// - Parameters:
    ///  - id: The identifier of the spark component view.
    ///  - featureTogglesService: The feature toggles service. Defaults to the shared instance.
    ///
    /// **Info** : Must be applied in the in the *layoutSubviews* to ensure that the feature works :
    /// ```swift
    /// public override func layoutSubviews() {
    ///     super.layoutSubviews()
    ///
    ///     self.sparkVisualIdentification(id: self.visualIdentification)
    /// }
    /// ```
    func sparkVisualIdentification(
        id: String,
        featureTogglesService: any SparkFeatureToggleServicing = SparkFeatureToggleService.shared
    ) {
        let completeIdentifier = Constants.identifier + id

        // Look for identification view in superview
        let identificationView = self.superview?.subviews.first(where: { $0.accessibilityIdentifier == completeIdentifier })

        // Remove the view if the toggle is disabled
        guard featureTogglesService.visualIdentification else {
            identificationView?.removeFromSuperview()
            return
        }

        // Ensure we have a superview to add the background to
        guard let superview = self.superview else {
            return
        }

        // View Already exists ?
        if let identificationView {
            superview.sendSubviewToBack(identificationView)

        } else {
            // Create the view
            let backgroundView = UIView()
            backgroundView.accessibilityIdentifier = completeIdentifier
            backgroundView.backgroundColor = UIColor.green.withAlphaComponent(0.8)
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            backgroundView.isUserInteractionEnabled = false

            superview.insertSubview(backgroundView, belowSubview: self)

            NSLayoutConstraint.stickEdges(from: backgroundView, to: self)
        }
    }
}
