//
//  ProgressBarScenarioSnapshotTests.swift
//  SparkComponentProgressBarSnapshotTests
//
//  Created by robin.lemaire on 18/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import UIKit
import SwiftUI

enum ProgressBarScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case documentation

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration() -> [ProgressBarConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all intents
    ///
    /// Content:
    ///  - intents: all
    ///  - value : 0.5
    ///  - shape: default
    ///  - mode : all
    ///  - size : default
    private func test1() -> [ProgressBarConfigurationSnapshotTests] {
        let intents = ProgressBarIntent.allCases

        return intents.map { intent -> ProgressBarConfigurationSnapshotTests in
            .init(
                scenario: self,
                intent: intent,
                modes: Constants.Modes.all
            )
        }
    }

    /// Test 2
    ///
    /// Description: To test all shapes for all a11y sizes
    ///
    /// Content:
    /// - intent: main
    /// - value : 0.5
    /// - shapes: all
    /// - mode : default
    /// - sizes : all
    private func test2() -> [ProgressBarConfigurationSnapshotTests] {
        let shapes = ProgressBarShape.allCases

        return shapes.map { shape -> ProgressBarConfigurationSnapshotTests in
            .init(
                scenario: self,
                shape: shape,
                sizes: Constants.Sizes.all
            )
        }
    }

    /// Test 3
    ///
    /// Description: To test some values for all a11y sizes
    ///
    /// Content:
    /// - intent: support
    /// - value : 0 + 0.3 + 0.75 + 1
    /// - shape: default
    /// - mode : default
    /// - sizes : all
    private func test3() -> [ProgressBarConfigurationSnapshotTests] {
        let valuesPossibilities = [0, 0.3, 0.75, 1]

        return valuesPossibilities.map { value -> ProgressBarConfigurationSnapshotTests in
            .init(
                scenario: self,
                value: value,
                sizes: Constants.Sizes.all
            )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [ProgressBarConfigurationSnapshotTests] {
        var items: [ProgressBarConfigurationSnapshotTests] = []

        // ProgressBar
        items.append(.init(
            scenario: self,
            documentationName: "default"
        ))

        return items
    }
}
