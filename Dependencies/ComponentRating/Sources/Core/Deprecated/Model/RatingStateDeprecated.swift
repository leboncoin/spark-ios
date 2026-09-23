//
//  RatingStateDeprecated.swift
//  SparkComponentRating
//
//  Created by michael.zimmermann on 09.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon

@available(*, deprecated, message: "Not used anymore by the new SparkRatingInput/SparkRatingDisplay or SparkUIRatingInput/SparkUIRatingDisplay")
struct RatingStateDeprecated: Updateable, Equatable {
    var isEnabled: Bool
    var isPressed: Bool

    static var standard = RatingStateDeprecated(isEnabled: true, isPressed: false)
    static var disabled = RatingStateDeprecated(isEnabled: false, isPressed: false)
    static var pressed = RatingStateDeprecated(isEnabled: true, isPressed: true)
}
