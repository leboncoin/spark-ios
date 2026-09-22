//
//  RatingDisplaySpacings.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct RatingDisplaySpacings: Equatable {

    // MARK: - Properties

    var content: CGFloat = .zero
    var stars: CGFloat = .zero
}

// MARK: Hashable & Equatable

extension RatingDisplaySpacings {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.content)
        hasher.combine(self.stars)
    }

    static func == (lhs: RatingDisplaySpacings, rhs: RatingDisplaySpacings) -> Bool {
        return lhs.content == rhs.content &&
        lhs.stars == rhs.stars
    }
}
