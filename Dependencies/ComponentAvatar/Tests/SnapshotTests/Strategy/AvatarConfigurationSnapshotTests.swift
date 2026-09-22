//
//  AvatarConfigurationSnapshotTests.swift
//  SparkComponentAvatarSnapshotTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentAvatar
@testable import SparkComponentAvatarTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct AvatarConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: AvatarScenarioSnapshotTests

    var contentType: AvatarContentType = .user
    var size: AvatarSize = .default
    var isBorder: Bool = false
    var isImage: Bool = false
    var isDisabled: Bool = false
    var cornerViewType: AvatarCornerViewType?
    var actionType: AvatarActionType = .add

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        var components: [String?] = [
            "\(self.contentType)",
            "\(self.size)",
            self.isBorder ? "border" : nil,
            self.isImage ? "image" : "placeholder",
            self.isDisabled ? "disabled" : nil
        ]

        if let cornerViewType {
            components.append("\(cornerViewType)CornerView")
            if cornerViewType.isAction {
                components.append("\(self.actionType)")
            }
        }

        return components
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "avatar_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}
