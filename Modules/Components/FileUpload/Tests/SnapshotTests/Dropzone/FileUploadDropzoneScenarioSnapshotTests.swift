//
//  FileUploadDropzoneScenarioSnapshotTests.swift
//  SparkComponentFileUploadSnapshotTests
//
//  Created by robin.lemaire on 28/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum FileUploadDropzoneScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [FileUploadDropzoneConfigurationSnapshotTests] {
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
    /// Description: To test all content types
    ///
    /// Content:
    ///  - hasIcon: all
    ///  - contentType: all
    ///  - mode: default
    ///  - size: default
    private func test1() -> [FileUploadDropzoneConfigurationSnapshotTests] {
        let hasIconValues: [Bool] = [false, true]
        let contentTypes = FileUploadDropzoneContentType.allCases

        return hasIconValues.flatMap { hasIcon in
            contentTypes.map { type in
                    .init(
                        scenario: self,
                        contentType: type
                    )
            }
        }
    }

    /// Test 2
    ///
    /// Description: To test a11y sizes
    ///
    /// Content:
    ///  - hasIcon: true
    ///  - contentType: .default
    ///  - mode: default
    ///  - size: all
    private func test2() -> [FileUploadDropzoneConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                sizes: Constants.Sizes.all
            )
        ]
    }

    /// Test 3
    ///
    /// Description: To test modes
    ///
    /// Content:
    ///  - hasIcon: true
    ///  - contentType: .default
    ///  - mode: all
    ///  - size: default
    private func test3() -> [FileUploadDropzoneConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                modes: Constants.Modes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [FileUploadDropzoneConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                documentationName: "default"
            )
        ]
    }
}
