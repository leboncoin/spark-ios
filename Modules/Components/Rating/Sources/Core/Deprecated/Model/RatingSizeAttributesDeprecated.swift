//
//  RatingSizeAttributesDeprecated.swift
//  SparkComponentRating
//
//  Created by Michael Zimmermann on 17.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "Not used anymore by the new SparkRatingInput/SparkRatingDisplay or SparkUIRatingInput/SparkUIRatingDisplay")
struct RatingSizeAttributesDeprecated: Equatable {
    let borderWidth: CGFloat
    let height: CGFloat
    let spacing: CGFloat
}
