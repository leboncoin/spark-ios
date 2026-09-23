//
//  RatingInputUIViewDelegate.swift
//  SparkComponentRating
//
//  Created by Michael Zimmermann on 29.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "Not used anymore by the new SparkRatingInput/SparkRatingDisplay or SparkUIRatingInput/SparkUIRatingDisplay")
public protocol RatingInputUIViewDelegate: AnyObject {
    /// The rating value was changed.
    /// - Parameters:
    ///   - rating: The updated rating input.
    ///   - rating: The new rating value.
    func rating(_ rating: RatingInputUIView, didChangeRating rating: CGFloat)
}
