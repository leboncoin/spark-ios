//
//  TabScenarioSnapshotTests.swift
//  SparkComponentTabSnapshotTests
//
//  Created by robin.lemaire on 02/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentTab
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum TabScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6
    case test7
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [TabConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
        case .test5:
            return self.test5()
        case .test6:
            return self.test6()
        case .test7:
            return self.test7()
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
    ///  - size: default
    ///  - apportionsSegmentWidthsByContent: default
    ///  - content: .allValues
    ///  - mode: all
    private func test1() -> [TabConfigurationSnapshotTests] {
        let intents = TabIntent.allCases

        return intents.map { intent in
            .init(
                scenario: self,
                intent: intent,
                content: .allValues,
                modes: Constants.Modes.all
            )
        }
    }

    /// Test 2
    ///
    /// Description: To test all sizes
    ///
    /// Content:
    ///  - intents: default
    ///  - size: all
    ///  - apportionsSegmentWidthsByContent: default
    ///  - content: .allValues
    ///  - mode: default
    private func test2() -> [TabConfigurationSnapshotTests] {
        let sizes = TabSize.allCases

        return sizes.map { size in
            .init(
                scenario: self,
                size: size,
                content: .allValues
            )
        }
    }

    /// Test 3
    ///
    /// Description: To test apportionsSegmentWidthsByContent
    ///
    /// Content:
    ///  - intents: default
    ///  - size: default
    ///  - apportionsSegmentWidthsByContent: all (true and false)
    ///  - content: .allValues
    ///  - mode: default
    private func test3() -> [TabConfigurationSnapshotTests] {
        let apportionsSegmentWidthsByContents = Bool.allCases

        return apportionsSegmentWidthsByContents.map { apportionsSegmentWidthsByContent in
            .init(
                scenario: self,
                apportionsSegmentWidthsByContent: apportionsSegmentWidthsByContent,
                content: .allValues
            )
        }
    }

    /// Test 4
    ///
    /// Description: To test all contents
    ///
    /// Content:
    ///  - intents: default
    ///  - size: default
    ///  - apportionsSegmentWidthsByContent: default
    ///  - content: all
    ///  - contentType: all
    ///  - mode: default
    private func test4() -> [TabConfigurationSnapshotTests] {
        let contentTypes = TabContentType.allCases
        let contents = TabContent.allCases

        return contents.flatMap { content in
            contentTypes.map { contentType in
                .init(
                    scenario: self,
                    content: content,
                    contentType: contentType
                )
            }
        }
    }

    /// Test 5
    ///
    /// Description: To test selectedIndex
    ///
    /// Content:
    ///  - intents: default
    ///  - size: default
    ///  - apportionsSegmentWidthsByContent: default
    ///  - content: .allValues
    ///  - contentType: text
    ///  - selectedIndex: all (-1, 1, 2)
    ///  - mode: default
    private func test5() -> [TabConfigurationSnapshotTests] {
        let selectedIndices = [-1, 1, 2]

        return selectedIndices.map { selectedIndex in
            .init(
                scenario: self,
                content: .allValues,
                contentType: .text,
                selectedIndex: selectedIndex
            )
        }
    }

    /// Test 6
    ///
    /// Description: To test a11y sizes
    ///
    /// Content:
    ///  - intents: default
    ///  - size: default
    ///  - apportionsSegmentWidthsByContent: default
    ///  - content: .allValues
    ///  - contentType: text
    ///  - mode: default
    ///  - size: all
    private func test6() -> [TabConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                content: .allValues,
                contentType: .text,
                sizes: Constants.Sizes.all
            )
        ]
    }

    /// Test 7
    ///
    /// Description: To test modes
    ///
    /// Content:
    ///  - intents: default
    ///  - size: default
    ///  - apportionsSegmentWidthsByContent: default
    ///  - content: .allValues
    ///  - contentType: text
    ///  - mode: all
    private func test7() -> [TabConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                content: .allValues,
                contentType: .text,
                modes: Constants.Modes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [TabConfigurationSnapshotTests] {
        var items: [TabConfigurationSnapshotTests] = []

        // All contents with documentationName
        let contents = TabContent.allCases.filter { $0.documentationName != nil }
        items.append(contentsOf: contents.map { content in
            TabConfigurationSnapshotTests(
                scenario: self,
                content: content,
                documentationName: content.documentationName
            )
        })

        return items
    }
}
