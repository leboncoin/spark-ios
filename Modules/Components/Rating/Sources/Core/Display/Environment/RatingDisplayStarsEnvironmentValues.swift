//
//  RatingDisplayStarsEnvironmentValues.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var ratingDisplayStars: RatingDisplayStars = .default
}

public extension View {

    /// Set the **number of stars** on the ``SparkRatingDisplay``.
    ///
    /// The default value for this property is *RatingDisplayStars.five*.
    func sparkRatingDisplayStars(_ stars: RatingDisplayStars) -> some View {
        self.environment(\.ratingDisplayStars, stars)
    }
}
