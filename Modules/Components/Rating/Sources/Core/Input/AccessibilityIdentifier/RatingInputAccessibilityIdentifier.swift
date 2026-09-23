//
//  RatingInputAccessibilityIdentifier.swift
//  SparkComponentRating
//
//  Created by Michael Zimmermann on 27.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// The accessibility identifiers of the rating input.
public enum RatingInputAccessibilityIdentifier {

    // MARK: - Properties

    /// The accessibility identifier.
    @available(*, deprecated, message: "Not used anymore by the new SparkRatingInput or SparkUIRatingInput")
    public static let identifier = "spark-rating-input"

    /// The view accessibility identifier.
    public static let view = "spark-rating-input"
}
