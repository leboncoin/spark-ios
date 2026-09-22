//
//  TabScenarioOtherSnapshotTests.swift
//  SparkComponentTabSnapshotTests
//
//  Created by robin.lemaire on 09/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum TabScenarioOtherSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration() -> [TabConfigurationOtherSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test addSegment operations
    ///
    /// Content:
    ///  - operation: addSegment
    ///  - contentType: all
    private func test1() -> [TabConfigurationOtherSnapshotTests] {
        let contentTypes = TabUIOperationContentType.allCases

        return contentTypes.map { contentType in
            .init(
                scenario: self,
                operation: .addSegment,
                contentType: contentType
            )
        }
    }

    /// Test 2
    ///
    /// Description: To test insertSegment operations at different positions
    ///
    /// Content:
    ///  - operation: insertSegment
    ///  - insertPosition: all
    ///  - contentType: default
    private func test2() -> [TabConfigurationOtherSnapshotTests] {
        let insertPositions = TabUIInsertPosition.allCases

        return insertPositions.map { insertPosition in
            .init(
                scenario: self,
                operation: .insertSegment,
                insertPosition: insertPosition
            )
        }
    }

    /// Test 3
    ///
    /// Description: To test removeSegment operations at different positions
    ///
    /// Content:
    ///  - operation: removeSegment
    ///  - removePosition: all
    private func test3() -> [TabConfigurationOtherSnapshotTests] {
        let removePositions = TabUIRemovePosition.allCases

        return removePositions.map { removePosition in
            .init(
                scenario: self,
                operation: .removeSegment,
                removePosition: removePosition
            )
        }
    }
}
