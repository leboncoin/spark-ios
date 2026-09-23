//
//  ComponentSnapshotTestMode.swift
//  SparkCoreTests
//
//  Created by robin.lemaire on 06/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit

@_spi(SI_SPI) @frozen public enum ComponentSnapshotTestMode: String {
    case dark
    case light

    // MARK: - Properties

    private var interfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .dark:
            return .dark
        case .light:
            return .light
        }
    }

    public var traitCollection: UITraitCollection {
        return .init(
            traitsFrom: [
                .init(userInterfaceStyle: self.interfaceStyle)
            ]
        )
    }

    public var suffix: String {
        return self.rawValue
    }
}
