//
//  RatingDisplaySize.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

public enum RatingDisplaySize: Int, CaseIterable {
    case small = 12
    case medium = 16
    case large = 24
    @available(*, deprecated, message: "Not used anymore by the new SparkRatingInput/SparkRatingDisplay or SparkUIRatingInput/SparkUIRatingDisplay")
    case input = 40

    // MARK: - Properties

    public static var allCases: [RatingDisplaySize] = [
        .small,
        .medium,
        .large
    ]

    /// The default case. Equals to **.medium**.
    public static let `default`: Self = .medium

    internal var cgFloat: CGFloat {
        CGFloat(self.rawValue)
    }
}
