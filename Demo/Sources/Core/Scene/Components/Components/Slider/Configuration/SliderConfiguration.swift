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

    var intent: SliderIntent = .default

    var valueString: String = String(Float(Int.random(in: 0...10)) / 10)
    var isStep: Bool = true

    var titleString: String = ""

    var lowerBoundString: String = "0.0"
    var upperBoundString: String = "1.0"
    var stepString: String = "0.1"

    var minimumValue: Float {
        Float(self.lowerBoundString) ?? 0
    }

    var maximumValue: Float {
        Float(self.upperBoundString) ?? 1
    }

    var isValueLabel: Bool = false
    var customValueLabel: String = ""
    var isRangeValuesLabel: Bool = false

    var isFloatingValueLabel: Bool = false

    // MARK: - UIKit Properties Only

    var uiKitIsContinuous: Bool = true
    var uiKitIsAttributedText: Bool = false

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomValue: Bool = false
    var swiftUISecondText = "€"

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
        self.accessibilityValue.showConfiguration = true
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
        guard self.minimumValue < self.maximumValue else {
            return 0...1
        }

        return self.minimumValue...self.maximumValue
    }

    func getFormattedValue(from value: Float) -> String {
        NumberFormatter.shared.string(for: value) ?? ""
    }

    func getInfoValue(from value: Float) -> String {
        "Value: " + (NumberFormatter.shared.string(for: value) ?? "")
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.uiKitIsContinuous = .random()
        self.uiKitIsAttributedText = .random()
        self.isStep = .random()
        self.swiftUIIsCustomValue = .random()
        self.isValueLabel = .random()
        self.isRangeValuesLabel = .random()
    }
}

// MARK: - Extension

private extension NumberFormatter {

    static let shared: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}

