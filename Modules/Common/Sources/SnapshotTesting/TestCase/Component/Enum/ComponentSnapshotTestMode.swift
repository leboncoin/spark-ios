//
//  ComponentSnapshotTestMode.swift
//  SparkSnapshotTesting
//
//  Created by robin.lemaire on 06/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit

/// The appearance mode used to render a snapshot.
@_spi(SI_SPI) @frozen public enum ComponentSnapshotTestMode: String {
    /// The dark appearance.
    case dark
    /// The light appearance.
    case light

    // MARK: - Properties

    private var interfaceStyle: UIUserInterfaceStyle {
        return switch self {
        case .dark: .dark
        case .light: .light
        }
    }

    /// The trait collection matching the mode.
    public var traitCollection: UITraitCollection {
        return .init(
            traitsFrom: [
                .init(userInterfaceStyle: self.interfaceStyle)
            ]
        )
    }

    /// The suffix added to the snapshot name.
    public var suffix: String {
        return self.rawValue
    }
}
