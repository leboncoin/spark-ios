//
//  StepperConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 25/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class StepperConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var format: StepperFormat? = .optionalRandom

    var valueString: String = String(Int.random(in: 0..<100))

    var stepString: String = "1"

    var lowerBoundString: String = "0"
    var upperBoundString: String = "100"

    var contextAccessibilityLabel: String = ""
    var decrementAccessibilityLabel: String = ""
    var incrementAccessibilityLabel: String = ""

    // MARK: - UIKit Properties Only

    var uiKitIsAutoRepeat: Bool = .random()
    var uiKitIsContinuous: Bool = .random()
    var uiKitValueChangedType: StepperValueChangedType = .random

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.swiftUIIsMinWidth.showConfiguration = true
    }

    // MARK: - Getter

    func value() -> Float {
        Float(self.valueString) ?? 0
    }

    func step() -> Float {
        if let value = Float(self.stepString), value > 0 {
            return Float.Stride(self.stepString) ?? 1
        }

        return 1
    }

    func bounds() -> ClosedRange<Float> {
        guard let lowerBound = Float(self.lowerBoundString),
              let upperBound = Float(self.upperBoundString),
              upperBound > lowerBound else {
            return 0...100
        }

        return lowerBound...upperBound
    }

    // MARK: - Methods

    override func random() {
        self.format = .optionalRandom
        self.uiKitIsAutoRepeat = .random()
        self.uiKitIsContinuous = .random()
        self.uiKitValueChangedType = .random
    }
}
