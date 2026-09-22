//
//  SegmentedGaugeConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class SegmentedGaugeConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var type: SegmentedGaugeDemoType = .default
    var typeCustomLevel: Int = 1
    var typeCustomColorToken: ColorTokens = .random
    var typeCustomOpacity: Int = 50
    var segments: SegmentedGaugeSegments = .default
    var size: SegmentedGaugeSize = .default
    var alignment: SegmentedGaugeAlignment = .default
    var withMarker: Bool = true
    var title: String = "My Segmented Gauge"
    var description: String = "description"

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomTitle: Bool = false
    var swiftUICustomTitle = "is amazing"

    var swiftUIIsCustomDescription: Bool = false
    var swiftUICustomDescription = "perfect"

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedTitle = false
    var uiKitIsAttributedDescription = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.type = .random
        self.typeCustomColorToken = .random
        self.segments = .random
        self.size = .random
        self.alignment = .random
        self.withMarker = .random()
    }
}
