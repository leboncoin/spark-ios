//
//  DotsIndicatorConfiguration.swift
//  SparkDemo
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkComponentDotsIndicator

class DotsIndicatorConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var size: DotsIndicatorSize = .default
    var intent: DotsIndicatorIntent = .default
    var numberOfPages: Int = 5
    var isInteractive: Bool = true

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.size = .random
        self.intent = .random
        self.numberOfPages = Int.random(in: 3...7)
        self.isInteractive = .random()
    }
}
