//
//  RatingDisplayAccessibilityIdentifier.swift
//  SparkComponentRating
//
//  Created by Michael Zimmermann on 21.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The accessibility identifiers of the rating display.
public enum RatingDisplayAccessibilityIdentifier {

    // MARK: - Properties

    /// The accessibility identifier.
    @available(*, deprecated, message: "Not used anymore by the new SparkRatingDisplay or SparkUIRatingDisplay")
    public static let identifier = "spark-rating-display"

    /// The view accessibility identifier.
    public static let view = "spark-rating-display"

    /// The text accessibility identifier.
    public static let text = "spark-rating-display-text"
}
