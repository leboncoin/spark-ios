//
//  AvatarScenarioSnapshotTests.swift
//  SparkComponentAvatarSnapshotTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentAvatar
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum AvatarScenarioSnapshotTests: String, CaseIterable {
    case testCompanyPlaceholder
    case testUserPlaceholder
    case testImage
    case testCornerView
    case testBorder
    case testActionTypes
    case testDisabled
    case testModes
    case testA11ySizes
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [AvatarConfigurationSnapshotTests] {
        return switch self {
        case .testCompanyPlaceholder: self.testCompanyPlaceholder()
        case .testUserPlaceholder: self.testUserPlaceholder()
        case .testImage: self.testImage()
        case .testCornerView: self.testCornerView()
        case .testBorder: self.testBorder()
        case .testActionTypes: self.testActionTypes()
        case .testDisabled: self.testDisabled()
        case .testModes: self.testModes()
        case .testA11ySizes: self.testA11ySizes()
        case .documentation: self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test company placeholder
    ///
    /// Description: Tests all sizes with placeholder for company
    ///
    private func testCompanyPlaceholder() -> [AvatarConfigurationSnapshotTests] {
        let sizes = AvatarSize.allCases

        return sizes.map { size in
                .init(
                    scenario: self,
                    contentType: .company,
                    size: size
                )
        }
    }

    /// Test user placeholder
    ///
    /// Description: Tests some sizes with placeholder for user
    ///
    private func testUserPlaceholder() -> [AvatarConfigurationSnapshotTests] {
        let sizes = AvatarSize.someCases

        return sizes.map { size in
                .init(
                    scenario: self,
                    contentType: .user,
                    size: size
                )
        }
    }

    /// Test image
    ///
    /// Description: Tests all sizes with image
    ///
    private func testImage() -> [AvatarConfigurationSnapshotTests] {
        let contentTypes = AvatarContentType.allCases

        return contentTypes.map { contentType in
                .init(
                    scenario: self,
                    contentType: contentType,
                    isImage: true
                )
        }
    }

    /// Test corner view
    ///
    /// Description: Tests all sizes with corner view
    ///
    private func testCornerView() -> [AvatarConfigurationSnapshotTests] {
        let contentTypes = AvatarContentType.allCases
        let sizes = AvatarSize.someCases
        let cornerViewTypes = AvatarCornerViewType.allCases

        return contentTypes.flatMap { contentType in
            sizes.flatMap { size in
                cornerViewTypes.map { cornerViewType in
                        .init(
                            scenario: self,
                            contentType: contentType,
                            size: size,
                            cornerViewType: cornerViewType
                        )
                }
            }
        }
    }

    /// Test border
    ///
    /// Description: Tests all sizes with border
    ///
    private func testBorder() -> [AvatarConfigurationSnapshotTests] {
        let sizes = AvatarSize.someCases

        return sizes.map { size in
                .init(
                    scenario: self,
                    size: size,
                    isBorder: true
                )
        }
    }

    /// Test action types
    ///
    /// Description: Tests all action types
    ///
    private func testActionTypes() -> [AvatarConfigurationSnapshotTests] {
        let cornerViewTypes = AvatarCornerViewType.allCases.filter { $0.isAction }
        let actionTypes = AvatarActionType.allCases

        return cornerViewTypes.flatMap { cornerViewType in
            actionTypes.map { actionType in
                    .init(
                        scenario: self,
                        size: .xxl,
                        cornerViewType: cornerViewType,
                        actionType: actionType
                    )
            }
        }
    }

    /// Test disabled
    ///
    /// Description: Tests disabled
    ///
    private func testDisabled() -> [AvatarConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                contentType: .company,
                isDisabled: true
            )
        ]
    }

    /// Test modes
    ///
    /// Description: Tests light and dark modes
    ///
    private func testModes() -> [AvatarConfigurationSnapshotTests] {
        let contentTypes = AvatarContentType.allCases
        let isImages = Bool.allCases

        return contentTypes.flatMap { contentType in
            isImages.map { isImage in
                    .init(
                        scenario: self,
                        contentType: contentType,
                        isImage: isImage,
                        modes: Constants.Modes.all
                    )
            }
        }
    }

    /// Test A11y sizes
    ///
    /// Description: Tests a11y sizes
    ///
    private func testA11ySizes() -> [AvatarConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                contentType: .user,
                sizes: Constants.Sizes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [AvatarConfigurationSnapshotTests] {
        var items: [AvatarConfigurationSnapshotTests] = []

        // All sizes
        AvatarSize.allCases.forEach { size in
            items.append(
                .init(
                    scenario: self,
                    size: size,
                    documentationName: "size_\(size)"
                )
            )
        }

        // All content type with image and placeholder
        AvatarContentType.allCases.forEach { contentType in
            Bool.allCases.forEach { isImage in
                items.append(
                    .init(
                        scenario: self,
                        contentType: contentType,
                        isImage: isImage,
                        documentationName: "\(contentType)_\(isImage.imageDocumentationStatus)"
                    )
                )
            }
        }

        // With Button Corner View
        AvatarContentType.allCases.forEach { contentType in
            items.append(
                .init(
                    scenario: self,
                    contentType: contentType,
                    size: .xxl,
                    cornerViewType: .button,
                    documentationName: "\(contentType)_placeholder_corner_button"
                )
            )
        }

        // With Badge Corner View
        AvatarContentType.allCases.forEach { contentType in
            Bool.allCases.forEach { isImage in
                items.append(
                    .init(
                        scenario: self,
                        contentType: contentType,
                        isImage: isImage,
                        cornerViewType: .badge,
                        documentationName: "\(contentType)_\(isImage.imageDocumentationStatus)_corner_badge"
                    )
                )
            }
        }

        return items
    }
}

// MARK: - Extension

private extension Bool {

    var imageDocumentationStatus: String {
        self ? "image" : "placeholder"
    }
}
