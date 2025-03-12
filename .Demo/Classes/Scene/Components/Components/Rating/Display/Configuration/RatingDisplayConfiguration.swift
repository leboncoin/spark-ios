//
//  RatingDisplayConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class RatingDisplayConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: RatingIntent = .random
    var size: RatingDisplaySize = .random
    var rating: CGFloat = CGFloat(Int.random(in: 1...5))
    var numberOfStars: RatingStarsCount = .five

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }
}
