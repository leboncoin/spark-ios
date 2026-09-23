//
//  RatingValuesSnapshotTests.swift
//  SparkComponentRatingDisplayTests
//
//  Created by robin.lemaire on 12/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentRating

enum RatingValues: Double, CaseIterable {
    case `-1` = -1
    case `0` = 0
    case `0.24` = 0.24
    case `0.25` = 0.25
    case `0.26` = 0.26
    case `0.49` = 0.49
    case `0.50` = 0.50
    case `0.74` = 0.74
    case `0.75` = 0.75
    case `0.99` = 0.99
    case `1` = 1.0
    case `1.01` = 1.01
    case `1.5` = 1.5
    case `2` = 2.0
    case `2.5` = 2.5
    case `3` = 3.0
    case `3.5` = 3.5
    case `4` = 4.0
    case `4.5` = 4.5
    case `5` = 5.0
    case `6` = 6.0

    // MARK: - Properties

    static let inputAllCases: [RatingValues] = [
        .`-1`,
        .`0`,
        .`1`,
        .`2`,
        .`3`,
        .`4`,
        .`5`,
        .`6`
    ]

    static let `default`: Self = .`2`

    var formattedValue: String {
        NumberFormatter.shared.string(for: self.rawValue) ?? ""
    }
}
