//
//  TagConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class TagConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: TagIntent = .default
    var variant: TagVariant = .default
    var size: TagSize = .default
    var isHighlighted: Bool = false
    var icon: Iconography? = .optionalRandom
    var text = "My Tag"

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedText: Bool = false

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false
    var swiftUISecondText = "is amazing"

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Getter

    override func isInvertedBackground() -> Bool {
        self.intent == .surface
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.variant = .random
        self.size = .random
        self.isHighlighted = .random()
        self.icon = .random
    }
}
