//
//  DotIndicatorConfiguration.swift
//  SparkDemo
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkComponentDotIndicator

class DotIndicatorConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var size: DotIndicatorSize = .default
    var intent: DotIndicatorIntent = .default
    var numberOfPages: Int = 5
    var currentPage: Int = 0
    var isInteractive: Bool = false

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
        self.currentPage = Int.random(in: 0..<self.numberOfPages)
        self.isInteractive = .random()
    }
}
