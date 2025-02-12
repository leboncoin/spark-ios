//
//  SliderConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation

class SliderConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: SliderIntent = .random
    var shape: SliderShape = .random

    var valueString: String = String(Float.random(in: 0..<1))

    var stepString: String = "0.0"

    var lowerBoundString: String = "0.0"
    var upperBoundString: String = "1.0"

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Setter

    func setValueString(_ value: Float) {
        self.valueString = String(value)
    }

    // MARK: - Getter

    func step() -> Float.Stride {
        return Float.Stride(self.stepString) ?? 0
    }

    func bounds() -> ClosedRange<Float> {
        guard let lowerBound = Float(self.lowerBoundString),
              let upperBound = Float(self.upperBoundString),
              upperBound > lowerBound else {
            return 0...1
        }

        return lowerBound...upperBound
    }
}
