//
//  SliderConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class SliderConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: SliderIntent = .random
    var shape: SliderShape = .random

    var valueString: String = String(Float.random(in: 0..<1))

    var stepString: String = "0.1"

    var lowerBoundString: String = "0.0"
    var upperBoundString: String = "1.0"

    // MARK: - UIKit Properties Only

    var uiKitIsContinuous: Bool = .random()

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Getter

    func value() -> Float {
        Float(self.valueString) ?? 0
    }

    func step() -> Float.Stride {
        if let value = Float(self.stepString), value > 0 {
            return Float.Stride(self.stepString) ?? 0.1
        }

        return 0.1
    }

    func bounds() -> ClosedRange<Float> {
        guard let lowerBound = Float(self.lowerBoundString),
              let upperBound = Float(self.upperBoundString),
              upperBound > lowerBound else {
            return 0...1
        }

        return lowerBound...upperBound
    }

    func getInfoValue(from value: Float) -> String {
        "Value: " + String(format: "%.2f", value)
    }
}
