//
//  RatingDisplayStars.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

public enum RatingDisplayStars: Int, CaseIterable {
    case one = 1
    case five = 5

    /// The default case. Equals to **.five**.
    public static let `default`: Self = .five
}
