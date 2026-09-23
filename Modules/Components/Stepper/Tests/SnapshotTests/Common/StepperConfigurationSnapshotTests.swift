//
//  StepperSnapshotTestConfiguration.swift
//  SparkComponentStepper
//
//  Created by louis.borlee on 05/03/2025.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentStepper
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
import XCTest

struct StepperConfigurationSnapshotTests {

    // MARK: - Type Alias

    private typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    let scenario: StepperScenarioSnapshotTests

    let state: StepperState
    let contentResilience: StepperContentResilience

    let range = Double(0)...10

    let width: CGFloat?

    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Initialization

    init(
        scenario: StepperScenarioSnapshotTests,
        state: StepperState,
        contentResilience: StepperContentResilience,
        isFullWidth: Bool,
        modes: [ComponentSnapshotTestMode] = Constants.Modes.default,
        sizes: [UIContentSizeCategory] = Constants.Sizes.default
    ) {
        self.scenario = scenario
        self.state = state
        self.contentResilience = contentResilience
        self.width = isFullWidth ? 300 : nil
        self.modes = modes
        self.sizes = sizes
    }

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.state)" + "State",
            "\(self.contentResilience.rawValue)" + "Content",
            self.width != nil ? "LargeWidth" : "DefaultWidth"
        ].joined(separator: "-")
    }
}

// MARK: - Enum

enum StepperState: String, CaseIterable {
    case enabled
    case disabled
    case plusDisabled
    case minusDisabled

    // MARK: - Properties

    func isEnabled() -> Bool {
        switch self {
        case .enabled, .plusDisabled, .minusDisabled:
            return true
        default:
            return false
        }
    }

    func value(from range: ClosedRange<Double>) -> Double {
        switch self {
        case .enabled: 2
        case .disabled: 8
        case .plusDisabled: range.upperBound
        case .minusDisabled: range.lowerBound
        }
    }
}

enum StepperContentResilience: String, CaseIterable {
    case numberOnly
    case percentage
    case currency
}
