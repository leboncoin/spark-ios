//
//  RatingColorsDeprecated.swift
//  SparkComponentRating
//
//  Created by michael.zimmermann on 09.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

@available(*, deprecated, message: "Not used anymore by the new SparkRatingInput/SparkRatingDisplay or SparkUIRatingInput/SparkUIRatingDisplay")
struct RatingColorsDeprecated: Equatable {
    var fillColor: any ColorToken
    var strokeColor: any ColorToken
    var opacity: CGFloat

    static func == (lhs: RatingColorsDeprecated, rhs: RatingColorsDeprecated) -> Bool {
        return lhs.fillColor.equals(rhs.fillColor) &&
        lhs.strokeColor.equals(rhs.strokeColor) &&
        lhs.opacity == rhs.opacity
    }
}
