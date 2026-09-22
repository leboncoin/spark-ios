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

    var stars: RatingDisplayStars = .default
    var size: RatingDisplaySize = .default
    var rating: CGFloat = CGFloat(Int.random(in: 1...5))

    var text = ""
    var countText = ""
    var additionalText = ""

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedText: Bool = false

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false
    var swiftUISecondText = "!"

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
        self.accessibilityValue.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.stars = .random
        self.size = .random
        self.rating = CGFloat(Int.random(in: 1...5))
    }
}
