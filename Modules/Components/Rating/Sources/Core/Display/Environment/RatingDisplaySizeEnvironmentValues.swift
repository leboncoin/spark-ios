//
//  RatingDisplaySizeEnvironmentValues.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var ratingDisplaySize: RatingDisplaySize = .default
}

public extension View {

    /// Set the **size** on the ``SparkRatingDisplay``.
    ///
    /// The default value for this property is *RatingDisplaySize.medium*.
    func sparkRatingDisplaySize(_ size: RatingDisplaySize) -> some View {
        self.environment(\.ratingDisplaySize, size)
    }
}
